extends KinematicBody2D

var vis_color = Color(.867, .91, .247, 0.1)
var laser_color = Color(1.0, .329, .298)
var ready_to_jump = false
var jump_player = false
var play_in_position = true

var hit_pos
var speed = 250
var velocity = Vector2()
var next_location = Vector2()

func _ready():
	global_position = Vector2(OS.window_size.x/2,OS.window_size.y-16)
	next_location = global_position
	draw_circle(Vector2(),250,vis_color)


func _physics_process(delta):
	update()
	if Input.is_action_just_released("jump"):
		ready_to_jump=false
		jump_player = true
		
	if Input.is_action_just_pressed("jump"):
		ready_to_jump=true
		
func _process(delta):
	if jump_player:
		next_location = get_global_mouse_position()
		play_in_position = false
		jump_player=false
		
	if not play_in_position:
		move_to_shoot_location(delta)
		if global_position.is_equal_approx(next_location):
			play_in_position = true
	
func _draw():
	if ready_to_jump:
		draw_circle(Vector2(),250,vis_color)
		draw_line(Vector2(), get_local_mouse_position(), laser_color)


func move_to_shoot_location(delta):
	var angle = get_angle_to(next_location)
	velocity.x = cos(angle)
	velocity.y = sin(angle)	
	global_position += velocity * speed * delta
	
