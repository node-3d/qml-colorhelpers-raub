Item {
	id: _item
	
	property real hue: 1
	
	ColorRect {
		id: _hue
		anchors.fill: parent
		colors: ["#FFFFFF", Qt.hsva(_item.hue, 1, 1, 1)]
		orientation: Gradient.Horizontal
	}
	
	ColorRect {
		anchors.fill: parent
		colors: ["#00000000", "#FF000000"]
	}
}
