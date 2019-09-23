| Table         | Column         | Datatype |
| ------------- |:--------------:| -----:   |
|               | id             | integer  |
|users          | name           |  string  |
|               | email          |  string  |
|               | password       |  string  |
|               | timestamps     |  date    |
| Table         | Column         | Datatype |
| ------------- |:--------------:| -----:   |
|               | id             |  integer |
|   profiles    | user_id        |  integer |
|               | image          |  text    |
|               | timestamps     |  date    |
| Table         | Column         | Datatype |
| ------------- |:------------- :| -----:   |
|               | id             |  integer |
|               | user_id        |  integer |
|tasks          | title          |  text    |
|               | content        |  string  |
|               | start_date     |  date    |
|               | end_date       |  date    |
|               | timestamps     |  date    |