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

@onready var pathFollow = $Path2D/PathFollow2D

func _physics_process(delta: float) -> void:
	
	if (isForward): pathFollow.progress_ratio += move_speed
	else: pathFollow.progress_ratio -= move_speed
	
	# have it go backwards
	if (pathFollow.progress_ratio >= 1 - move_speed or pathFollow.progress_ratio <= move_speed): 
		isForward = !isForward
	
