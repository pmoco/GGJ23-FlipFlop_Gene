class_name SickEvent extends Event

func triggerEvent(scene) :
	var age_number = randi() % 100
	var age
	if(age_number <30):
		age = "child"
	elif(30 <= age_number and  age_number<50):
		age = "adult"
	elif(50 <= age_number):
		age = "elder"
	
	#get character
	self.title = "Sickness in the family"
	self.text = ""+"got sick"
	
	self.eventName =  "ThisisaSickEvent"
	self.photoPath = "//"
	
	#Change character state
