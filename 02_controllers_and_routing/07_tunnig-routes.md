# Controllers and Routing

---

# Adding a HTTP requirement

	!yml
	contact:
	    pattern:  /contact
	    defaults: { _controller: AcmeDemoBundle:Main:contact }
	    requirements:
	        _method:  GET

	contact_process:
	    pattern:  /contact
	    defaults: { _controller: AcmeDemoBundle:Main:contactProcess }
	    requirements:
	        _method:  POST

    !shell
	$ php app/console router:debug