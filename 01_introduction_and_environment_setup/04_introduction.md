# Basics

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
