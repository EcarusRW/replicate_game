extends KinematicBody2D

export (int) var speed = 50
export (int) var step = 64

var direction = Vector2()
var moving=false
onready var root=$"."
onready var grid=get_parent()

func _ready():
	pass
func get_input():
	if !moving&&(Input.is_action_pressed("ui_right")||Input.is_action_pressed('ui_left')||Input.is_action_pressed('ui_down')||Input.is_action_pressed('ui_up')):
		moving=true
		direction = Vector2()
		if Input.is_action_pressed('ui_right'):
			direction.x += 1
		if Input.is_action_pressed('ui_left'):
			direction.x -= 1
		if Input.is_action_pressed('ui_down'):
			direction.y += 1
		if Input.is_action_pressed('ui_up'):
			direction.y -= 1
		request_move()

func _physics_process(delta):
	get_input()

func request_move():
	if !grid.hitting_wall(self,direction):
		$Tween.interpolate_property(root,"position",root.position,root.position+direction*step,10.0/speed,Tween.TRANS_LINEAR,Tween.EASE_IN)
	else:
		$Tween.interpolate_property(root,"position",root.position,root.position,10.0/speed,Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.start()
func _on_Tween_tween_completed(object, key):
	moving=false
