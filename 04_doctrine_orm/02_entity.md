Entity
======

---

## Exemple

    !php
    <?php

    namespace Supinfail\WebBundle\Entity;

    use Doctrine\ORM\Mapping as ORM;

    /**
     * Fail entity
     *
     * @ORM\Table(name = "fail")
     */
    class Fail
    {
        /**
         * @ORM\Id
         * @ORM\GeneratedValue
         * @ORM\Column(type = "integer")
         */
        private $id;

        /**
         * @ORM\Column(type = "string", length = 25)
         */
        private $title;

        /**
         * @ORM\Column(type = "text")
         */
        private $content;

        // ... getters and setters

---

## Getters and setters

    !php

        public function getId()
        {
            return $this->id;
        }

        public function setTitle($title)
        {
            $this->title = $title;
        }

        public function getTitle()
        {
            return $this->title;
        }

        public function setContent($content)
        {
            $this->content = $content;
        }

        public function getContent()
        {
            return $this->content;
        }
    }
