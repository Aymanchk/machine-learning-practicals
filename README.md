# Практические работы по машинному обучению

**Студент:** Эркинбеков Айман

Каждая практическая работа находится в отдельной папке со своим описанием, данными и Jupyter Notebook.

## Практические работы

| Работа | Тема | Материалы |
| --- | --- | --- |
| № 1, вариант B | Настройка окружения и первичный анализ Tips | [Описание](practical-01/README.md) · [Notebook](practical-01/notebooks/pr1_tips_analysis.ipynb) |

## Структура

```text
practical-01/
├── README.md
├── data/tips.csv
└── notebooks/pr1_tips_analysis.ipynb
```

Следующие работы добавляются в папки `practical-02`, `practical-03` и далее. Предыдущие работы остаются в репозитории.

## Запуск

1. Создайте окружение в корне: `python3 -m venv .venv`.
2. Активируйте его на macOS/Linux: `source .venv/bin/activate`.
3. Установите библиотеки: `python -m pip install pandas numpy matplotlib jupyter scikit-learn ipykernel`.
4. Откройте notebook в VS Code и выберите ядро `.venv`.
5. Выполните Restart → Run All и сохраните файл с результатами.

Окружение `.venv` не загружается в Git. Данные читаются по относительным путям внутри каждой практической.
