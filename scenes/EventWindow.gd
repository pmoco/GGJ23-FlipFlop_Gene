extends Popup

#signal update(tittle, description)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _init():
	popup_exclusive = true
	
func open(title="", description="", photoPath = "") :
	
	
	find_node("Title").text = title
	find_node("Description").text = description
	if photoPath != "":
		find_node("EventWindowImage").texture = load(photoPath)
	popup_centered()
	
	#_scene.WindowOpened =true
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
