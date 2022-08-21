extends Label

func _process(delta):
	self.text = get_parent().get_parent().get_parent().points
