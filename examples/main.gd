extends Node2D

func _ready():
	print("Hello from CLI-based Godot!")
	print("This scene was created without the editor.")

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("Accept button pressed")

func _on_exit():
	print("Exiting game...")
	get_tree().quit()
