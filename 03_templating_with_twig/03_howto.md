# Render a Twig template from a controller

render->

# How to use it ?

Bundle directory structure:

	!bash
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

    All your twig files will belong to YourBundle/Resources/views/ControlerName/yourActionName.html.twig

---    

