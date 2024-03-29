extends Node2D

const move_speed := .01

@onready var line = $Line2D
@onready var path = $Path2D


func _ready() -> void:
	
	# Draw line on top of PathFollow2D Node
	line.clear_points()
	for point in path.curve.get_baked_points():
		line.add_point(point + path.position)
	
	pass

var isForward := true

func _physics_process(delta: float) -> void:
	if (isForward): $Path2D/PathFollow2D.progress_ratio += move_speed
	else: $Path2D/PathFollow2D.progress_ratio -= move_speed
	
	# have it go backwards
	if ($Path2D/PathFollow2D.progress_ratio >= 1 - move_speed or $Path2D/PathFollow2D.progress_ratio <= move_speed): 
		isForward = !isForward
	
