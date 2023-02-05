class_name Evening extends State




# Called when the node enters the scene tree for the first time.
func _init():
	nameState = "EVENING"
	nextState = null

var rng = RandomNumberGenerator.new()

func run(scene) ->void : 
	var flag
	print("am Running %s"  % nameState)
	
	var people =  scene.graph_holder.get_alive_characters()
	var event =null
	
	for p in people :
		rng.randomize()
		var rdm = rng.randf_range(0.0, 100.0)
		if rdm < 10 :
			 event  =  scene.eventManager.getDayEvent(scene)
		elif rdm>100-scene.risk:
			event = scene.eventManager.getBadEvent(scene)
		if event :
			flag = event.triggerEvent( scene)
			if flag == 0:
				var eventWindow = scene.EventWindow
				eventWindow.open(event.title , event.text, event.photoPath)
		
	
	endEvent(scene)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func endEvent(scene):
	var event = null
	match (scene.action) :
		"HUNT":
			event = scene.eventManager.getHuntEvent(scene)
		"SCAV":
			event = scene.eventManager.getScavengeEvent(scene)
		"FISH":
			event = scene.eventManager.getFishingEvent(scene)
		"FARM":
			event = scene.eventManager.getFarmingEvent(scene)
			
	if event :
		event.triggerEvent(scene)
		scene.EventWindow.open(event.title , event.text, event.photoPath)
