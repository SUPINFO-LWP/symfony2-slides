# Theory

---

# Watizit ?

*   Open Source distributed PHP framework
*   Architecture pattern : Model View Controller

---

# History

*   Sensio Labs : french web agency
*   1.0 released in October 2005, 1.4 released October 2009
*   Fabien Potencier and François Zaninotto

---

# Why use Symfony2

*   Better, Faster, Stronger
*   Structuring development
*   Reusing of generic modules
*   Standard development rules

---

# Architecture

*Default project structure*

    app/
        AppKernel.php
        autoload.php
        console
        config/
        Resources/
        logs/
        cache/
    src/
        YourNamespace/YourBundle
    vendor/
    web/

---

# Development environment

*   HTTP server
*   PHP interpreter
*   Database server

$ sudo aptitude install apache2 php5 libphp5 mysql-server curl git
$ curl -s https://getcomposer.org/installer | php
$ sudo mv composer.phar /usr/bin/composer
$ cd /home/name/Sites/
$ composer create-project symfony/framework-standard-edition path/ 2.1.7
$ cd projectName
$ php app/check.php
