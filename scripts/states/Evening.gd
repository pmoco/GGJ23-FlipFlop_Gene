class_name Evening extends State




# Called when the node enters the scene tree for the first time.
func _init():
	nameState = "EVENING"
	nextState = null


func run() ->void : 
	print("am Running %s"  % nameState)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
