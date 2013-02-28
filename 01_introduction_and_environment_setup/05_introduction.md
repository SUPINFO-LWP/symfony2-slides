# Symfony2 introduction

---

# Directory structure

    !bash
    |-- app
    |   |-- cache
    |   |-- config
    |   |-- logs
    |   |-- Resources
    |   |-- AppCache.php
    |   |-- AppKernel.php
    |   |-- SymfonyRequirements.php
    |   |-- autoload.php
    |   |-- check.php
    |   |-- console
    |   `-- phpunit.xml.dist
    |-- src
    |   `-- Acme
    `-- web
        |-- bundles
        |-- app.php
        |-- app_dev.php
        |-- apple-touch-icon.png
        |-- config.php
        |-- favicon.ico
        `-- robots.txt
    |-- vendor
    |-- composer.json
    |-- composer.lock
    |-- LICENSE
    |-- README.md
    `-- UPGRADE.md

---

# Bundles

> A bundle is nothing more than a directory that houses everything related to a specific feature, including PHP classes,
> configuration, and even stylesheets and Javascript files.

[Source](http://symfony.com/doc/current/book/page_creation.html#before-you-begin-create-the-bundle)

*Some bundles example :*

   * [SonataAdminBundle](https://github.com/sonata-project/SonataAdminBundle)
   * [FOSUserBundle](https://github.com/FriendsOfSymfony/FOSUserBundle)
   * [FrameworkBundle](https://github.com/symfony/FrameworkBundle)
   * [SwiftmailerBundle](https://github.com/symfony/SwiftmailerBundle)

---

# Bundle directory structure

    !bash
    adrienbrault at adrienbrault-mbp in src/Acme/DemoBundle
    $ tree -L 2 .
    .
    |-- Command
    |   |-- AddUserCommand.php
    |-- Controller
    |   |-- DemoController.php
    |   |-- SecuredController.php
    |   `-- WelcomeController.php
    |-- DependencyInjection
    |   `-- AcmeDemoExtension.php
    |-- EventListener
    |   `-- ControllerListener.php
    |-- Form
    |   `-- ContactType.php
    |-- Resources
    |   |-- config
    |   |-- public
    |   `-- views
    |-- Tests
    |   `-- Controller
    `-- AcmeDemoBundle.php

---

# App Kernel

    !php
    <?php

    // app/AppKernel.php

    use Symfony\Component\HttpKernel\Kernel;
    use Symfony\Component\Config\Loader\LoaderInterface;

    class AppKernel extends Kernel
    {
        public function registerBundles()
        {
            ...
        }

        public function registerContainerConfiguration(LoaderInterface $loader)
        {
            $loader->load(__DIR__.'/config/config_'.$this->getEnvironment().'.yml');
        }
    }

---

# AppKernel::registerBundles

    !php
    public function registerBundles()
    {
        $bundles = array(
            new Symfony\Bundle\FrameworkBundle\FrameworkBundle(),
            new Symfony\Bundle\SecurityBundle\SecurityBundle(),
            new Symfony\Bundle\TwigBundle\TwigBundle(),
            new Symfony\Bundle\MonologBundle\MonologBundle(),
            new Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle(),
            new Symfony\Bundle\AsseticBundle\AsseticBundle(),
            new Doctrine\Bundle\DoctrineBundle\DoctrineBundle(),
            new Sensio\Bundle\FrameworkExtraBundle\SensioFrameworkExtraBundle(),
            new JMS\AopBundle\JMSAopBundle(),
            new JMS\DiExtraBundle\JMSDiExtraBundle($this),
            new JMS\SecurityExtraBundle\JMSSecurityExtraBundle(),
        );

        if (in_array($this->getEnvironment(), array('dev', 'test'))) {
            $bundles[] = new Acme\DemoBundle\AcmeDemoBundle();
            $bundles[] = new Symfony\Bundle\WebProfilerBundle\WebProfilerBundle();
            $bundles[] = new Sensio\Bundle\DistributionBundle\SensioDistributionBundle();
            $bundles[] = new Sensio\Bundle\GeneratorBundle\SensioGeneratorBundle();
        }

        return $bundles;
    }

