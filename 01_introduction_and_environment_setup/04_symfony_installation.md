# Symfony installation

Start your VM and ssh into it

    !bash
    cd vagrant-php
    vagrant up
    vagrant ssh

Install your symfony2 app

    !bash
    cd /var/www/sites
    composer create-project symfony/framework-standard-edition labo-web-sf2

Check that the console is working

    !bash
    cd labo-web-sf2
    php app/console

---

Disable the dev protection and open [http://php.localhost/labo-web-sf2/web/app_dev.php](http://php.localhost/labo-web-sf2/web/app_dev.php)

    !bash
    # Disable the dev env protection
    sed -i "s/exit/\/\/exit/" web/app_dev.php
    sed -i "s/header/\/\/header/" web/app_dev.php

![Symfony 2 installed](http://i.imgur.com/Mzv0IKQ.png)

---

# Development

From your host open `vagrant-php/sites/labo-web-sf2` inside your favorite IDE/Text editor.

![Symfony app inside your IDE](http://i.imgur.com/imqzec2.png)
