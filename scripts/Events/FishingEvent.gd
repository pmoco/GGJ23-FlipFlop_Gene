class_name FishingEvent  extends Event


func triggerEvent(scene) :
	self.title = "Fishing details"
	self.text = "The comunity have been fishing some fishburs\n Gain in food: "+ String(scene.gain) + "\nRisk: "+ String(scene.risk)
	
	scene.food = scene.gain + scene.food
	self.eventName =  "ThisisaFishingEvent"
	self.photoPath = "SPLASHART/SPLASHART_FISHING.png"
	
	return 0
#	scene.graph_holder
