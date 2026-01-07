# NoSQL Database Analysis

## Section A: Limitations of RDBMS

Relational Database Management Systems (RDBMS) such as MySQL are designed for structured and fixed data models. They work well when all records follow the same structure, but they struggle when products have different attributes. For example, electronic products may require specifications like RAM, processor, and storage, while clothing products may require size, color, and fabric type. Representing this variation in RDBMS requires many nullable columns or separate tables, which increases complexity.

Another limitation of RDBMS is frequent schema changes. When new product types or attributes are introduced, the database schema must be altered. These changes can affect existing applications and reduce system flexibility.

Storing customer reviews is also challenging in relational databases. Reviews often contain nested information such as user details, ratings, comments, and dates. To store this data, multiple tables and joins are required, which increases query complexity and impacts performance.

---

## Section B: Benefits of NoSQL (MongoDB)

MongoDB addresses the limitations of RDBMS by using a flexible document-based data model. In MongoDB, data is stored as JSON-like documents, allowing different products to have different attributes without modifying the database schema. This makes it suitable for applications with diverse and evolving data requirements.

MongoDB also supports embedded documents. Customer reviews can be stored directly inside the product document as an array, making data retrieval simpler and faster. This eliminates the need for complex joins that are common in relational databases.

Another key benefit of MongoDB is horizontal scalability. MongoDB supports sharding, which allows data to be distributed across multiple servers. This enables the database to handle large volumes of data and high traffic efficiently.

---

## Section C: Trade-offs of Using MongoDB

One disadvantage of MongoDB is the lack of strict schema enforcement. Because the schema is flexible, inconsistent or incomplete data can be stored if proper validation is not implemented.

Another drawback is that relational databases handle complex joins and transactions more efficiently. Although MongoDB supports transactions, RDBMS systems like MySQL are better suited for applications that require strong consistency and complex relational queries. Therefore, MongoDB should be chosen based on the nature of the application.
