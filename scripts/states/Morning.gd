class_name Morning extends State




# Called when the node enters the scene tree for the first time.
func _init():
	nameState = "MORNING"
	nextState = null


func run(scene) ->void : 
	scene.days = scene.days +1
	print("_______________NEW DAY %s______________"%scene.days) 
	var event  =  scene.eventManager.getNightEvent(scene)
	
	print(event.eventName)
	
	
	event.triggerEvent( scene)
	
	var eventWindow = scene.EventWindow
	eventWindow.open(event.title , event.text, event.photoPath)
	# 	var event = scene.eventManager.GetNightEvent()
	#  	event.show() 
	#	event.run(scene)
	
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
