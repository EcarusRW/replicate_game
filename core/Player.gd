extends KinematicBody2D

export (int) var speed = 50
export (int) var step = 64

var direction = Vector2()
onready var root=$"."
var moving=false

func _ready():
	pass
func get_input():
	if !moving&&(Input.is_action_pressed("ui_right")||Input.is_action_pressed('ui_left')||Input.is_action_pressed('ui_down')||Input.is_action_pressed('ui_up')):
		moving=true
		direction = Vector2()
		if Input.is_action_pressed('ui_right'):
			direction.x += step
		if Input.is_action_pressed('ui_left'):
			direction.x -= step
		if Input.is_action_pressed('ui_down'):
			direction.y += step
		if Input.is_action_pressed('ui_up'):
			direction.y -= step
			is_hitting_wall(Vector2(0,-step))
		#direction = direction.normalized() * speed
		$Tween.interpolate_property(root,"position",root.position,root.position+direction,10.0/speed,Tween.TRANS_LINEAR,Tween.EASE_IN)
		$Tween.start()

func _physics_process(delta):
	get_input()
	
func is_hitting_wall(direction):
	$Label.rect_position+=direction
func _on_Tween_tween_completed(object, key):
	moving=false
