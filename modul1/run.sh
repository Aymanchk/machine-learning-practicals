#!/usr/bin/env bash
# Автор: Эркинбеков Айман
# Запуск модуля 1 одной командой: bash modul1/run.sh
# Скрипт создаёт виртуальное окружение, ставит библиотеки из requirements.txt,
# выполняет notebook и сохраняет вывод в evidence/, а графики в images/.
set -euo pipefail

cd "$(dirname "$0")"
mkdir -p evidence images

{
echo "== Проверка Python =="
# На чистой Ubuntu может не быть python3 и модуля venv: ставим их через apt
if ! command -v python3 >/dev/null 2>&1 || ! python3 -c "import ensurepip" >/dev/null 2>&1; then
    echo "python3 или python3-venv не найден, ставлю через apt-get"
    SUDO=""
    if [ "$(id -u)" -ne 0 ]; then SUDO="sudo"; fi
    $SUDO apt-get update -qq
    DEBIAN_FRONTEND=noninteractive $SUDO apt-get install -y -qq python3 python3-venv python3-pip >/dev/null
fi
python3 --version

echo "== Виртуальное окружение и библиотеки =="
python3 -m venv .venv
.venv/bin/python -m pip install -q --upgrade pip
.venv/bin/python -m pip install -q -r requirements.txt
.venv/bin/python -m pip freeze | grep -i -E "^(pandas|numpy|scikit-learn|matplotlib|nbconvert)=="

echo "== Выполнение notebook (около минуты) =="
.venv/bin/jupyter nbconvert --to notebook --execute --inplace \
    --ExecutePreprocessor.timeout=1200 notebooks/project3_income.ipynb

echo "== Сохранение вывода ячеек и графиков =="
.venv/bin/python - <<'PY'
# Достаём из выполненного notebook текстовый вывод и картинки
import base64
import json

nb = json.load(open("notebooks/project3_income.ipynb", encoding="utf-8"))
lines = []
image_names = {
    13: "a_confusion_matrix.png",
    28: "b_threshold.png",
    30: "b_final_confusion_matrix.png",
    38: "c_errors_by_group.png",
}
errors = 0
for i, cell in enumerate(nb["cells"]):
    if cell["cell_type"] != "code":
        continue
    lines.append(f"===== Ячейка {i} =====")
    for out in cell.get("outputs", []):
        if out["output_type"] == "error":
            errors += 1
            lines.append("ОШИБКА: " + out["ename"] + ": " + out["evalue"])
        elif out["output_type"] == "stream":
            lines.append("".join(out["text"]).rstrip())
        else:
            data = out.get("data", {})
            if "image/png" in data:
                name = image_names.get(i)
                if name:
                    with open("images/" + name, "wb") as f:
                        f.write(base64.b64decode(data["image/png"]))
                    lines.append(f"[график сохранён в images/{name}]")
                else:
                    lines.append("[график]")
            elif "text/plain" in data:
                lines.append("".join(data["text/plain"]).rstrip())

with open("evidence/notebook_output.txt", "w", encoding="utf-8") as f:
    f.write("\n".join(lines) + "\n")
print("Ошибок в ячейках:", errors)
if errors:
    raise SystemExit(1)
PY

echo "== Готово =="
echo "Вывод ячеек: evidence/notebook_output.txt"
echo "Графики: images/"
} 2>&1 | tee evidence/run_log.txt
