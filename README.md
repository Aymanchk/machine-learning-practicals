# Машинное обучение: практические работы

![Python](https://img.shields.io/badge/Python-3.13%2B-3776AB?logo=python&logoColor=white)
![scikit-learn](https://img.shields.io/badge/scikit--learn-1.9-F7931E?logo=scikitlearn&logoColor=white)
![pandas](https://img.shields.io/badge/pandas-3.1-150458?logo=pandas&logoColor=white)
![Jupyter](https://img.shields.io/badge/Jupyter-notebook-F37626?logo=jupyter&logoColor=white)

**Автор:** Эркинбеков Айман  
**Дисциплина:** «Машинное обучение», Международный колледж ИТ и бизнеса, Salymbekov University

В этом репозитории собраны мои практические работы по курсу. Работы идут по порядку тем курса: от первого знакомства с данными до ансамблевых моделей. Каждая работа лежит в своей папке: там есть README с описанием, данные и Jupyter notebook с кодом, графиками и выводами. Все работы выполнены на уровне **B** (основной).

## Работы

| № | Тема | Данные | Что сделано | Главный результат |
| :-: | --- | --- | --- | --- |
| 1 | [Настройка окружения и первый notebook](practical-01/README.md) | Tips | Осмотр данных, пропуски, статистики, 3 графика | 244 счёта, 66,8% записей приходятся на выходные |
| 2 | [Разведочный анализ (EDA)](practical-02/README.md) | Titanic | Типы признаков, выбросы по IQR, корреляции, дисбаланс классов | Список из 7 проблем данных и план их устранения |
| 3 | [Пайплайн предобработки](practical-03/README.md) | Titanic | `ColumnTransformer`: медиана + RobustScaler, `Unknown` + one-hot | Train (712, 13), test (179, 13), утечки нет |
| 4 | [Регрессионная модель](practical-04/README.md) | CO2 Emissions (Канада) | Линейная регрессия, VIF, сравнение трёх наборов признаков, остатки | На тесте MAE 2,26 г/км, R² 0,997 |
| 5 | [Классификатор и метрики](practical-05/README.md) | Titanic | Логистическая регрессия, ROC и PR-кривые, подбор порога по цене ошибки | При пороге 0,18 пропусков класса стало 1 вместо 17 |
| 6 | [Классификация текстов](practical-06/README.md) | Отзывы о фильмах (NLTK) | Очистка текста, стемминг, TF-IDF, наивный Байес, разбор ошибок | Accuracy 0,810, F1 0,813 |
| 7 | [Случайный лес](practical-07/README.md) | Titanic | Дерево против леса, OOB, `GridSearchCV`, важность признаков | ROC-AUC на кросс-валидации 0,882 против 0,763 у дерева |

### Индивидуальное задание

- [Матрица ошибок: анализ рентген-снимков, вариант 13](confusion-matrix-13/README.md): расчёт accuracy, precision, recall, specificity и F1 вручную и анализ снижения порога (recall вырос с 0,879 до 0,970).

## Модуль 1

- [Проект 3. Уровень дохода](modul1/README.md): командный проект по данным переписи США, блоки A, B и C. Логистическая регрессия и случайный лес, подбор порога, анализ утечек и ошибок. Итог на тесте: F1 0,722, recall 0,762. Запуск одной командой: `bash modul1/run.sh`.

## Структура репозитория

```text
.
├── README.md                  # этот файл
├── requirements.txt           # библиотеки с версиями
├── practical-01/              # одна папка = одна практическая работа
│   ├── README.md              #   описание, данные, выводы
│   ├── data/                  #   данные (уже лежат в репозитории)
│   └── notebooks/             #   notebook с кодом и результатами
├── practical-02/ … practical-07/
└── confusion-matrix-13/       # индивидуальное задание (только README с расчётами)
```

Все данные уже лежат в папках `data/`, ничего скачивать не нужно. Notebook читают данные по относительному пути `../data/...`, поэтому работают на любом компьютере.

## Как запустить

Нужен Python 3.13 или новее и Git.

**1. Скачать репозиторий**

```bash
git clone https://github.com/Aymanchk/machine-learning-practicals.git
cd machine-learning-practicals
```

**2. Создать окружение и установить библиотеки**

macOS и Linux:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
```

Windows (PowerShell):

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install -r requirements.txt
```

Окружение создаётся один раз. При следующем запуске достаточно снова его активировать.

**3. Открыть notebook**

- **VS Code:** открыть папку репозитория, затем нужный файл из `practical-XX/notebooks/`, выбрать ядро `.venv` и нажать **Restart**, затем **Run All**.
- **Jupyter:** выполнить `jupyter notebook` в корне репозитория и открыть нужный файл в браузере.

Вывод всех ячеек уже сохранён в файлах, поэтому результаты видны на GitHub и без запуска.

## Заметки

- Notebook ПР-6 и ПР-7 выполнялись на Python 3.13, остальные на Python 3.14. С версиями из `requirements.txt` в ПР-7 некоторые метрики могут отличаться в третьем знаке после запятой, выводы от этого не меняются.
- Подбор параметров в ПР-7 занимает около минуты.
- Датасеты взяты с Kaggle и из библиотеки NLTK, ссылки на источники есть в README каждой работы.
