# Syntax

---

# Delimiters

`{% ... %}` is used to execute statements (if else, for, while, etc...).  
`{{ ... }}` is used to display the result of an expression to the template.  
`{# ... #}` is used to comment the code.

---

# Variables 

## Display

*Both display the attribute `bar` of the variable `foo`*  
`{{ foo.bar }}` and `{{ foo['bar'] }}`  

*Equivalent to the non-working foo.data-foo*  
`{{ attribute(foo, 'data-foo') }}`  

On the PHP layer twig will check :
*   if foo is an array and bar a valid element;
*   if not, and if foo is an object, check that bar is a valid property;
*   if not, and if foo is an object, check that bar is a valid method (even if bar is the constructor - use __construct() instead);
*   if not, and if foo is an object, check that getBar is a valid method;
*   if not, and if foo is an object, check that isBar is a valid method;
*   if not, return a null value.  

foo['bar'] on the other hand only works with PHP arrays:
*   check if foo is an array and bar a valid element;
*   if not, return a null value.  

## Set

*You can assign values to variables inside code blocks with the `set` tag*  
`{% set foo = 'foo' %}`  
`{% set foo = [1, 2] %}`  
`{% set foo = {'foo': 'bar'} %}`  

---

# Filters

*   Used to modify variables
*   Separeted by a pipe `|`
*   Arguments between parentheses `()`

*This removes all HTML tags from the name and title-cases it*  
`{{ name|striptags|title }}`  

*This will join a list by commas*  
`{{ list|join(', ') }}`  

*This will apply the `filter` `upper` to a section of code*

    !twig
    {% filter upper %}
        This text becomes uppercase
    {% endfilter %}

---

# Functions

*This is a simple loop*

    !twig
    {% for i in range(0, 10) %}
        {{ i }},
    {% endfor %}
    
http://twig.sensiolabs.org/doc/functions/index.html

---

# Named arguments

*Simple named argument exemple*

    !twig
    {% for i in range(low=1, high=10, step=2) %}
        {{ i }},
    {% endfor %}
    
*Using named argument for a better maintainability*

    !twig
    {{ data|convert_encoding('UTF-8', 'iso-2022-jp') }}
    {# versus #}
    {{ data|convert_encoding(from='iso-2022-jp', to='UTF-8') }}

*Skip an argument*

    !twig
    {{ "now"|date(null, "Europe/Paris") }}
    {{ "now"|date(timezone="Europe/Paris") }}

*Both work*

    !twig
    {{ "now"|date('d/m/Y H:i', timezone="Europe/Paris") }}
    {{ "now"|date(timezone="Europe/Paris", 'd/m/Y H:i') }}
    
---

# Control structure

*Displays all users in an array named `users`*

    !twig
    <h1>Members</h1>
    <ul>
        {% for user in users %}
            <li>{{ user.username }}</li>
        {% endfor %}
    </ul>
    
*Displays the block only if the array `users` is not empty*

    !twig
    {% if users|length > 0 %}
        <ul>
            {% for user in users %}
                <li>{{ user.username|e }}</li>
            {% endfor %}
        </ul>
    {% endif %}
    
---

# Comments

*You can disable a section of code using comments*

    !twig
    {# note: disabled template because blablabla...
        {% for user in users %}
            ...
        {% endfor %}
    #}

---

# Includes other templates

*This will include `sidebar.html` in the current template*

    !twig
    {% include 'sidebar.html' %}
    {% include "sections/articles/sidebar.html" %}
    
*The included template render_box.html is able to access box*

    !twig
    {% for box in boxes %}
        {% include "render_box.html" %}
    {% endfor %}

---

# Template Inheritance

*A simple skeleton template*

    !twig
    <!DOCTYPE html>
    <html>
        <head>
            {% block head %}
                <link rel="stylesheet" href="style.css" />
                <title>{% block title %}{% endblock %} - My Webpage</title>
            {% endblock %}
        </head>
        <body>
            <div id="content">
                {% block content %}{% endblock %}
            </div>
            
            <div id="footer">
                {% block footer %}
                    &copy; Copyright 2011 by <a href="http://domain.invalid/">you</a>.
                {% endblock %}
            </div>
        </body>
    </html>

*A child template might look like this*
    
    {% extends "base.html" %}
    
    {% block title %}Index{% endblock %}
    {% block head %}
        {{ parent() }}
        <style type="text/css">
            .important { color: #336699; }
        </style>
    {% endblock %}
    {% block content %}
        <h1>Index</h1>
        <p class="important">
            Welcome to my awesome homepage.
        </p>
    {% endblock %}

---

# Escaping

By default in Symfony2, Twig escapes variables automaticly

*You can set the `autoescape` to `false` globaly in `app/config/config.yml`*

    !yamel
    twig:
        autoescape: false
        
*This will render the output without escaping*  
`{{ user.username|raw }}`

*and this will render the output escaped if the autoescape is not activated*  
`{{ user.username|e }}`

*This will escapes HTML in block*

    !twig
    {% autoescape %}
        Everything will be automatically escaped in this block (using the HTML strategy)
    {% endautoescape %}

*and this escaped Javascript*

    !twig
    {% autoescape 'js' %}
        Everything will be automatically escaped in this block (using the JS strategy)
    {% endautoescape %}

*Escaping Twig delimiters*

    !twig
    <p>'{{'</p>
    
---

# Macros

Do not reinvent the wheel.

*A macro that renders a form element*

    !twig
    {% macro input(name, value, type, size) %}
        <input type="{{ type|default('text') }}" name="{{ name }}" value="{{ value|e }}" size="{{ size|default(20) }}" />
    {% endmacro %}


*A macro is defined outside the template and imported*

    {% import "forms.html" as forms %}
    
    <p>{{ forms.input('username') }}</p>

*Import an individual macro names from a template into the current namespace*

    {% from 'forms.html' import input as input_field %}
    
    <dl>
        <dt>Username</dt>
        <dd>{{ input_field('username') }}</dd>
        <dt>Password</dt>
        <dd>{{ input_field('password', '', 'password') }}</dd>
    </dl>


*A default value can also be defined for macro arguments*

    {% macro input(name, value = "", type = "text", size = 20) %}
        <input type="{{ type }}" name="{{ name }}" value="{{ value|e }}" size="{{ size }}" />
    {% endmacro %}
    
---

# Expressions

*   b-and, b-xor, b-or
*   or, and
*   ==, !=, <, >, >=, <=
*   in, ..
*   +, -, ~, *, /, //, %
*   is, and **

---

$ php app/console twig:lint @AcmeArticleBundle
    
    
    
