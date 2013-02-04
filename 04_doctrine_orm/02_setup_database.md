Setting up database
==================

---

##Configuring the database

    # app/config/parameters.yml
    parameters:
        database_driver:    pdo_mysql
        database_host:      localhost
        database_name:      supinfail
        database_user:      root
        database_password:  null

    # ...

    $ php app/console doctrine:database:create

---

*Wait a minute*

    $ mysql -u root  
    $ USER supinfail;  
    $ SHOW TABLE STATUS \G  

*FFFUUUUUU, default character-set is `latin1` !*

    #/etc/mysql/my.cnf
    [mysqld]
    collation-server = utf8_general_ci
    character-set-server = utf8  

    $ php app/console doctrine:database:drop --force
    $ php app/console doctrine:database:create

---

##Creating an entity class

    $ php app/console doctrine:generate:entity --entity="WebBundle:Fail"
    $ php app/console doctrine:generate:entities WebBundle
    $ php app/console doctrine:schema:update --force
    
##Practice

*Do it now* Samuel Lee Jackson Pulp Fiction.jpg
