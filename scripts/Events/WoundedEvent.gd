class_name WoundedEvent extends Event

func triggerEvent(scene) :
	var age_number = randi() % 100
	var age
	if(age_number <20):
		age = "child"
	elif(20 <= age_number and  age_number<70):
		age = "adult"
	elif(70 <= age_number):
		age = "elder"
	
	#get character
	self.title = "A member hurt itself"
	self.text = ""+"got injured"
	
	self.eventName =  "ThisisawoundedEvent"
	self.photoPath = "//"
	
	#Change character state
