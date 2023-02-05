class_name MarryEvent  extends Event

var possible_names = ["Billy" ,  "Jilly", "skasd", "filly", "Gilly"]


func triggerEvent(scene) :
	
	var  BabyFirstName = possible_names[randi() % possible_names.size()] 
	var BabyLastName = possible_names[randi() % possible_names.size()]
	
	var list_characters = scene.graph_holder.get_characters_by_age (Character.AGE.ADULT)
	var character1: Character = list_characters[randi() % list_characters.size()] # TODO select random
	if(!character1.is_alive):
		return
	var character2: Character = list_characters[randi() % list_characters.size()] # TODO select random
	if(!character2.is_alive):
		return
	self.title = character1.first_name+" " +character1.last_name+" as Married with "+character2.first_name+" " +character2.last_name
	self.text = "A new Baby called "+ BabyFirstName+ " " + BabyLastName + " came to this world (+1 Pepl)"
	
	scene.peopleCount = scene.peopleCount +1
	
	self.eventName =  "ThisisanEvent"
	self.photoPath = "ASSETS/SPLASHART_FISHING.png"
	
#	scene.graph_holder
	var baby = Character.new()
	baby.first_name = BabyFirstName
	baby.last_name = BabyLastName
	baby.age = Character.AGE.CHILD
	baby.status = Character.STATUS.HEALTHY
	character1.marry(character2)
	baby.is_child_of(character1) 
	baby.is_child_of(character2) 
	scene.graph_holder.add_character(baby)
