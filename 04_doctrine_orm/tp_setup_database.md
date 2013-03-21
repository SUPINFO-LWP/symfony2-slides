Setting up database
==================

---

##Configuring the database

    !yaml

    # app/config/parameters.yml

    parameters:
        database_driver:    pdo_mysql
        database_host:      localhost
        database_name:      supinfail
        database_user:      root
        database_password:  null

    # ...

.

    !bash

    $ php app/console doctrine:database:create

---

![philosoraptor](http://i0.kym-cdn.com/photos/images/original/000/085/283/philosoraptor.jpg?1291090164)

*Wait a minute*

---

    !bash

    $ mysql -u root  
    $ USE supinfail;  
    $ SHOW VARIABLES LIKE "character_set_database";
    $ SHOW VARIABLES LIKE "collation_database";

![rageFU](http://i0.kym-cdn.com/photos/images/original/000/000/578/1234931504682.jpg)

*FFFUUUUUU, default character-set is `latin1` !*

---

    !yaml
    
    #/etc/mysql/my.cnf

    [mysqld]
    collation-server = utf8_general_ci
    character-set-server = utf8  

.

    !bash

    $ php app/console doctrine:database:drop --force
    $ php app/console doctrine:database:create

---

##Creating an entity class

    !bash

    $ php app/console doctrine:generate:entity

---

##Creating entities

    !bash

    $ php app/console doctrine:generate:entities WebBundle
    $ php app/console doctrine:schema:create

*if the schema have already been created...*

    !bash

    $ php app/console doctrine:schema:update --force
