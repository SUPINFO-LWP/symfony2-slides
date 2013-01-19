# Routing

---

# Adding a simple requirement

*app/config/routing.yml*

    !yaml
    home:
        pattern:  /
        defaults: { _controller: AcmeBlogBundle:Blog:index }

    hello:
        pattern:  /hello/{name}
        defaults: { _controller: AcmeBlogBundle:Hello:hello }

First matched route always win.

What will this return ?

    !bash
    $ curl http://localhost/app_dev.php/hello/Adrien

---

# Adding a HTTP requirement

*app/config/routing.yml*

    !yaml
    contact:
        pattern:  /contact
        defaults: { _controller: AcmeDemoBundle:Main:contact }
        requirements:
            _method: GET

    contact_process:
        pattern:  /contact
        defaults: { _controller: AcmeDemoBundle:Main:contactProcess }
        requirements:
            _method: POST

Run

    !bash
    $ php app/console router:debug

---

# Adding a language requirement

*app/config/routing.yml*

    !yaml
    homepage:
        pattern:  /{culture}
        defaults: { _controller: AcmeDemoBundle:Main:homepage, culture: en }
        requirements:
            culture: en|fr

/   {culture} = en

/en {culture} = en

/fr {culture} = fr

/es won't match this route

---

# Advanced Routing Example

*app/config/routing.yml*

    !yaml
    article_show:
        pattern: /articles/{culture}/{year}/{title}.{_format}
        defaults: { _controller: AcmeDemoBundle:Article:show, _format: html }
        requirements:
            culture: en|fr
            _format: html|rss
            year: \d+


The special `_format` routing parameter becomes the `Request object`.


Exemple :

_controller

_format

_locale
