# Controllers and Routing

---

# Mapping URLs

	!php
	# app/config/routing.yml
	hello:
	    pattern:      /hello/{name}
	    defaults:     { _controller: AcmeHelloBundle:Hello:index }
	    
Going to `/hello/bryan` now executes the `HelloController::indexAction()` controller and passes in `bryan` for the `$name` variable.
