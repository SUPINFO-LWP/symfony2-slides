# Syntax

---

# Delimiters

`{% ... %}` is used to execute statements (if else, for, while, etc...).
`{{ ... }}` is used to display the result of an expression to the template.

---

# Variables 

`{{ foo.bar }}` and `{{ foo['bar'] }}`  
Both display the attribute `bar` of the variable `foo`.  

{# equivalent to the non-working foo.data-foo #}
{{ attribute(foo, 'data-foo') }}

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
