class_name StrangerFound  extends Event 

var possible_names = ["Billy" ,  "Jilly", "skasd"]


func triggerEvent(scene  ) :
	
	var  StrangerName = possible_names[randi() % possible_names.size()] + " " + possible_names[randi() % possible_names.size()]
	
	self.title = StrangerName +" as Approached the tribe"
	
	self.text = "a Stranger approached and called you a great bug fortune  (+1 Pepl)"
	
	scene.peopleCount = scene.peopleCount +1 
	
	self.eventName =  "ThisisanEvent"
	self.photoPath = "//"
	
	 
