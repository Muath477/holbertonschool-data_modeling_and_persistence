SELECT authors.name AS author_name, books.title AS title
FROM authors
LEFT JOIN books ON books.author_id = authors.id
ORDER BY author_name ASC, title ASC;
