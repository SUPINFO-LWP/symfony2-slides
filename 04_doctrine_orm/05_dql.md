Doctrine Query Language
=======================

---

##A simple example

    !php

    $failRepository = $this->getDoctrine()
        ->getManager()
        ->getRepository('WebBundle:Fail');

    $fails = $repository->findAll();

---

##Query a single fail

    !php

    $failRepository = $this->getDoctrine()
        ->getManager()
        ->getRepository('WebBundle:Fail');

    $fails = $repository->find($id);
    
---

##Using a query builder

*In the fail repository*

    !php

    protected function selectFailQB()
    {
        $qb = $this->createQueryBuilder('f');

        $qb->leftJoin('f.comments', 'c')->addSelect('c');
        $qb->leftJoin('f.tags', 't')->addSelect('t');
        $qb->leftJoin('f.user', 'u')->addSelect('u');

        return $qb;
    }

---

##Using a query builder

*In the fail repository*

    !php

    public function findFailByRankOrderByCateCreated($rank, $max = 10)
    {
        $qb = $this->selectFailQB();

        $qb->where('f.rank > :rank');
        $qb->setParameter('rank', $rank);
        $qb->addOrderBy('f.createdAt', 'DESC');
        $qb->setMaxResults($max);

        return $qb->getQuery()->getResult();
    }

---

##Using a query builder

*In the controller*

    !php

    $failRepository = $this->getDoctrine()->getManager()->getRepository('WebBundle:Fail');

    
---

##Practice

![badTime](http://weknowmemes.com/generator/uploads/generated/g136009871787922204.jpg)
