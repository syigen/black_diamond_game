extends KinematicBody2D

var vis_color = Color(.867, .91, .247, 0.1)
var laser_color = Color(1.0, .329, .298)
var ready_to_jump = false
func _ready():
	global_position = Vector2(OS.window_size.x/2,OS.window_size.y-16)	
	draw_circle(Vector2(),250,vis_color)


func _physics_process(delta):
	update()
	if Input.is_action_just_released("jump"):
		ready_to_jump=false
	if Input.is_action_just_pressed("jump"):
		ready_to_jump=true
	
func _draw():
	if ready_to_jump:
		draw_circle(Vector2(),250,vis_color)
		draw_line(Vector2(), get_local_mouse_position(), laser_color)
