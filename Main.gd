extends Control

var characters = []


# Called when the node enters the scene tree for the first time.
func _ready():	
	var A = Character.new()
	A.first_name = "A"
	A.last_name = "Fliby"
	A.age = Character.AGE.ELDER
	A.status = Character.STATUS.WOUNDED
	characters.append(A)
	
	var B = Character.new()
	B.first_name = "B"
	B.last_name = "Flob"
	B.age = Character.AGE.ELDER
	characters.append(B)
	
	var C = Character.new()
	C.first_name = "C"
	C.last_name = "Flab"
	C.age = Character.AGE.ELDER
	characters.append(C)
	
	B.marry(C)

	var D = Character.new()
	D.first_name = "D"
	D.last_name = "Flobady"
	D.age = Character.AGE.ELDER
	characters.append(D)
	
	A.marry(D)
	
	
	var E = Character.new()
	E.first_name = "E"
	E.age = Character.AGE.ADULT
	characters.append(E)
	
	E.is_child_of(B)
	E.is_child_of(C)
	
	var G = Character.new()
	G.first_name = "G"
	G.age = Character.AGE.ADULT
	characters.append(G)
	
	G.is_child_of(B)
	G.is_child_of(C)
	
	var H = Character.new()
	H.first_name = "H"
	H.age = Character.AGE.ADULT
	characters.append(H)
	
	H.is_child_of(B)
	H.is_child_of(C)
	
	var F = Character.new()
	F.first_name = "F"
	F.age = Character.AGE.ADULT
	characters.append(F)
	
	F.is_child_of(A)
	F.is_child_of(D)
	
	H.marry(F)
	
	var I = Character.new()
	I.first_name = "I"
	I.age = Character.AGE.CHILD
	characters.append(I)
	
	I.is_child_of(H)
	I.is_child_of(F)
	
	for character in characters:
		print(character)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
