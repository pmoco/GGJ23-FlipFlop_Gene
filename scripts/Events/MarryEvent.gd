class_name MarryEvent  extends Event

func triggerEvent(scene) :
	
	var list_characters = scene.graph_holder.get_characters_by_age (Character.AGE.ADULT)
	var character1: Character = list_characters[randi() % list_characters.size()] # TODO select random
	if(!character1.is_alive):
		return
	var character2: Character = list_characters[randi() % list_characters.size()] # TODO select random
	if(!character2.is_alive):
		return
	
	if is_instance_valid(character1.partner):
		return -1
	if is_instance_valid(character2.partner):
		return -1
	self.title = character1.first_name+" " +character1.last_name+" as Married with "+character2.first_name+" " +character2.last_name
	self.text = "Prepare the wedding love is in the air"
	
	scene.peopleCount = scene.peopleCount +1
	
	self.eventName =  "ThisisanEvent"
	self.photoPath = "ASSETS/SPLASHART_FISHING.png"
	
#	scene.graph_holder
	character1.marry(character2)
	
	return 0
	
