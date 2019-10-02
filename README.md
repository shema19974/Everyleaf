| Table         | Column        | Datatype |
| ------------- |:-------------:| -----:   |
|               | id            | integer  |
|users          | name          |  string  |
|               | email         |  string  |
|               | password      |  string  |
|               | timestamps    |  date    |

| Table         | Column        | Datatype |
| ------------- |:-------------:| -----:   |
|               | id            |  integer |
|   profiles    | user_id       |  integer |
|               | image         |  text    |
|               | timestamps    |  date    |

| Table         | Column        | Datatype |
| ------------- |:-------------:| -----:   |
|               | id            |  integer |
|               | user_id       |  integer |
|tasks          | title         |  string  |
|               | content       |  text    |
|               | start_date    |  date    |
|               | end_date      |  date    |
|               | timestamps    |  date    |


How to deploy
---
-Firstly you have to create an account on heroku
-After creating an account, you link it with git by running the following command: heroku    login --interactive
-create an you create heroku application: heroku create
-You push on heroku by running : git push heroku master
-create the database that will run on heroku: heroku rake db:create
 