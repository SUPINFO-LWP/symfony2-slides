# Controllers and Routing

---

# Adding a simple requirement

	!yml
	blog:
	    pattern:   /blog/{page}
	    defaults:  { _controller: AcmeBlogBundle:Blog:index, page: 1 }
	    requirements:
	        page:  \d+

	blog_show:
	    pattern:   /blog/{slug}
	    defaults:  { _controller: AcmeBlogBundle:Blog:show }
	    
Earlier route always win.
