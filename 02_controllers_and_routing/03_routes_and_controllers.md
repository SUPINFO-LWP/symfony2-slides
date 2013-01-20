# Routes and controllers

---

# The simplest route/controller

*app/config/routing.yml*

    !yaml
    homepage:
        pattern:  /homepage
        defaults: { _controller: AcmeHelloBundle:Hello:index }

*src/Acme/HelloBundle/Controller/HelloController.php*

    !php
    <?php

    namespace Acme\HelloBundle\Controller;

    use Symfony\Component\HttpFoundation\Response;

    class HelloController
    {
        public function indexAction()
        {
            return new Response('<html><body>Hello visitor!</body></html>');
        }
    }

*bash*

    !bash
    $ curl http://localhost/app_dev.php/homepage
    <html><body>Hello visitor!<body></html>

![Sponge Bob Imagination](../img/spongBobImagination.jpg)

---

# Route placeholders

*src/Acme/HelloBundle/Controller/HelloController.php*

    !yaml
    hello:
        pattern:  /hello/{name}
        defaults: { _controller: AcmeBlogBundle:Hello:hello }

*src/Acme/HelloBundle/Resources/config/routing.yml*

    !php
    public function helloAction($name)
    {
        return new Response('<html><body>Hello ' . $name . '!</body></html>');
    }

*bash*

    !bash
    $ curl http://localhost/app_dev.php/hello/Adrien
    <html><body>Hello Adrien!</body></html>

---

# Route annotations

*src/Acme/HelloBundle/Controller/HelloController.php*

    !php
    <?php

    namespace Acme\HelloBundle\Controller;

    use Symfony\Bundle\FrameworkBundle\Controller\Controller;
    // these import the "@Route" and "@Template" annotations
    use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
    use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

    class HelloController extends Controller
    {
        /**
         * @Route("/hello/{name}", name="_hello")
         * @Template()
         */
        public function helloAction($name)
        {
            return array('name' => $name);
        }
    }
