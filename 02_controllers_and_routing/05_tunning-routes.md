# Controllers and Routing

---

# Tunning Routes

	!yml
	blog:
	    pattern:   /blog/{page}
	    defaults:  { _controller: AcmeBlogBundle:Blog:index, page: 1 }

	blog_show:
	    pattern:   /blog/{slug}
	    defaults:  { _controller: AcmeBlogBundle:Blog:show }
	    
