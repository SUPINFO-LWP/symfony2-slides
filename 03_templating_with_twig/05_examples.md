# Case example

---

# From Controller...

Create your data inside your controller file and send it to your view

    !php

    public function indexAction()
    {
        $myArray = array(
            'id'        => 13,
            'title'     => 'My awesome title',
            'date'      => '1990-1-1',
            'author'    => array(
                            'firstname' => 'jean-claude',
                            'lastname'  => 'Van Damme',
            ),
            'content'   =>  "Ça sounds good, même si on frime comme on appelle
                            ça en France... là, j'ai un chien en ce moment à
                            côté de moi et je le caresse, et c'est très, très
                            beau d'avoir son propre moi-même ! Il y a un an,
                            je t'aurais parlé de mes muscles.",
        );

        return $this->render(
            'YourBundle:YourControllerName:index.html.twig',
            array(
                'myArray' => $myArray,
        ));
    }

---

# ...to the View

Display your data in your TWIG file

    !html

    {% extends '::base.html.twig' %}

    {% block content %}
        {# Display my data #}
        <h1>{{ myArray.title }}</h1>
        <p>
            by {{ myArray.author.firstname|capitalize }}
            @ {{ myArray.date|date("d/m/Y") }}
        </p>
        <p>{{ myArray.content }}</p>
    {% endblock %}

*That's it !*

---

# Extends & Blocks

---

# First inheritance level

*app/Resource/views/base.html.twig*

    !jinja

    {% extends '::base.html.twig' %}

    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>{% block title %}{% endblock %}</title>
            <!--[if lt IE 9]>
                <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
            <![endif]-->
            {% block stylesheets %}{% endblock %}
            <link rel="shortcut icon" href="{{ asset('favicon.ico') }}" />
        </head>

        <body>
            {% block body %}{% endblock %}
            {% block javascripts %}{% endblock %}
        </body>
    </html>

---

# Second inheritance level

*src/Namespace/YourBundle/Resource/views/layout.html.twig*

    !jinja

    {% extends '::base.html.twig' %}

    {% block stylesheets %}
        {% stylesheets 'bundles/web/css/*' filter='cssrewrite' %}
                <link rel="stylesheet" type="text/css" media="screen" href="{{ asset_url }}" />
        {% endstylesheets %}
    {% endblock %}

    {% block body %}
            <section id="wrapper">

*...*

---

*...*

    !jinja

                <header id="header">
                    <nav>
                        {% include 'YourBundle:Layout:navbar.html.twig' %}
                    </nav>
                </header>

                {% for flashMessage in app.session.flashbag.get('notice') %}
                    <div class="alert">
                        {{ flashMessage }}
                    </div>
                {% endfor %}

                <div id="content">
                    {% block content %}{% endblock %}
                </div>

                <aside id="sidebar">
                    {% block sidebar %}{% endblock %}
                </aside>

                <footer id="footer">
                    {% block footer %}{% endblock %}
                </footer>
            </section>
    {% endblock %}

*...*

---

    {% block javascripts %}
            <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
            {% javascripts '@WebBundle/Resources/public/js/*' %}
                <script type="text/javascript" src="{{ asset_url }}"></script>
            {% endjavascripts %}
    {% endblock %}


