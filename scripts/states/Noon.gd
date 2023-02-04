class_name Noon extends State


# Called when the node enters the scene tree for the first time.
func _init():
	nameState = "NOON"
	nextState = null
	# Replace with function body.

func run() ->void : 
	print("am Running %s"  % nameState)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
