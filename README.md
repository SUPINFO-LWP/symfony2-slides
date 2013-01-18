# Symfony2 slides

## Building the slides locally

Make sure you have the required python modules to use landslide:

```
sudo pip install -q landslide pygments jinja2 markdown
```

And then run

```
find . -name \"*.cfg\" -exec landslide {} \;
```
