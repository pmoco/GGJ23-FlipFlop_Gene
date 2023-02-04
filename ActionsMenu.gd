class_name ActionsMenu extends Control

func _ready():
	$Agriculture/Label.text = "Let's plant some potatoes\nrisk : "+"3\n"+"Food: "+"3\n"
	
	$Scavenge/Label.text ="Let's get some berries\nrisk : "+"3\n"+"Food: "+"3\n"
	
	$Hunt/Label2.text ="Let's hunt some deers\nrisk : "+"3\n"+"Food: "+"3\n"
	
	$Fishing/Label.text = "Let's go on relaxing fishing day\nrisk : "+"3\n"+"Food: "+"3\n"
	
func _on_Fishing_pressed():
	pass # Replace with function body.


func _on_Hunt_pressed():
	pass # Replace with function body.


func _on_Scavenge_pressed():
	pass # Replace with function body.


func _on_Agriculture_pressed():
	pass # Replace with function body.
