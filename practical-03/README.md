# Практическая работа № 3. Сборка пайплайна предобработки

ФИО: Эркинбеков Айман  
Вариант: B

Продолжаю работу с Titanic из второй практической.

## Данные

Использовал исходный train.csv. Целевая переменная: Survived.

[Источник на Kaggle](https://www.kaggle.com/datasets/amineipad/titanic-dataset)

## Что сделал

Разделил данные на train и test. Собрал ColumnTransformer с двумя пайплайнами:

- числовые признаки: заполнение медианой и RobustScaler;
- категориальные признаки: заполнение Unknown и OneHotEncoder.

Обучил предобработку только на train и применил к test через transform.

## Результат

После обработки train имеет размер (712, 13), test имеет размер (179, 13). Пропусков нет, число признаков совпадает.

Причины выбора обработки и проверки приведены в notebook.

## Файлы

- [Notebook](notebooks/pr3_titanic_preprocessing.ipynb)
- [Исходные данные](data/train.csv)

## Запуск

Открыть notebook в VS Code, выбрать общее окружение .venv и выполнить Restart, затем Run All.