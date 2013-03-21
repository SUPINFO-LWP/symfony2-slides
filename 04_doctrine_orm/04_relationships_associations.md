Relationships and Associations
==============================

## Add a one-to-many, many-to-one relation

*One User to many Fails*

    !php

    use Doctrine\Common\Collections\ArrayCollection;

    class User
    {
        // ...

        /**
         * @ORM\OneToMany(targetEntity="Fail", mappedBy="user")
         */
        protected $fails;

        public function __construct()
        {
            $this->fails = new ArrayCollection();
        }
    }

---

*Many fails to one user*

    !php


    // ...
    class Fail
    {
        // ...

        /**
         * @ORM\ManyToOne(targetEntity="User", inversedBy="fails")
         * @ORM\JoinColumn(name="user_id", referencedColumnName="id")
         */
        protected $user;
    }

---

*Generate entities*

    !bash

    $ php app/console doctrine:generate:entities

##Practice

![badTime](http://weknowmemes.com/generator/uploads/generated/g136009871787922204.jpg)