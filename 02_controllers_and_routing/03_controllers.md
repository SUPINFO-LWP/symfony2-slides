# A Simple Controller

    !php
    <?php
    // src/Acme/HelloBundle/Controller/HelloController.php

    namespace Acme\HelloBundle\Controller;

    use Symfony\Component\HttpFoundation\Response;

    class HelloController
    {
        public function indexAction($name)
        {
            return new Response('<html><body>Hello '.$name.'!</body></html>');
        }
    }

