class_name Evening extends State




# Called when the node enters the scene tree for the first time.
func _init():
	nameState = "EVENING"
	nextState = null


func run(scene) ->void : 
	print("am Running %s"  % nameState)
	var event  =  scene.eventManager.getTaskEvent(scene)
	
	print(event.eventName)
	
	
	event.triggerEvent( scene)
	
	var eventWindow = scene.EventWindow
	eventWindow.open(event.title , event.text, event.photoPath)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
