# Controllers and Routing

---

# Advanced Routing Exemple

    !yml
    article_show:
      pattern:  /articles/{culture}/{year}/{title}.{_format}
      defaults: { _controller: AcmeDemoBundle:Article:show, _format: html }
      requirements:
          culture:  en|fr
          _format:  html|rss
          year:     \d+
          

The special `_format` routing parameter becomes the `Request object`.
ex : _controller
     _format
     _locale
