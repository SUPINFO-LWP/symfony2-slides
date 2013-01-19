# Controllers and Routing

---

# Adding a language requirement 

    !yml
    homepage:
        pattern:   /{culture}
        defaults:  { _controller: AcmeDemoBundle:Main:homepage, culture: en }
        requirements:
            culture:  en|fr
            

    /   {culture} = en
    /en {culture} = en
    /fr {culture} = fr
    /es won't match this route
