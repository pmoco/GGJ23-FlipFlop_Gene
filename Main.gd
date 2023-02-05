extends Control

var graph_holder : GraphHolder

# Called when the node enters the scene tree for the first time.
func _ready():
	graph_holder = GraphHolder.new()
	add_child(graph_holder)
	
	graph_holder.init_default_graph()
	
#	print(graph_holder.characters_info_string())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
