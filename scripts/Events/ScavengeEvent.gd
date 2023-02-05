class_name ScavengeEvent  extends Event


func triggerEvent(scene) :
	self.title = "Scavenge details"
	self.text = "The comunity have been searching Shomble berries\n Gain in food: "+ String(scene.gain) + "\nRisk: "+ String(scene.risk)
	
	scene.food = scene.gain + scene.food
	self.eventName =  "ThisisaScavengeEvent"
	self.photoPath = "SPLASHART/SPLASHART_HARVESTING.png"
	
	return 0
#	scene.graph_holder
