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