---

# App's yaml config

    !yaml
    # app/config/config.yml

    imports:
        - { resource: parameters.yml }
        - { resource: security.yml }

    framework:
        #esi:             ~
        #translator:      { fallback: "%locale%" }
        secret:          "%secret%"
        router:
            resource: "%kernel.root_dir%/config/routing.yml"
            strict_requirements: "%kernel.debug%"
        form:            true
        csrf_protection: true
        validation:      { enable_annotations: true }
        templating:      { engines: ['twig'] } #assets_version: SomeVersionScheme
        default_locale:  "%locale%"
        trust_proxy_headers: false # Deprecated in 2.0; will be removed in 2.3 (used trusted_proxies instead)
        trusted_proxies: ~
        session:         ~

    twig:
        debug:            "%kernel.debug%"
        strict_variables: "%kernel.debug%"

    ...

---

# [composer](http://getcomposer.org/)

> Composer is a tool for dependency management in PHP. It allows you to declare the dependent libraries your project
> needs and it will install them in your project for you.

[Source](http://getcomposer.org/doc/00-intro.md#introduction)

*Dead simple*:

* Declare dependencies in `composer.json`
* Install dependencies with `composer install`
* Update dependencies with `composer update`
* List of exact bundles' version stored in `composer.lock`

---

# composer.json

    !json
    {
        "name": "symfony/framework-standard-edition",
        "description": "The \"Symfony Standard Edition\" distribution",
        "autoload": {
            "psr-0": { "": "src/" }
        },
        "require": {
            "php": ">=5.3.3",
            "symfony/symfony": "2.1.*",
            "doctrine/orm": ">=2.2.3,<2.4-dev",
            "doctrine/doctrine-bundle": "1.1.*",
            "twig/extensions": "1.0.*@dev",
            "symfony/assetic-bundle": "2.1.*",
            "symfony/swiftmailer-bundle": "2.1.*",
            "symfony/monolog-bundle": "2.1.*",
            "sensio/distribution-bundle": "2.1.*",
            "sensio/framework-extra-bundle": "2.1.*",
            "sensio/generator-bundle": "2.1.*",
            "jms/security-extra-bundle": "1.2.*",
            "jms/di-extra-bundle": "1.1.*",
            "kriswallsmith/assetic": "1.1.*@dev"
        },
        ...
    }

---

# Console application

    !bash
    $ php app/console
    Symfony version 2.1.7 - app/dev/debug

    Usage:
      [options] command [arguments]

    Options:
      --help           -h Display this help message.
      --quiet          -q Do not output any message.
      ...

    Available commands:
      help                                  Displays help for a command
      list                                  Lists commands
    assetic
      assetic:dump                          Dumps all assets to the filesystem
    assets
      assets:install                        Installs bundles web assets under a public web directory
    cache
      cache:clear                           Clears the cache
      cache:warmup                          Warms up an empty cache
    config
      config:dump-reference                 Dumps default configuration for an extension
    container
      container:debug                       Displays current services for an application
    doctrine
    ...

---

# Symfony 2 documentation

* [The book](http://symfony.com/doc/current/book/index.html) general topics **your new best friend**
* [Cookbooks](http://symfony.com/doc/current/cookbook/index.html) *tutorials* on how to do specific things
* [Bundles](http://symfony.com/doc/current/bundles/index.html) *officials* bundles doc
* [PSR-0](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-0.md) Code convention

![RTFM](http://i0.kym-cdn.com/photos/images/newsfeed/000/017/674/rtfm_by_noptic.png?1318992465)

---

# Don't fuck with angry Samuel

![SamuelLJ](http://i.qkme.me/3t6b6w.jpg)
