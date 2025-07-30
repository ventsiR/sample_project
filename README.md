### Godot Version
Godot v.4.4.1

# Overview
I have two scenes; one which is my main game (root) and another which represents cards in my game. The cards in the card scene are very large, and I would like to scaled them down as I bring them into root, but I am struggling to achieve this through GDScript code.

---

# Project info

This is a very small project I whipped up to demonstrate my struggles.

I wish I could upload a ZIP of my project, but I don't seem to be able to.

Here is all the info:

I have only two scenes:

root.tscn
```
  Root (Node2D)
  ├── Hand (Control)
  ├── CardToRoot(Button)
  ├── CardToHand(Button)
```

and card.tscn
```
  Card (Control)
  ├── CardImage (TextureRect)
  ├──├── CardText (Label)
```

Root has attached root.gd as a script:
```
extends Node2D
var card_scene := preload("res://card.tscn")


func add_card(size: Vector2):
	var card := card_scene.instantiate() as Control
	add_child(card)

	card.scale = size


func _on_card_to_root_button_up() -> void:
	add_card(Vector2(0.1, 0.1))

```

Hand has attached hand.gd as a script:
```
extends Control
var card_scene := preload("res://card.tscn")


func add_card(size: Vector2):
	var card := card_scene.instantiate() as Control
	add_child(card)

	card.scale = size


func _on_card_to_hand_button_up() -> void:
	add_card(Vector2(0.1, 0.1))
```

and CardToRoot & CardToHand are attached to their respective functions in the two scripts.

---

# More details about my issue

In the 2D editor, when viewing card.tscn, I can select the Card node and modify its Scale via the Scale Mode tool (shortcut S) which changes the Scale values in the Inspector (Control > Layout > Transform > Scale).

This is perfect for me as it scales the Card and all of its children uniformly (kind of like resizing an image in Paint).

However when I try to achieve the same through code I don't have much success.

---

# Running the project

When I run the project:

* the Add to Root button doesn't display a new card at all.

* the Add to Hand button successfully adds the image in the place it should, but the scaled down CardText is proportionally different to the scaled down CardImage.

---

Appreciate any help you can provide!
