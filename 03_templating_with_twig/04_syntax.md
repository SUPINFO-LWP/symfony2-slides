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

## Maths

*   `{{ 5 + 5 }}` = 10  
*   `{{ 7 - 4 }}` = 3
*   etc...

---

## Logic

    !twig
    {% if ( user.active != 0 ) and ( user.role == 'admin' ) %}
        {{ True }}
    {% endif %}}

---
