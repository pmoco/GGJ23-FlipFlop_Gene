class_name HuntEvent  extends Event

func triggerEvent(scene) :
	self.title = "Hunt details"
	self.text = "The comunity have been hunting some Floobres\n Gain in food: "+ String(scene.gain) + "\nRisk: "+ String(scene.risk)
	
	scene.food = scene.gain + scene.food
	self.eventName =  "ThisisaHuntEvent"
	self.photoPath = "SPLASHART/SPLASHART_HUNTING.png"
	
	return 0
#	scene.graph_holder
