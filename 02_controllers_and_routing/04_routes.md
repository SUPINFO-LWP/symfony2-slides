# Routing

---

# Adding a simple requirement

*app/config/routing.yml*

    !yaml
    home:
        pattern:  /
        defaults: { _controller: AcmeDemoBundle:Blog:index }

    hello:
        pattern:  /hello/{name}
        defaults: { _controller: AcmeDemoBundle:Hello:hello }

First matched route always win.  

What will this return ?

    !bash
    $ curl http://localhost/labo-web-sf2/web/app_dev.php/hello/Adrien

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

`/articles/en/2010/amazing-title.html` matches
`/articles/en/2010/amazing-title` matches
`/articles/de/2010/amazing-title.html` doesn't match

---

# Debug tip

    !bash
    $ php app/console router:debug
    [router] Current routes
    Name                      Method Pattern
    _welcome                  ANY    /
    _demo_login               ANY    /demo/secured/login
    _security_check           ANY    /demo/secured/login_check
    _demo_logout              ANY    /demo/secured/logout
    acme_demo_secured_hello   ANY    /demo/secured/hello
    _demo_secured_hello       ANY    /demo/secured/hello/{name}
    _demo_secured_hello_admin ANY    /demo/secured/hello/admin/{name}
    _demo                     ANY    /demo/
    _demo_hello               ANY    /demo/hello/{name}
    _demo_contact             ANY    /demo/contact
    _wdt                      ANY    /_wdt/{token}
    _profiler_search          ANY    /_profiler/search
    _profiler_purge           ANY    /_profiler/purge
    _profiler_info            ANY    /_profiler/info/{about}
    _profiler_import          ANY    /_profiler/import
    _profiler_export          ANY    /_profiler/export/{token}.txt
    _profiler_phpinfo         ANY    /_profiler/phpinfo
    _profiler_search_results  ANY    /_profiler/{token}/search/results
    _profiler                 ANY    /_profiler/{token}
    _profiler_redirect        ANY    /_profiler/
    _configurator_home        ANY    /_configurator/
    _configurator_step        ANY    /_configurator/step/{index}
    _configurator_final       ANY    /_configurator/final
