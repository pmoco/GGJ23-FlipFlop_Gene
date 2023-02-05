class_name SickEvent extends Event

func triggerEvent(scene) :
	var age_number = randi() % 100
	var age
	if(age_number <30):
		age = Character.AGE.CHILD
	elif(  age_number < 50):
		age = Character.AGE.ADULT #20%
	else: #49%
		age = Character.AGE.ELDER
	var list_characters = scene.graph_holder.get_characters_by_age (age)
	var character_to_kill: Character = list_characters[randi() % list_characters.size()] # TODO select random
	if(!character_to_kill.is_alive):
		return -1
	if(character_to_kill.status != Character.STATUS.HEALTHY):
		self.title = "Fatal Sickness"
		self.text = character_to_kill.first_name+" " +character_to_kill.last_name+ " wasn't healthy and died of sickness"
		character_to_kill.is_alive = false
	
	else:
		self.title = "Sickness in the family"
		self.text = character_to_kill.first_name+" " +character_to_kill.last_name+ " got sick"
	
	self.eventName =  "ThisisaSickEvent"
	self.photoPath = "SPLASHART/SPLASHART_SICKNESS.png"
	
	return 0
	#Change character state
