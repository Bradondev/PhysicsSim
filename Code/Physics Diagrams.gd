
extends Node2D

@export var H :StaticBody2D
@export var AngledFloor: StaticBody2D
@export var PivPoint: Node2D

@export var AngelText :LineEdit
@export var AngelSlider: HSlider
@export var Box : Sprite2D
@onready var BoxPoint = $floor/boxpoint

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func UpdateDiagram() -> void:

	H.global_position =PivPoint.global_position
	Box.global_position =BoxPoint.global_position
	Box.global_rotation =  BoxPoint.global_rotation
func ChangeAngel(NewRoation) -> void:
	AngledFloor.rotation_degrees= NewRoation
	UpdateDiagram()



func _on_angel_slider_value_changed(value):
	AngelText.placeholder_text = str(value)
	ChangeAngel(value)
	UpdateDiagram()


func _on_angeltext_text_submitted(new_text):
	AngelSlider.value = int(new_text)
	AngelText.placeholder_text = new_text
	AngelText.text =""
	ChangeAngel(float(new_text))
