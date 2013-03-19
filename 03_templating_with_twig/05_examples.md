# Case example

---

# From Controler...

Create your data inside your controler file and send it to your view

	!php
	public function indexAction()
	{
		$myArray = array(
			'id'		=> 	13,
			'title' 	=> 	'My awesome title',
			'date'		=> 	'1990-1-1',				
			'author'	=> 	array(
								'firstname' => 'jean-claude',
								'lastname'	=> 'Van Damme',
							),
			'content'	=> 	"Ça sounds good, même si on frime comme on appelle
							ça en France... là, j'ai un chien en ce moment à
							côté de moi et je le caresse, et c'est très, très
							beau d'avoir son propre moi-même ! Il y a un an,
							je t'aurais parlé de mes muscles.",
		);

		return $this->render(
			'YourBundle:YourControlerName:yourTwigFile.html.twig',
			array(
				'myArray' => $myArray,
		));
	}

---

# ...to the View

Display your data in your TWIG file

	!html
	{% extends '::base.html.twig' %}
	{% block content %}
		{# Display my data #}
		<h1>{{ myArray.title }}</h1>
		<p>by {{ myArray.author.firstname|capitalize }} @ {{ myArray.date|date("d/m/Y") }}</p>
		<p>{{ myArray.content }}</p>

	{% endblock %}

That's it !

---
# Extends & Blocks


