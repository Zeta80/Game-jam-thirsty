extends Node2D

@onready var shoot_rate_spawn_timer_rotor_1: Timer = $Rotor1/Shoot_rate_spawn_timer_rotor1
@onready var rotetor_cont_rotor1: Node2D = $Rotor1/Rotetor_cont
@onready var rotator_bullets_rotor1: Node2D = $Rotor1/Rotetor_cont/Rotator_bullets

@export var level_scene: String
@export_group("Rotor1")
@export var bullet_scene_rotor1: PackedScene
@export var bullet_sprite_rotor1: Texture
@export var rotate_speed_rotor1 = 100
@export var shoot_timer_wait_time_rotor1 = 0.1
@export var spawn_point_count_rotor1 = 1
@export var radius_rotor1 = 10
@export var fire_angle_rotator_rotor1 = 50
@export var bullet_direction_rotor1: float = 90
@export var bullet_speed_rotor1: float = 100

@onready var shoot_rate_spawn_timer_rotor_2: Timer = $Rotor2/Shoot_rate_spawn_timer_rotor2
@onready var rotetor_cont_rotor2: Node2D = $Rotor2/Rotetor_cont
@onready var rotator_bullets_rotor2: Node2D = $Rotor2/Rotetor_cont/Rotator_bullets

@export_group("Rotor2")
@export var bullet_scene_rotor2: PackedScene
@export var bullet_sprite_rotor2: Texture
@export var rotate_speed_rotor2 = 100
@export var shoot_timer_wait_time_rotor2 = 0.1
@export var spawn_point_count_rotor2 = 1
@export var radius_rotor2 = 10
@export var fire_angle_rotator_rotor2 = 50
@export var bullet_direction_rotor2: float = 90
@export var bullet_speed_rotor2: float = 100

@onready var shoot_rate_spawn_timer_rotor_3: Timer = $Rotor3/Shoot_rate_spawn_timer_rotor3
@onready var rotetor_cont_rotor3: Node2D = $Rotor3/Rotetor_cont
@onready var rotator_bullets_rotor3: Node2D = $Rotor3/Rotetor_cont/Rotator_bullets

@export_group("Rotor3")
@export var bullet_scene_rotor3: PackedScene
@export var bullet_sprite_rotor3: Texture
@export var rotate_speed_rotor3 = 100
@export var shoot_timer_wait_time_rotor3 = 0.1
@export var spawn_point_count_rotor3 = 1
@export var radius_rotor3 = 10
@export var fire_angle_rotator_rotor3 = 50
@export var bullet_direction_rotor3: float = 90
@export var bullet_speed_rotor3: float = 100

@onready var shoot_rate_spawn_timer_rotor_4: Timer = $Rotor4/Shoot_rate_spawn_timer_rotor4
@onready var rotetor_cont_rotor4: Node2D = $Rotor4/Rotetor_cont
@onready var rotator_bullets_rotor4: Node2D = $Rotor4/Rotetor_cont/Rotator_bullets

@export_group("Rotor4")
@export var bullet_scene_rotor4: PackedScene
@export var bullet_sprite_rotor4: Texture
@export var rotate_speed_rotor4 = 100
@export var shoot_timer_wait_time_rotor4 = 0.1
@export var spawn_point_count_rotor4 = 1
@export var radius_rotor4 = 10
@export var fire_angle_rotator_rotor4 = 50
@export var bullet_direction_rotor4: float = 90
@export var bullet_speed_rotor4: float = 100

