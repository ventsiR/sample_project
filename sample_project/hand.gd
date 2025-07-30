extends Control
var card_scene := preload("res://card.tscn")


func add_card(size: Vector2):
	var card := card_scene.instantiate() as Control
	add_child(card)

	card.scale = size


func _on_card_to_hand_button_up() -> void:
	add_card(Vector2(0.1, 0.1))
