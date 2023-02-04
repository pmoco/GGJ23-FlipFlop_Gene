class_name Night extends State




# Called when the node enters the scene tree for the first time.
func _init():
	nameState = "NIGHT"
	nextState = null


func run(scene) ->void : 
	print("am Running %s"  % nameState)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
