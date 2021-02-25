extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 0.1
var BlueBullet = load("res://Bullets/BlueBullet.tscn")
var RedBullet = load("res://Bullets/RedBullet.tscn")
onready var Bullets = get_node("/root/Game/Bullets")


func _ready():
	pass

func _physics_process(_delta):
	velocity += get_input()*speed
	position += velocity
	if position.x >= 1024:
		velocity = Vector2.ZERO
		position.x = 1024
	if position.x <= 0:
		velocity = Vector2.ZERO
		position.x = 0
	if Input.is_action_just_pressed("shoot1"):
		var bluebullet = BlueBullet.instance()
		bluebullet.position = position + Vector2(0, -30)
		Bullets.add_child(bluebullet)
	if Input.is_action_just_pressed("shoot2"):
		var redbullet = RedBullet.instance()
		redbullet.position = position + Vector2(0, -30)
		Bullets.add_child(redbullet)



func get_input():
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("left"):
		input_vector += Vector2(-1,0)
	if Input.is_action_pressed("right"):
		input_vector += Vector2(1,0)
	return input_vector
	
func die(s):
	queue_free()
