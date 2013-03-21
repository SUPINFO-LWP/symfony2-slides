## Rendering your forms

---

##Easiest way

    !php
    
    <form action="{{ path('my_form_action') }}" method="post"{{ form_enctype(form) }}>
      {{ form_widget(form) }}
      <p><input type="submit" value="Add" /></p> 
    </form>

---
    !php
    
    <form action="/app_dev.php/fail/new" method="post">
        <div>
            <label for="supinfail_webbundle_failtype_content" class=" required">Content</label>
            <textarea id="supinfail_webbundle_failtype_content" name="supinfail_webbundle_failtype[content]" required="required"/>
            </textarea>
        </div>
        <p><input type="submit" value="Proposer" /></p> 
    </form>
    
---
## Display field by field

    !php
    
    {{ form_errors(form) }}
    {{ form_row(form.content) }}
    {{ form_rest(form) }}
---
## More detailed
    !php
    
    { form_errors(form) }}
    <div>
        {{ form_label(form.content) }}
        {{ form_errors(form.content) }}
        {{ form_widget(form.content) }}
    </div>
    {{ form_rest(form) }}
