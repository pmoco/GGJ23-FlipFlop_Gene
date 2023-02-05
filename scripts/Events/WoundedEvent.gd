class_name WoundedEvent extends Event

func triggerEvent(scene) :
	var age_number = randi() % 100
	var age
	if(age_number <20):
		age = Character.AGE.CHILD
	elif(20 <= age_number and  age_number<70):
		age = Character.AGE.ADULT
	elif(70 <= age_number):
		age = Character.AGE.ELDER
	var list_characters = scene.graph_holder.get_characters_by_age (age)
	var character_to_kill: Character = list_characters[randi() % list_characters.size()] # TODO select random
	if(!character_to_kill.is_alive):
		return
	
	#get character
	self.title = "A member hurt itself"
	self.text = character_to_kill.first_name+" " +character_to_kill.last_name+ " got injured"
	
	self.eventName =  "ThisisawoundedEvent"
	self.photoPath = "//"
	
	#Change character state
