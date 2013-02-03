# Environment

---

# ![Linux](http://cdn.memegenerator.net/instances/400x/34272970.jpg)

---

# Vagrant presentation

![Vagrant](http://www.vagrantup.com/images/logo_vagrant-81478652.png)

> Create and configure lightweight, reproducible, and portable development environments.

Vagrant in a nutshell:

1. Download vagrant & virtualbox
2. Download a *Vagrantfile*
3. Run `vagrant up`
4. Wait 10-15 mn, have a dev environment working

---

# Let's setup our environment

---

# 1. Vagrant & VirtualBox installation

Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://downloads.vagrantup.com/).

---

# 2. Download Symfony standard edition

Download the latest symfony 2 standard edition on [github](https://github.com/symfony/symfony-standard/tags) (v2.1.*).

Unzip it somewhere you like.

    !bash
    adrienbrault at adrienbrault-mbp in symfony-standard-2.1.7
    $ ll
    total 576768
    -rw-r--r--   1 adrienbrault  staff       1065 Jan 17 14:10 LICENSE
    -rw-r--r--   1 adrienbrault  staff       6026 Jan 17 14:10 README.md
    -rw-r--r--   1 adrienbrault  staff       8131 Jan 17 14:10 UPGRADE.md
    drwxr-xr-x  14 adrienbrault  staff        476 Jan 17 14:10 app
    -rw-r--r--   1 adrienbrault  staff       1725 Jan 17 14:10 composer.json
    -rw-r--r--   1 adrienbrault  staff      43497 Jan 17 14:10 composer.lock
    drwxr-xr-x   4 adrienbrault  staff        136 Jan 17 14:10 src
    drwxr-xr-x   9 adrienbrault  staff        306 Jan 17 14:10 web

---

# 3. Download the vagrant configuration

Download the last vagrant configuration on [github](https://github.com/SUPINFO-LWP/symfony2-vagrant/tags).
Inside our symfony application, create a vagrant folder and unzip it inside.

Vagrant config powered by [vmg.slynett.com](http://vmg.slynett.com/).

Everything you'd need:

* PHP 5.4, PHPUnit, Xdebug/Apc/Etc PHP extensions, composer
* MySQL
* Friendly shell (oh-my-zsh) and vim configuration
* Node.js / Java

---

# 4. Start the VM

* `vagrant up` starts the VM
* `vagrant suspend` stop the VM in the current state
* `vagrant destroy` removed the VM
* `vagrant ssh` to ssh into the VM (windows users, use putty, vagrant@11.11.11.11 with vagrant password)

---

# Get your last tools

**Text editor**:

* [PHPStorm](http://www.jetbrains.com/phpstorm/)
* [Sublime Text 2](http://www.sublimetext.com/)
* [VIM](http://www.vim.org/about.php)

**Terminal**:

* [Putty](http://www.putty.org/) on *Windows*
* [iTerm 2](http://www.iterm2.com/) on *Mac OS* or the built in terminal
* The thing you use to boot your computer on *linux*
