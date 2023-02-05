extends Popup

#signal update(tittle, description)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func open(_scene=null, HuntRisk=0.0, HuntGain=0.0, ScavRisk = 0.0, ScavGain=0.0,FarmRisk=0.0,FarmGain=0.0,FishRisk=0.0,FishGain=0.0) :
	find_node("HuntRisk").text = "%s " %HuntRisk
	find_node("HuntGain").text = "%s " %HuntGain
	find_node("ScavRisk").text = "%s " %ScavRisk
	find_node("ScavGain").text = "%s " %ScavGain
	find_node("FarmRisk").text = "%s " %FarmRisk
	find_node("FarmGain").text = "%s " %FarmGain
	find_node("FishRisk").text = "%s " %FishRisk
	find_node("FishGain").text = "%s " %FishGain
	popup_centered()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HuntButton_pressed():
	if self.is_visible():
		self.hide()


func _on_ScavButton_pressed():
	if self.is_visible():
		self.hide() # Replace with function body.


func _on_FarmButton_pressed():
	if self.is_visible():
		self.hide() # Replace with function body.


func _on_FishButton_pressed():
	if self.is_visible():
		self.hide() # Replace with function body.
