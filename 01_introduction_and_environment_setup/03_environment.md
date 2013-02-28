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

*Linux prerequisite : NFS*

    !bash
    sudo apt-get install nfs-common

---

# 2. Download the vagrant configuration

Download the vagrant config [on github](https://github.com/SUPINFO-LWP/vagrant-php). (based on [vmg.slynett.com](http://vmg.slynett.com/))

![](http://i.imgur.com/GO40a2M.png)

Everything you'd need in a PHP project:

* PHP 5.4, PHPUnit, Xdebug/Apc/Etc PHP extensions, composer
* MySQL
* Friendly shell (oh-my-zsh) and vim configuration
* Node.js / Java

---

# 3. Vagrant commands

* `vagrant up` starts the VM
* `vagrant suspend` stop the VM in the current state
* `vagrant destroy` removed the VM
* `vagrant ssh` to ssh into the VM (windows users, use putty, vagrant@11.11.11.11 with vagrant password)

So for now run

    !bash
    vagrant up

And add `11.11.11.11 php.localhost` to your hosts file (Unix: `/etc/hosts` Win: `%SystemRoot%\system32\drivers\etc\hosts`).

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
