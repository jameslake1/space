extends KinematicBody
var vlcity = Vector3 (0, 0, 0) 
var Deceleration = 0.0001
var acceleration = 0.01
var max_speed = 5
var mouse_pos = Vector2(0,0)

#func _input(event):
#	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#	if event is InputEventMouseButton:
#		mouse_pos = event.relative

#	elif event is InputEventMouseMotion:
#		mouse_pos = event.relative
		
		
onready var cam = $mesh
const H_LOOK_SENS = 1.0
const V_LOOK_SENS = 1.0
		
		
		
		

func _input(event):
	if event is InputEventMouseMotion:
		cam.rotation_degrees.x -= event.relative.y * V_LOOK_SENS
		cam.rotation_degrees.x = clamp(cam.rotation_degrees.x, -90, 90)
		rotation_degrees.y -= event.relative.x * H_LOOK_SENS
	
func _process(_delta):


	if Input.is_action_pressed("ui_down"):
		vlcity.x = lerp(vlcity.x,max_speed,acceleration)

	elif Input.is_action_pressed("ui_up"):
		vlcity.x = lerp(vlcity.x,-max_speed,acceleration)

	else:
		vlcity.x = lerp(vlcity.x,0,Deceleration)

	if Input.is_action_pressed("ui_right"):
		vlcity.z = lerp(vlcity.z,-max_speed,acceleration)

	elif Input.is_action_pressed("ui_left"):
		vlcity.z = lerp(vlcity.z,max_speed,acceleration)

	else:
		vlcity.z = lerp(vlcity.z,0,Deceleration)

	if Input.is_action_pressed("ui_move_down"):
		vlcity.y = lerp(vlcity.y,-max_speed,acceleration)

	elif Input.is_action_pressed("ui_move_up"):
		vlcity.y = lerp(vlcity.y,max_speed,acceleration)

	else:
		vlcity.y = lerp(vlcity.y,0,Deceleration)
#	self.rotate_z(deg2rad( mouse_pos.y))
#	self.rotate_y(deg2rad( mouse_pos.x))
	mouse_pos = Vector2 (0,0)
	vlcity = vlcity.normalized()
	vlcity = vlcity.rotated(Vector3(0, 1, 0), rotation.y)
	move_and_slide(vlcity)






