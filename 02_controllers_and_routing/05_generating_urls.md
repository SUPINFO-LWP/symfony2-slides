# Generating URLs

---

# Simple URLs

    !yaml
    # app/config/routing.yml
    blog_show:
        pattern: /posts/{slug}

In controllers that extend Symfony's base Controller, you can use the generateUrl() method

    !php
    $path = $this->generateUrl('blog_show', array(
        'slug' => 'my-blog-post',
    ));
    // $path = '/posts/my-blog-post'

.

    !php
    $path = $this->generateUrl('blog_show', array(
        'slug' => 'my-blog-post',
    ), true);
    // $path = 'http://php.localhost/posts/my-blog-post'

---

# URLs with query string

*When generating absolute URLs for scripts*

    !php
    $router->generate('blog', array('page' => 2, 'category' => 'Symfony'));
    // /blog/2?category=Symfony
