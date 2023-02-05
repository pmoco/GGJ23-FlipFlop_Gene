class_name Night extends State




# Called when the node enters the scene tree for the first time.
func _init():
	nameState = "NIGHT"
	nextState = null


func run(scene) ->void : 
	var flag
	print("am Running %s"  % nameState)
	var event  =  scene.eventManager.getDineEvent(scene)
	flag = event.triggerEvent( scene)
	if flag == 0 :
		var eventWindow = scene.EventWindow
		eventWindow.open(event.title , event.text, event.photoPath)
	
func feed():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
