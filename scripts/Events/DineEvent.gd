class_name DineEvent  extends Event


func triggerEvent(scene) :
	self.title = "Time to dine"
	self.text = "Food: "+ String(scene.food) + "\nPeople to feed: "+ String(scene.peopleCount)+ "\n Children eat first"
	
	self.eventName =  "ThisisaDineEvent"
	self.photoPath = "//"
	
	return 0
#	scene.graph_holder
	#var stranger = Character.new()
	#stranger.first_name = StrangerFirstName
	#stranger.last_name = StrangerLastName
	#stranger.age = Character.AGE.ADULT
	#stranger.status = Character.STATUS.HEALTHY
	#scene.graph_holder.add_character(stranger)
