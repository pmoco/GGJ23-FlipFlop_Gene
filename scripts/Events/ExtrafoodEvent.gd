class_name ExtrafoodEvent  extends Event


func triggerEvent(scene) :
	#get random character
	var list_characters : Array = scene.graph_holder.get_alive_characters()
	if list_characters.size() == 0:
		return
	var character: Character = list_characters[randi() % list_characters.size()] # TODO select random
	self.title = "A member found extra food"
	
	self.text = character.first_name+" " +character.last_name+ " found a pile of food"
	
	scene.food = scene.food +5
	
	self.eventName =  "ThisisanextrafoodEvent"
	self.photoPath = "ASSETS/SPLASHART_EXTRA FOOD.png"
	return 0
