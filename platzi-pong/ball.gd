extends CharacterBody2D
class_name Ball

var SPEED = 0
var direction = Vector2.ZERO
var is_moving = false
@onready var timer = get_parent().find_child("Restart")

func _ready():
	randomize()
	reset_ball()
	
func reset_ball():
	timer.stop()
	SPEED = 700
	direction.x = [-1,1][randi() % 2]
	direction.y = [-0.8,0.8][randi() % 2]
	is_moving = true

func _physics_process(delta):
	if is_moving:
		var collide = move_and_collide(SPEED * direction * delta);
		if collide:
			direction = direction.bounce(collide.get_normal());
			$AudioColission.play()


func _on_restart_timeout() -> void:
	reset_ball()
