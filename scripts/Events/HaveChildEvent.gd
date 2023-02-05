class_name HaveChildEvent  extends Event

var possible_names = ["Billy" ,  "Jilly", "skasd", "filly", "Gilly"]


func triggerEvent(scene) :
	var i=0
	var  BabyFirstName = possible_names[randi() % possible_names.size()] 
	var BabyLastName = possible_names[randi() % possible_names.size()]
	
	var list_characters = scene.graph_holder.get_characters_by_age (Character.AGE.ADULT)
	var character: Character = list_characters[randi() % list_characters.size()] # TODO select random
	if(!character.is_alive):
		return -1
	while(i<50 and !is_instance_valid(character.partner) ):
		i=i+1
		if (is_instance_valid(character.partner)):
			break
		character = list_characters[randi() % list_characters.size()] # TODO select random
		if(!character.is_alive):
			return
	self.title = character.first_name+" " +character.last_name+" and "+character.partner.first_name+" " +character.partner.last_name+ " had a baby"
	self.text = "A new Baby called "+ BabyFirstName+ " " + BabyLastName + " came to this world (+1 Pepl)"
	
	scene.peopleCount = scene.peopleCount +1
	
	self.eventName =  "ThisisanEvent"
	self.photoPath = "SPLASHART/SPLASHART_BABY.png"
	
#	scene.graph_holder
	var baby = Character.new()
	baby.first_name = BabyFirstName
	baby.last_name = BabyLastName
	baby.age = Character.AGE.CHILD
	baby.is_child_of(character) 
	baby.is_child_of(character.partner) 
	scene.graph_holder.add_character(baby)
	
	return 0
