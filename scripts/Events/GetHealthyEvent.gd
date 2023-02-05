class_name GetHealthyEvent extends Event

func triggerEvent(scene) :
	var i=0
	var age_number = randi() % 100
	var age
	if(age_number <30):
		age = Character.AGE.CHILD
	elif(  age_number < 90):
		age = Character.AGE.ADULT #20%
	else: #49%
		age = Character.AGE.ELDER
	var list_characters = scene.graph_holder.get_characters_by_age (age)
	var character_to_kill: Character = list_characters[randi() % list_characters.size()] # TODO select random
	if(!character_to_kill.is_alive):
		return -1
	while(i<50 and character_to_kill.status != Character.STATUS.SICK and character_to_kill.status != Character.STATUS.WOUNDED):
		i=i+1
		if (character_to_kill.status == Character.STATUS.SICK or character_to_kill.status == Character.STATUS.WOUNDED):
			break
		character_to_kill = list_characters[randi() % list_characters.size()] # TODO select random
			
	
	if(character_to_kill.status == Character.STATUS.SICK):
		self.title = "Sick no more"
		self.text = character_to_kill.first_name+" " +character_to_kill.last_name+ " Recovered from the sickness"
	
	if(character_to_kill.status == Character.STATUS.WOUNDED):
		self.title = "Recovered from injury"
		self.text = character_to_kill.first_name+" " +character_to_kill.last_name+ " Recovered from the injury"
	
	else:
		return -1
		
	self.eventName =  "ThisisaGetHealthyEvent"
	self.photoPath = "SPLASHART/SPLASHART_SICKNESS.png"
	
	return 0
	#Change character state
