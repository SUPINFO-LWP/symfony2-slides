CRUD
====

## Create Read Update Delete

---

##Insert an object

    <?php

    namespace Supinfail\WebBundle\Controller;

    use Symfony\Bundle\FrameworkBundle\Controller\Controller;
    use Supinfail\WebBundle\Entity\Fail;
    use Symfony\Component\HttpFoundation\Response;

    class FailsController extends Controller
    {

        public function createAction()
        {
            $fail = new Fail();
            $fail->setContent('You see, j'ai vraiment une grande mission car en vérité, la vérité, il n'y a pas de vérité car l'aboutissement de l'instinct, c'est l'amour ! Tu vas te dire : J'aurais jamais cru que le karaté guy pouvait parler comme ça !');

            $em = $this->getDoctrine()->getManager();
            $em->persist($fail);
            $em->flush();

            return new Response('Created fail id '.$fail->getId());
        }
    }

---

##Fetch an object

    public function showAction($id)
    {
        $fail = $this->getDoctrine()
                     ->getRepository('WebBundle:Fail')
                     ->find($id);

        if (!$fail) {
            throw $this->createNotFoundException(
                'No fail found for id '.$id
            );
        }

        // ... do something, like pass the $fail object into a template
    }

---

    $repository = $this->getDoctrine()
                       ->getRepository('WebBundle:Fail');

    // query by the primary key (usually "id")
    $fail = $repository->find($id);

    // dynamic method names to find based on a column value
    $fail = $repository->findOneById($id);
    $fail = $repository->findOneByName('foo');

    // find *all* fails
    $fails = $repository->findAll();

    // find a group of fails based on an arbitrary column value
    $fails = $repository->findByRank(150);

    // query for one fail matching be name and price
    $product = $repository->findOneBy(array('name' => 'foo', 'rank' => 150));

    // query for all fails matching the name, ordered by price
    $fail = $repository->findBy(
        array('name' => 'foo'),
        array('rank' => 'DESC')
    );

---

##Update an object

    public function updateAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $fail = $em->getRepository('WebBundle:Fail')->find($id);

        if (!$fail) {
            throw $this->createNotFoundException(
                'No fail found for id '.$id
            );
        }

        $fail->setContent('Oui alors écoute moi, ce n'est pas un simple sport car en vérité, la vérité, il n'y a pas de vérité et je ne cherche pas ici à mettre un point ! Il y a un an, je t'aurais parlé de mes muscles.');
        $em->flush();

        return $this->redirect($this->generateUrl('_homepage');
    }

---

##Delete an object

    $em = $this->getDoctrine()->getManager();
    $fail = $em->getRepository('WebBundle:Fail')->find($id);
    $em->remove($fail);
    $em->flush();

---

##Practice

*Do it now* Samuel Lee Jackson Pulp Fiction
