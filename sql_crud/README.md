# SQL - CRUD Operations

Practice with the relational model and the CRUD operations (INSERT, SELECT,
UPDATE, DELETE) on a single `books` table, using SQLite.

## Files

| Task | Files |
| --- | --- |
| 0. Create table | `0-create_table.sql` |
| 1. Insert data | `1-insert_data.sql` |
| 2. Select all | `2-select_all.sql` |
| 3. Select columns | `3-select_columns.sql` |
| 4. Filtering | `4-filter_by_genre.sql`, `4-filter_by_price.sql`, `4-filter_with_and.sql`, `4-filter_with_or.sql` |
| 5. Updating | `5-update_by_id.sql`, `5-update_by_condition.sql`, `5-update_with_and.sql` |
| 6. Deleting | `6-delete_by_id.sql`, `6-delete_by_condition.sql`, `6-delete_with_and.sql` |
| 7. Order and limit | `7-order_by_price_asc.sql`, `7-order_by_year_desc.sql`, `7-limit_results.sql`, `7-order_and_limit.sql` |
| 8. Aggregates | `8-count_books.sql`, `8-average_price.sql`, `8-max_stock.sql`, `8-total_stock.sql`, `8-min_price.sql` |
| 9. GROUP BY | `9-count_by_genre.sql`, `9-average_price_by_genre.sql`, `9-total_stock_by_genre.sql`, `9-count_by_author.sql` |
| 10. Integrative | `10-select_tech_books.sql` |

## Usage

```
sqlite3 my_database.db < 0-create_table.sql
sqlite3 my_database.db < 1-insert_data.sql
sqlite3 books_dataset.db < 4-filter_by_genre.sql
```
