Doctrine Query Language
=======================

---

##Querying for Objects with DQL

    $em = $this->getDoctrine()->getManager();
    $query = $em
        ->createQuery('
            SELECT f
            FROM WebBundle:Fail f
            WHERE f.id > :id
            ORDER BY f.rank DESC
        ')
        ->setParameter('id', '25');

    $fail = $query->getResult();

---

##Practice

*Do it now* Samuel Lee Jackson Pulp Fiction
