## Submitting forms
    !php
    /**
    * @Route("fail/new")
    * @Template()
    */
    public function addAction(Request $request) {
        $fail = new Fail();
        $form = $this->createForm(new FailType(), $fail);
        if ($request->isMethod('POST')) {
            $form->bind($request);
    
            if ($form->isValid()) {
                // perform some action, such as saving the task to the database
                $em = $this->getDoctrine()->getManager();
                $em->persist($fail);
                $em->flush();
                return $this->redirect($this->generateUrl('task_success'));
            }
        }  
        return array('form' => $form->createView());
    }
