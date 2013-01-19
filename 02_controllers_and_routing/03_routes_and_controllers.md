# The simplest route/controller

    !php
    <?php // src/Acme/HelloBundle/Controller/HelloController.php

    namespace Acme\HelloBundle\Controller;

    use Symfony\Component\HttpFoundation\Response;

    class HelloController
    {
        public function indexAction()
        {
            return new Response('<html><body>Hello visitor!</body></html>');
        }
    }

.

    !yaml
    # app/config/routing.yml
    homepage:
        pattern:  /homepage
        defaults: { _controller: AcmeHelloBundle:Hello:index }

.

    !bash
    $ curl http://localhost/app_dev.php/homepage
    <html><body>Hello visitor!<body></html>

---

# Route placeholders

    !yaml
    hello:
        pattern:  /hello/{name}
        defaults: { _controller: AcmeBlogBundle:Hello:hello }

.

    !php
    public function helloAction($name)
    {
        return new Response('<html><body>Hello ' . $name . '!</body></html>');
    }

.

    !bash
    $ curl http://localhost/app_dev.php/hello/Adrien
    <html><body>Hello Adrien!</body></html>
