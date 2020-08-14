#what object this code is attached to
extends KinematicBody



#Its dangerous to go alone take debug flags!

#!debug print test in progress! 
#!----------------------------!




#vars that change game function==============

#mouse sensitvity vars
const h_mouse_sens = 1.0
const v_mouse_sens = 1.0
#------------------------


#speed calculation vars
var Deceleration = 1
var acceleration = 0.01
var max_speed = 500
#------------------------

#==============================================

#misc vars=====================================
#misc vars
onready var cam = $Camera
var move_vec = Vector3()
#------------------------

#end vars =====================================
 

#mouse capture and rotation
func _input(event):
	if event is InputEventMouseMotion:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		cam.rotation_degrees.x -= event.relative.y * v_mouse_sens
		rotation_degrees.y -= event.relative.x * h_mouse_sens
 #--------------------------

#main loop
func _physics_process(_delta):



#forward and back controlls
	if Input.is_action_pressed("Player_forward"):
#move forward with acceleration 
		move_vec.x = lerp(move_vec.x,-max_speed,acceleration)
#-----------------------------
	elif Input.is_action_pressed("Player_back"):
#move back with acceleration
		move_vec.x = lerp(move_vec.x,max_speed,acceleration)
#-----------------------------
#if forward and back not pressed decelerate
	else:
#deceleration
		move_vec.x = lerp(move_vec.x,0,Deceleration)
#-------------------------




#left and right controlls
	if Input.is_action_pressed("Player_right"):
#move right with acceleration
		move_vec.z = lerp(move_vec.z,-max_speed,acceleration)
#-----------------------------
	elif Input.is_action_pressed("Player_left"):
#move left with acceleration
		move_vec.z = lerp(move_vec.z,max_speed,acceleration)
#-----------------------------

#if left and right not pressed decelerate
	else:
#deceleration
		move_vec.z = lerp(move_vec.z,0,Deceleration)
#-----------------------------


#account for rotaition
	move_vec = move_vec.normalized()
	move_vec = move_vec.rotated(Vector3(0, 1, 0), rotation.y)
#-----------------------------



#move player
	move_and_slide(move_vec)
 #-----------------------------

