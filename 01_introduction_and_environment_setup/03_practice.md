# Practice

---

# Install LAMP

$ sudo aptitude install apache2 php5 libphp5 mysql-server curl git

---

# Install composer

$ curl -s https://getcomposer.org/installer | php  
$ sudo mv composer.phar /usr/bin/composer  

---

# Create a Symfony2 project

$ cd /home/name/Sites/  
$ composer create-project symfony/framework-standard-edition path/ 2.1.7  

---

# Check requirements

$ cd projectName  
$ php app/check.php  
