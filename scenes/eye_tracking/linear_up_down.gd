extends Node2D

const move_speed := .001


func _ready() -> void:
	pass

var isForward := true

func _physics_process(delta: float) -> void:
	if (isForward): $Path2D/PathFollow2D.progress_ratio += move_speed
	else: $Path2D/PathFollow2D.progress_ratio -= move_speed
	
	if ($Path2D/PathFollow2D.progress_ratio >= 1 - move_speed or $Path2D/PathFollow2D.progress_ratio <= move_speed): 
		isForward = !isForward
	
