class_name DiedEvent  extends Event


func triggerEvent(scene) :
	var age_number = randi() % 100
	var age
	print(age_number)
	if(age_number <25):
		age = Character.AGE.CHILD
	elif(  age_number < 50):
		age = Character.AGE.ADULT #20%
	else: #49%
		age = Character.AGE.ELDER
	var list_characters = scene.graph_holder.get_characters_by_age (age)
	var character_to_kill: Character = list_characters[randi() % list_characters.size()] # TODO select random
	if !character_to_kill.is_alive:
		print(character_to_kill.is_alive)
		return -1
	self.title = "Someone passed away!"
	self.text = "Prepare the funeral "+character_to_kill.first_name+" " +character_to_kill.last_name+ "just left this world"
	
	self.eventName =  "ThisisaDeathEvent"
	self.photoPath = "SPLASHART/SPLASHART_DEATH.png"
	
	character_to_kill.is_alive = false
	return 0
#	scene.graph_holder
	#var stranger = Character.new()
	#stranger.first_name = StrangerFirstName
	#stranger.last_name = StrangerLastName
	#stranger.age = Character.AGE.ADULT
	#stranger.status = Character.STATUS.HEALTHY
	#scene.graph_holder.add_character(stranger)
