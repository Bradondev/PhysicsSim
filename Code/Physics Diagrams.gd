
extends Node2D

@export var H :StaticBody2D
@export var AngledFloor: StaticBody2D
@export var PivPoint: Node2D

@export var angleText :LineEdit
@export var angleSlider: HSlider
@export var Box : Sprite2D
@onready var BoxPoint = $floor/boxpoint
var Currentangle=0
var mass =5
var μ :float = 0
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func UpdateDiagram() -> void:

	H.global_position =PivPoint.global_position
	Box.global_position =BoxPoint.global_position
	Box.global_rotation =  BoxPoint.global_rotation
	FindN()
	FindF()
func ChangeAngel(NewRoation) -> void:

	AngledFloor.rotation_degrees= NewRoation
	UpdateDiagram()



func _on_angel_slider_value_changed(value):
	angleText.placeholder_text = str(value)
	$"mass edit".placeholder_text = str(mass)
	ChangeAngel(value)
	Currentangle = value
	UpdateDiagram()


func _on_angeltext_text_submitted(new_text):
	angleSlider.value = int(new_text)
	Currentangle =  int(new_text)
	angleText.placeholder_text = new_text
	angleText.text =""
	ChangeAngel(float(new_text))
func FindN():
	var N = mass * 9.8 *cos(deg_to_rad(Currentangle))
	$N.text = "N = " + str(snapped(N, 0.001) ) + " newtons "
	return N
func FindF():
	var F = μ *FindN()
	$F.text = "Friction  = " + str(snapped(F, 0.001) ) + " newtons "
	return F

func _on_angeltext_2_text_submitted(new_text):
	mass = float(new_text)
	UpdateDiagram()

func _on_μ_text_changed(new_text):
	μ = float( new_text)
	UpdateDiagram()
