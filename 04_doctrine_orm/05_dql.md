Doctrine Query Language
=======================

---

##A simple example

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

##Query a single fail

    $fail = $query->getSingleResult();
    
*If no result are returned the getSingleResult() method throws a Doctrine\ORM\NoResultException exception*
    
    $query = $em
        ->createQuery('
            SELECT f
            FROM WebBundle:fail f
            WHERE f.id = :id
        ')
        ->setParameter('id', '2')
        ->setMaxResults(1);

    try {
        $fail = $query->getSingleResult();
    } catch (\Doctrine\Orm\NoResultException $e) {
        fail = null;
    }
    
---

##Practice

*Do it now* Samuel Lee Jackson Pulp Fiction
