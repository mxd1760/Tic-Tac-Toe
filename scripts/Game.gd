extends Node2D


var is_x_turn = true;
var none_val = "NONE";
var none_tex = null;
var x_val = "X";
var x_tex = preload("res://assets/X_Sprite.png");
var o_val = "O";
var o_tex = preload("res://assets/O_Sprite.png");


onready var one 	= get_node("Slot 1")
onready var two 	= get_node("Slot 2")
onready var three 	= get_node("Slot 3")
onready var four 	= get_node("Slot 4")
onready var five 	= get_node("Slot 5")
onready var six 	= get_node("Slot 6")
onready var seven 	= get_node("Slot 7")
onready var eight 	= get_node("Slot 8")
onready var nine 	= get_node("Slot 9")

func _ready():
	$TurnIndicator.texture = x_tex
	$EndOfGameDisplay/TieText.hide()
	$EndOfGameDisplay/WinText.show()
	$EndOfGameDisplay.hide()

func update_board():
	is_x_turn = !is_x_turn
	var spots_occupied = 0;
	var winner = none_val
	if one.value != none_val:
		if one.value == two.value && one.value == three.value||\
			one.value == four.value && one.value == seven.value||\
			one.value == five.value && one.value == nine.value:
				winner=one.value
		spots_occupied += 1
	if five.value != none_val:
		if five.value == four.value && five.value == six.value||\
			five.value == two.value && five.value == eight.value||\
			five.value == seven.value && five.value == three.value:
				winner=five.value
		spots_occupied += 1
	if nine.value != none_val:
		if nine.value == seven.value && nine.value == eight.value||\
			nine.value == six.value && nine.value == three.value:
				winner = nine.value
		spots_occupied += 1
	if spots_occupied>=3:
		if two.value != none_val:
			spots_occupied += 1
		if three.value != none_val:
			spots_occupied += 1
		if four.value != none_val:
			spots_occupied += 1
		if six.value != none_val:
			spots_occupied += 1
		if seven.value != none_val:
			spots_occupied += 1
		if eight.value != none_val:
			spots_occupied += 1
		if spots_occupied >=9:
			show_winner(none_val)
	if winner!=none_val:
		show_winner(winner)
		$TurnIndicator.texture = none_tex
	else:
		if is_x_turn:
			$TurnIndicator.texture = x_tex
		else:
			$TurnIndicator.texture = o_tex
			
			
			
func show_winner(winner):
	$EndOfGameDisplay.show()
	if winner == x_val:
		$EndOfGameDisplay/Winner.texture = x_tex
	elif winner == o_val:
		$EndOfGameDisplay/Winner.texture = o_tex
	else:
		$EndOfGameDisplay/Winner.texture = none_tex
		$EndOfGameDisplay/WinText.hide()
		$EndOfGameDisplay/TieText.show()
		



func _on_Button_pressed():
	get_tree().reload_current_scene()
	
