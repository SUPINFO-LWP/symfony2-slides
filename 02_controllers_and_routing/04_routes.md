# Mapping URLs

    !yaml
    # app/config/routing.yml
    hello:
        pattern:  /hello/{name}
        defaults: { _controller: AcmeHelloBundle:Hello:index }

Going to `/hello/bryan` now executes the `HelloController::indexAction()` controller and passes in `bryan` for the `$name` variable.

---

# Tunning Routes

    !yaml
    # app/config/routing.yml
    blog:
        pattern:  /blog/{page}
        defaults: { _controller: AcmeBlogBundle:Blog:index, page: 1 }

    blog_show:
        pattern:  /blog/{slug}
        defaults: { _controller: AcmeBlogBundle:Blog:show }

---

# Adding a simple requirement

    !yaml
    # app/config/routing.yml
    blog:
        pattern:  /blog/{page}
        defaults: { _controller: AcmeBlogBundle:Blog:index, page: 1 }
        requirements:
            page: \d+

    blog_show:
        pattern:  /blog/{slug}
        defaults: { _controller: AcmeBlogBundle:Blog:show }

Earlier route always win.

---

# Adding a HTTP requirement

    !yaml
    # app/config/routing.yml
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

    !yaml
    # app/config/routing.yml
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

    !yaml
    # app/config/routing.yml
    article_show:
        pattern: /articles/{culture}/{year}/{title}.{_format}
        defaults: { _controller: AcmeDemoBundle:Article:show, _format: html }
        requirements:
            culture: en|fr
            _format: html|rss
            year: \d+


The special `_format` routing parameter becomes the `Request object`.
ex : _controller
     _format
     _locale
