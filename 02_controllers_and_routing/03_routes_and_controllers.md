# Routes and controllers

---

# The simplest route/controller

*app/config/routing.yml*

    !yaml
    homepage:
        pattern:  /homepage
        defaults: { _controller: AcmeDemoBundle:Hello:index }

*src/Acme/DemoBundle/Controller/HelloController.php*

    !php
    <?php

    namespace Acme\DemoBundle\Controller;

    use Symfony\Component\HttpFoundation\Response;

    class HelloController
    {
        public function indexAction()
        {
            return new Response('<html><body>Hello visitor!</body></html>');
        }
    }

.

    !bash
    $ curl http://localhost/labo-web-sf2/web/app_dev.php/homepage
    <html><body>Hello visitor!<body></html>

---

# Route placeholders

*src/Acme/DemoBundle/Controller/HelloController.php*

    !yaml
    hello:
        pattern:  /hello/{name}
        defaults: { _controller: AcmeDemoBundle:Hello:hello }

*src/Acme/DemoBundle/Resources/config/routing.yml*

    !php
    public function helloAction($name)
    {
        return new Response('<html><body>Hello ' . $name . '!</body></html>');
    }
.

    !bash
    $ curl http://localhost/labo-web-sf2/web/app_dev.php/hello/Adrien
    <html><body>Hello Adrien!</body></html>

---

# Route annotations

The routes need to be imported to be active as any other routing resources

*app/config/routing.yml*

    !yaml
    hello:
        resource: "@AcmeDemoBundle/Controller/HelloController.php"
        type:     annotation

*src/Acme/DemoBundle/Controller/HelloController.php*

    !php
    use Symfony\Bundle\FrameworkBundle\Controller\Controller;
    // You need to import the annotations
    use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

    class HelloController extends Controller
    {
        /**
         * @Route("/hello/{name}", name="_hello")
         */
        public function helloAction($name)
        {
            ...
        }
    }
