- https://www.codeschool.com/courses/try-sql


- Structured versus unstructured data
- SQL as a language
  - CREATE tables
    - create table people(name string, age integer, address string);
  - INSERT rows
    - insert into people values("Gavin", 45, "123 Elm Street");
  - SELECT rows
    - select * from people;
    - select name from people;
  - UPDATE rows
    - update people set address = "456 Palm Street" where name = "Gavin";
  - DELETE rows
    - delete from people where name = "Gavin";
- Multiple tables & joins
  - See queries.sql

- Visual explaination of a join:
  - [https://blog.codinghorror.com/a-visual-explanation-of-sql-joins/](https://blog.codinghorror.com/a-visual-explanation-of-sql-joins/)
  - [http://www.sql-join.com](http://www.sql-join.com)

- SQL from code
  ```
  require "sqlite3"
  db = SQLLite3::Database.new("employee.db")
  rows = db.execute "select * from people"
  db.execute "select * from people".each do |row|
    p row
  end
  ```

- SQL Structure
  - http://www.dofactory.com/sql/tutorial
  - ^^ note, some of these might not work in SQLite3

- Visual demonstration of SQL (Ignore the "dummies" bit) - https://www.youtube.com/watch?v=VwxOgJ2A6sQ
