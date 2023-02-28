extends Area2D


onready var game = get_parent()
onready var value = game.none_val



func _ready():
	$Sprite.texture = game.none_tex
	pass # Replace with function body.
	

func _on_Slot_1_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if value == game.none_val:
			if game.is_x_turn:
				value = game.x_val
				$Sprite.texture = game.x_tex
			else:
				value = game.o_val
				$Sprite.texture = game.o_tex
			game.update_board()
