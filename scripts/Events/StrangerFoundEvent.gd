class_name StrangerFound  extends Event

var possible_names = ["Billy" ,  "Jilly", "skasd", "filly", "Gilly","Scrall","Mick","Pikle","Jikkle"]


func triggerEvent(scene) :
	
	var  StrangerFirstName = possible_names[randi() % possible_names.size()] 
	var StrangerLastName = possible_names[randi() % possible_names.size()]
	self.title = StrangerFirstName+ " " + StrangerLastName +" as Approached the tribe"
	self.text = "a Stranger approached and would like to join the community"
	
	scene.peopleCount = scene.peopleCount +1
	
	self.eventName =  "ThisisanEvent"
	self.photoPath = "SPLASHART/SPLASHART_STRANGER FOUND.png"
	
#	scene.graph_holder
	var stranger = Character.new()
	stranger.first_name = StrangerFirstName
	stranger.last_name = StrangerLastName
	stranger.age = Character.AGE.ADULT
	stranger.status = Character.STATUS.HEALTHY
	scene.graph_holder.add_character(stranger)
	return 0
