extends Popup

#signal update(tittle, description)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func open(title="", description="", photoPath = "") :
	find_node("Title").text = title
	find_node("Description").text = description
	if photoPath != "":
		find_node("EventWindowImage").texture = load(photoPath)
	popup_centered()
	
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
