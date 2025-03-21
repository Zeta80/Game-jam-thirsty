extends Control

@export var option_menu: PackedScene
@export var select_scene: PackedScene
var option_menu_instance: Control
var select_scene_instance: Control

func _ready() -> void:
	DisplayServer.window_set_size(Vector2i(1024, 600))  # Imposta la risoluzione fissa
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_RESIZE_DISABLED, true)  # Disabilita il ridimensionamento
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/House_dialogue/house_scene.tscn")

func _on_button_scenes_pressed() -> void:
	select_scene_instance = select_scene.instantiate()
	add_child(select_scene_instance)
	select_scene_instance.connect("hide_select_scene", Callable(self, "hide_select_scene"))
	
func _on_button_options_pressed() -> void:
	option_menu_instance = option_menu.instantiate()
	add_child(option_menu_instance)
	option_menu_instance.connect("hide_option_menu", Callable(self, "hide_option_menu"))

func _on_button_exit_pressed() -> void:
	get_tree().quit()

func hide_option_menu() -> void:
	remove_child(option_menu_instance)
	
func hide_select_scene() -> void:
	remove_child(select_scene_instance)


func _on_button_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/scenes/credits.tscn")
