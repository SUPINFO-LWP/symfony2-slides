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

    $ php app/console doctrine:generate:entity

   * Strings
      * string (used for shorter strings)
      * text (used for larger strings)
   * Numbers
      * integer
      * smallint
      * bigint
      * decimal
      * float
   * Dates and Times (use a DateTime object for these fields in PHP)
      * date
      * time
      * datetime
   * Other Types
      * boolean
      * object (serialized and stored in a CLOB field)
      * array (serialized and stored in a CLOB field)  

---

##Creating entities

    !bash

    $ php app/console doctrine:generate:entities WebBundle
    $ php app/console doctrine:schema:create

*if the schema have already been created...*

    !bash

    $ php app/console doctrine:schema:update --force
 
---

##Lifecycle Callbacks

    !php
    // ...

    /**
     * @ORM\Entity()
     * @ORM\HasLifecycleCallbacks()
     */
    class EntityName
    {
        // ...
    }

    // ...

    /**
     * @ORM\PrePersist
     */
    public function setCreatedValue()
    {
        $this->created = new \DateTime();
    }

    /**
     * @ORM\PrePersist
     */
    public function setUpdatedValue()
    {
        $this->updated = new \DateTime();
    }

    // ...

---    

   * preRemove
   * postRemove
   * prePersist
   * postPersist
   * preUpdate
   * postUpdate
   * postLoad
   * loadClassMetadata

---

##Practice

![badTime](http://weknowmemes.com/generator/uploads/generated/g136009871787922204.jpg)
