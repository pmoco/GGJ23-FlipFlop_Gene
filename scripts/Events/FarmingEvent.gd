class_name FarmingEvent  extends Event


func triggerEvent(scene) :
	self.title = "Farming details"
	self.text = "The comunity have been planting some bots\n Gain in food: "+ String(scene.gain) + "\nRisk: "+ String(scene.risk)
	
	scene.food = scene.gain + scene.food
	self.eventName =  "ThisisaAgricultureEvent"
	self.photoPath = "SPLASHART/SPLASHART_FARMING.png"
	
	return 0
#	scene.graph_holder
