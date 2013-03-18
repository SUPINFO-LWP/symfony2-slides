## Validations

* Validate datas entered in form
* Datas are validated before they are written in database

---

## Consider the following entity with following field

    // src/Supinfail/WebBundle/Entity/Comment.php
    namespace Supinfail\WebBundle\Entity;
    
    class Comment
    {   
        /**
        * @var string
        *
        * @ORM\Column(name="content", type="text")
        */
        private $content;
        
        
        ....
    }

Let's try to create a validator on $content and check if $content :
*is not empty
*contains at least 25 characters
*doesn't exceed 400 characters

---
## Declare validation rules in configuration files
    # src/Supinfail/WebBundle/Resources/config/validation.yml
    Supinfail\WebBundle\Entity\Comment:
        properties:
            content:
                - NotBlank: ~
                - Length:
                    min: 25
                    max : 400
                    minMessage: "Your comment must be at least {{ limit }} characters length"
                    maxMessage: "Your comment cannot be longer than than {{ limit }} characters length"
                    
---
## Using validator service
    public function checkComment(){
        $comment = new Comment();
        
        //Get validator service
        $validator = $this->get('validator'); 
        
        //the validator service checks if the comment is valid using our rules
        $errors = $validator->validate($comment);
    
        if (count($errors) > 0) {
            return new Response(print_r($errors, true));
        } else {
            return new Response('The comment is valid! Yes!');
        }
    }
---
## Declare rules in entities
    
    // src/Supinfail/WebBundle/Entity/Comment.php
    namespace Supinfail\WebBundle\Entity;
    
    use Symfony\Component\Validator\Constraints as Assert;
    
    class Comment
    {   
        /**
        * @var string
        * @Assert\NotBlank(message="Comment must not be empty")
        * @Assert\Length(
        *   min=25,
        *   max=400,   
        *   minMessage="Your comment must be at least {{ limit }} characters length",
        *   maxMessage="Your comment cannot be longer than than {{ limit }} characters length"
        * )
        * @ORM\Column(name="content", type="text")
        */
        private $content;
        
        
        ....
    }
---
## Validators in forms

*Validation made when the form is bound to the HTTP Request ($form->bind($request);)
*isValid() method counts errors retrieved by validators in bind() method

---
## List of constraints

[List of constraints](http://symfony.com/doc/master/book/validation.html#constraints)

                
