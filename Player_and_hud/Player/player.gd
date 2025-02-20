extends CharacterBody2D

@onready var inv_frame_timer: Timer = $InvFrameTimer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hud: Control = $"../HUD"
var speed_slow = 100.0
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var hp_max := 4
var current_hp = hp_max
var isInvincible := false
signal player_dead

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("left", "right", "forward", "back")
	if direction:
		if Input.is_action_pressed("slow_mode"):
			self.velocity = direction * speed_slow
		else:
			self.velocity = direction * SPEED
	else:
		self.velocity = Vector2.ZERO
	change_animation(direction)	
	move_and_slide()
	
func change_animation(direction: Vector2):
	var animation: String
	if direction.x == 0 && direction.y == 0:
		animation= "idle"
	elif direction.x >= 0.1 :
		animation = "s_run"
		animated_sprite_2d.flip_h = true
	elif direction.x <= -0.1 :
		animation = "s_run"
		animated_sprite_2d.flip_h = false
	elif direction.x == 0 && direction.y >= 0.1:
		animation = "d_run"
	elif direction.x == 0 && direction.y <= -0.1:
		animation = "u_run"
		
	animated_sprite_2d.animation = animation
	
func lose_hp():
	if !isInvincible:
		current_hp = current_hp-1
		if current_hp == 0:
			player_dead.emit()
		inv_frame_timer.start()
		isInvincible = true
		hud.change_afterlife(current_hp)
	

func _on_inv_frame_timer_timeout() -> void:
	isInvincible = false

#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("jump"):
		#lose_hp()

func _on_area_2d_area_entered(area: Area2D) -> void:
	lose_hp()
