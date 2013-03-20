# Render a Twig template from a controller

---

# How to use it ?

Bundle directory structure:

	!bash

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

*All your twig files will belong to YourBundle/Resources/views/YourControler/exemple.html.twig*

---

# Render a Twig template from a controller

    !php

    return $this->render('NamespaceYourBundle:YourController:exemple.html.twig', array(
            'variable' => $variable,
    ));
