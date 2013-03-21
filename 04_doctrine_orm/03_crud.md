CRUD
====

*Create Read Update Delete*

![BatMan](http://i.qkme.me/3qoydn.jpg)

---

##Insert an object

    !php

    $fail = new Fail();
    $fail->setTitle('JCVD Citation');
    $fail->setContent(
        'You see, j'ai vraiment une grande mission 
        car en vérité, la vérité, il n'y a pas de vérité car l'aboutissement
        de l'instinct, c'est l'amour ! Tu vas te dire : J'aurais jamais
        cru que le karaté guy pouvait parler comme ça !'
    );

    $em = $this->getDoctrine()->getManager();
    $em->persist($fail);
    $em->flush();

---

##Fetch an object

    !php

    $fail = $this->getDoctrine()
        ->getRepository('WebBundle:Fail')
        ->find($id);

    // ... do something, like pass the $fail object into a view

---

    !php

    $repository = $this->getDoctrine()
       ->getRepository('WebBundle:Fail');

    // query by the primary key (usually "id")
    $fail = $repository->find($id);

    // dynamic method names to find based on a column value
    $fail = $repository->findOneById($id);
    $fail = $repository->findOneByTitle('foo');

    // find *all* fails
    $fails = $repository->findAll();

    // find a group of fails based on an arbitrary column value
    $fails = $repository->findByRank(150);

    // query for one fail matching be title and price
    $fails = $repository->findOneBy(array('title' => 'foo', 'rank' => 150));

    // query for all fails matching the title, ordered by price
    $fails = $repository->findBy(
        array('title' => 'foo'),
        array('rank' => 'DESC')
    );

---

##Update an object

    !php

    $em = $this->getDoctrine()->getManager();
    $fail = $em->getRepository('WebBundle:Fail')->find($id);

    $fail->setContent('Oui alors écoute moi, ce n'est pas un simple sport car en vérité, la vérité, il n'y a pas de vérité et je ne cherche pas ici à mettre un point ! Il y a un an, je t'aurais parlé de mes muscles.');
    $em->flush();


---

##Delete an object

    !php

    $em = $this->getDoctrine()->getManager();
    $fail = $em->getRepository('WebBundle:Fail')->find($id);
    $em->remove($fail);
    $em->flush();

---

##Practice

![badTime](http://weknowmemes.com/generator/uploads/generated/g136009871787922204.jpg)
