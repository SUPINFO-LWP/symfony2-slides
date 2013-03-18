## Rendering your forms

---

##Easiest way


    <form action="{{ path('my_form_action') }}" method="post"{{ form_enctype(form) }}>
      {{ form_widget(form) }}
      <p><input type="submit" value="Add" /></p> 
    </form>
