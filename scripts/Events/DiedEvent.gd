class_name DiedEvent  extends Event


func triggerEvent(scene) :
	var age_number = randi() % 100
	var age
	if(age_number <30):
		age = "child"
	elif(30 <= age_number <50):
		age = "adult"
	elif(50 <= age_number):
		age = "elder"
	
	self.title = "Someone Died!"
	self.text = "Prepare the funeral "+"namehere"+" just died"
	
	scene.peopleCount = scene.peopleCount -1
	
	self.eventName =  "ThisisaDeathEvent"
	self.photoPath = "//"
	
	var alive_characters : Array = scene.graph_holder.get_alive_characters()
	if alive_characters.size() == 0:
		return
	var character_to_kill: Character = alive_characters[0] # TODO select random
	
	character_to_kill.is_alive = false
#	scene.graph_holder
	#var stranger = Character.new()
	#stranger.first_name = StrangerFirstName
	#stranger.last_name = StrangerLastName
	#stranger.age = Character.AGE.ADULT
	#stranger.status = Character.STATUS.HEALTHY
	#scene.graph_holder.add_character(stranger)
