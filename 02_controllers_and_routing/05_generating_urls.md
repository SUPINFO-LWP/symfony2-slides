# Generating URLs

---

# Simple URLs

The `match()` and `generate()` methods form a bi-directional system.

    !php
    $params = $router->match('/blog/my-blog-post');
    // array(
    //     'slug' => 'my-blog-post',
    //     '_controller' => 'AcmeBlogBundle:Blog:show',
    // )

    $uri = $router->generate('blog_show', array('slug' => 'my-blog-post'));
    // /blog/my-blog-post

---

# Absolute URLs

    !php
    $router->generate('blog_show', array('slug' => 'my-blog-post'), true);
    // http://www.example.com/blog/my-blog-post


    !php
    $router->getContext()->setHost('www.example.com');

---

# URLs with query string

*When generating absolute URLs for scripts*

    !php
    $router->generate('blog', array('page' => 2, 'category' => 'Symfony'));
    // /blog/2?category=Symfony

---

# Generating URLs from a template

    !html
    <a href="{{ path('blog_show', {'slug': 'my-blog-post'}) }}">
        Read this blog post.
    </a>

*or*

    !html
    <a href="{{ url('blog_show', {'slug': 'my-blog-post'}) }}">
      Read this blog post.
    </a>
