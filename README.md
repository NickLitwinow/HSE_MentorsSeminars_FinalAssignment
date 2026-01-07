# Итоговая домашняя работа: Trino + PostgreSQL + MySQL + Iceberg

**Автор:** Литвинов Никита Антонович, группа МИНДА 241  
**Преподаватель:** Влад Шевченко

## Описание проекта

Данный проект представляет собой решение итоговой домашней работы по курсу "Семинары менторов". 
Проект демонстрирует работу с федеративным движком Trino, подключение к нескольким источникам данных 
(PostgreSQL, MySQL) и сохранение агрегированных данных в Iceberg.

## Структура проекта

```
├── docker-compose.yml           # Конфигурация Docker-сервисов
├── trino/
│   └── etc/
│       └── catalog/
│           ├── postgresql.properties   # Коннектор PostgreSQL
│           ├── mysql.properties         # Коннектор MySQL
│           └── iceberg.properties       # Коннектор Iceberg
├── init-scripts/
│   ├── postgres-init.sql        # Инициализация PostgreSQL
│   └── mysql-init.sql           # Инициализация MySQL
└── final_homework.ipynb         # Jupyter Notebook с решением
```

## Требования

- Docker и Docker Compose
- Python 3.8+
- Jupyter Notebook

## Запуск

1. Запустите инфраструктуру:
   ```bash
   docker-compose up -d
   ```

2. Дождитесь готовности всех сервисов (1-2 минуты):
   ```bash
   docker-compose ps
   ```

3. Откройте Jupyter Notebook:
   ```bash
   jupyter notebook final_homework.ipynb
   ```

## Сервисы

| Сервис | Порт | Описание |
|--------|------|----------|
| Trino | 8080 | Федеративный SQL-движок |
| PostgreSQL | 5432 | База данных с заказами клиентов |
| MySQL | 3306 | База данных с товарами и продажами |
| MinIO | 9000/9001 | S3-совместимое хранилище для Iceberg |
| Hive Metastore | 9083 | Метаданные для Iceberg |

## Данные

### PostgreSQL (analytics)
- **customers**: информация о клиентах (15 записей)
- **orders**: заказы клиентов (39 записей, январь-июль 2024)

### MySQL (sales_db)
- **categories**: категории товаров (6 записей)
- **products**: каталог товаров (22 записи)
- **sales**: данные о продажах (45 записей, январь-июнь 2024)

## Уровни задания

- ✅ **Уровень 1**: Подключение к Trino, вывод схем и таблиц PostgreSQL/MySQL
- ✅ **Уровень 2**: Агрегирующие SQL-запросы, работа с pandas DataFrame
- ✅ **Уровень 3**: Визуализация данных, сохранение в Iceberg