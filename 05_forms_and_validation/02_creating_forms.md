## Create a form
    /**
    * @Route("fail/new")
    * @Template()
    */
    public function addAction(Request $request) {
        $fail = new Fail();
        $form = $this->createFormBuilder($fail)
                ->add('content', 'text')
                ->getForm();
        return array('form' => $form->createView());
    }
    
---

## Create a formType (reusable)
    namespace Supinfail\WebBundle\Form;
    
    use Symfony\Component\Form\AbstractType;
    use Symfony\Component\Form\FormBuilderInterface;
    use Symfony\Component\OptionsResolver\OptionsResolverInterface;
    
    class FailType extends AbstractType {

        public function buildForm(FormBuilderInterface $builder, array $options) {
            $builder
                    ->add('content')
            ;
        }
    
        public function setDefaultOptions(OptionsResolverInterface $resolver) {
            $resolver->setDefaults(array(
                'data_class' => 'Supinfail\WebBundle\Entity\Fail'
            ));
        }
    
        public function getName() {
            return 'supinfail_webbundle_failtype';
        }
    }
    
---

## Use a formType in controllers
    use Supinfail\WebBundle\Form\FailType;
    
    .......
    
    /**
    * @Route("fail/new")
    * @Template()
    */
    public function addAction(Request $request) {
        $fail = new Fail();
        $form = $this->createFormBuilder($fail)
                ->add('content', 'text')
                ->getForm();
        return array('form' => $form->createView());
    }
