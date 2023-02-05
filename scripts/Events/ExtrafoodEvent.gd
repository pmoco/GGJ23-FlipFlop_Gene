class_name ExtrafoodEvent  extends Event


func triggerEvent(scene) :
	#get random character
	self.title = "A member found extra food"
	
	self.text = "name here"+" found a pile of food"
	
	scene.food = scene.food +5
	
	self.eventName =  "ThisisanextrafoodEvent"
	self.photoPath = "//"