func _ready():	
	#ROTOR 1
	rotetor_cont_rotor1.rotation = bullet_direction_rotor1
	var step_rotor1 = 2 * PI / spawn_point_count_rotor1
	
	for i in range(spawn_point_count_rotor1):
		var spawn_point_rotor1 = Node2D.new()
		var pos_rotor1 = Vector2(radius_rotor1, 0).rotated(step_rotor1 * i)
		spawn_point_rotor1.position = pos_rotor1
		spawn_point_rotor1.rotation = pos_rotor1.angle()
		
		rotator_bullets_rotor1.add_child(spawn_point_rotor1)
	
	shoot_rate_spawn_timer_rotor_1.wait_time = shoot_timer_wait_time_rotor1
	shoot_rate_spawn_timer_rotor_1.start()
	
	#ROTOR 2
	rotetor_cont_rotor2.rotation = bullet_direction_rotor2
	var step_rotor2 = 2 * PI / spawn_point_count_rotor2
	
	for i in range(spawn_point_count_rotor2):
		var spawn_point_rotor2 = Node2D.new()
		var pos_rotor2 = Vector2(radius_rotor2, 0).rotated(step_rotor2 * i)
		spawn_point_rotor2.position = pos_rotor2
		spawn_point_rotor2.rotation = pos_rotor2.angle()
		
		rotator_bullets_rotor2.add_child(spawn_point_rotor2)
	
	shoot_rate_spawn_timer_rotor_2.wait_time = shoot_timer_wait_time_rotor2
	shoot_rate_spawn_timer_rotor_2.start()
	
	#ROTOR 2
	rotetor_cont_rotor3.rotation = bullet_direction_rotor3
	var step_rotor3 = 2 * PI / spawn_point_count_rotor3
	
	for i in range(spawn_point_count_rotor3):
		var spawn_point_rotor3 = Node2D.new()
		var pos_rotor3 = Vector2(radius_rotor3, 0).rotated(step_rotor3 * i)
		spawn_point_rotor3.position = pos_rotor3
		spawn_point_rotor3.rotation = pos_rotor3.angle()
		
		rotator_bullets_rotor3.add_child(spawn_point_rotor3)
	
	shoot_rate_spawn_timer_rotor_3.wait_time = shoot_timer_wait_time_rotor3
	shoot_rate_spawn_timer_rotor_3.start()
	
	#ROTOR 4
	rotetor_cont_rotor4.rotation = bullet_direction_rotor4
	var step_rotor4 = 2 * PI / spawn_point_count_rotor4
	
	for i in range(spawn_point_count_rotor4):
		var spawn_point_rotor4 = Node2D.new()
		var pos_rotor4 = Vector2(radius_rotor4, 0).rotated(step_rotor4 * i)
		spawn_point_rotor4.position = pos_rotor4
		spawn_point_rotor4.rotation = pos_rotor4.angle()
		
		rotator_bullets_rotor4.add_child(spawn_point_rotor4)
	
	shoot_rate_spawn_timer_rotor_4.wait_time = shoot_timer_wait_time_rotor4
	shoot_rate_spawn_timer_rotor_4.start()

func _process(delta):
	#Rotor 1
	var new_rotation_rotor1 = rotator_bullets_rotor1.rotation_degrees + rotate_speed_rotor1 * delta
	rotator_bullets_rotor1.rotation_degrees = fmod(new_rotation_rotor1, fire_angle_rotator_rotor1)
	rotator_bullets_rotor1.get_children()[0].rotation = bullet_direction_rotor1
	
	#Rotor 2
	var new_rotation_rotor2 = rotator_bullets_rotor2.rotation_degrees + rotate_speed_rotor2 * delta
	rotator_bullets_rotor2.rotation_degrees = fmod(new_rotation_rotor2, fire_angle_rotator_rotor2)
	rotator_bullets_rotor2.get_children()[0].rotation = bullet_direction_rotor2
	
	#Rotor 3
	var new_rotation_rotor3 = rotator_bullets_rotor3.rotation_degrees + rotate_speed_rotor3 * delta
	rotator_bullets_rotor3.rotation_degrees = fmod(new_rotation_rotor3, fire_angle_rotator_rotor3)
	rotator_bullets_rotor3.get_children()[0].rotation = bullet_direction_rotor3

	#Rotor 4
	var new_rotation_rotor4 = rotator_bullets_rotor4.rotation_degrees + rotate_speed_rotor4 * delta
	rotator_bullets_rotor4.rotation_degrees = fmod(new_rotation_rotor4, fire_angle_rotator_rotor4)
	rotator_bullets_rotor4.get_children()[0].rotation = bullet_direction_rotor4


func _on_shoot_rate_spawn_timer_rotor_1_timeout() -> void:
	for s in rotator_bullets_rotor1.get_children():
		var bullet = bullet_scene_rotor1.instantiate()
		bullet.bullet_sprite = bullet_sprite_rotor1
		bullet.level_scene = level_scene
		bullet.bullet_speed = bullet_speed_rotor1
		get_parent().get_node("Bullets").add_child(bullet)
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation


func _on_shoot_rate_spawn_timer_rotor_2_timeout() -> void:
	for s in rotator_bullets_rotor2.get_children():
		var bullet = bullet_scene_rotor2.instantiate()
		bullet.bullet_sprite = bullet_sprite_rotor2
		bullet.level_scene = level_scene
		bullet.bullet_speed = bullet_speed_rotor2
		get_parent().get_node("Bullets").add_child(bullet)
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation


func _on_shoot_rate_spawn_timer_rotor_3_timeout() -> void:
	for s in rotator_bullets_rotor3.get_children():
		var bullet = bullet_scene_rotor3.instantiate()
		bullet.bullet_sprite = bullet_sprite_rotor3
		bullet.level_scene = level_scene
		bullet.bullet_speed = bullet_speed_rotor3
		get_parent().get_node("Bullets").add_child(bullet)
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation


func _on_shoot_rate_spawn_timer_rotor_4_timeout() -> void:
	for s in rotator_bullets_rotor4.get_children():
		var bullet = bullet_scene_rotor4.instantiate()
		bullet.bullet_sprite = bullet_sprite_rotor4
		bullet.level_scene = level_scene
		bullet.bullet_speed = bullet_speed_rotor4
		get_parent().get_node("Bullets").add_child(bullet)
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation
