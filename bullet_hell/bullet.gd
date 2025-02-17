extends Node2D
@export var speed: float = 100
@onready var timer: Timer = $Timer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.x * speed * delta


func _on_kill_timer_timeout() -> void:
	queue_free()
