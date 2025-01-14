Item {
	id: _item
	
	property string shape: "box"
	property real u: 0
	property real v: 0
	property real size: 12
	property color color: "white"
	
	property real _maxW: parent.width
	property real _maxH: parent.height
	
	width: 0
	height: 0
	clip: false
	x: _maxW * (shape.includes("Flat") ? 0.5 : u)
	y: _maxH * v
	
	Component {
		id: _box
		CrosshairRect { isRound: false }
	}
	
	Component {
		id: _boxFlat
		CrosshairRect { isRound: false }
	}
	
	Component {
		id: _circle
		CrosshairRect { isRound: true }
	}
	
	Component {
		id: _circleFlat
		CrosshairRect { isRound: true }
	}
	
	function _selectComponent() {
		const shapeMap = {
			box: _box,
			boxFlat: _boxFlat,
			circle: _circle,
			circleFlat: _circleFlat,
		};
		return shapeMap[_item.shape] || _circle;
	}
	
	Binding {
		target: _ld.item
		property: "baseW"
		value: _item.shape.includes("Flat") ? _item._maxW : _item.size
	}
	
	Binding {
		target: _ld.item
		property: "baseH"
		value: _item.size
	}
	
	Binding {
		target: _ld.item
		property: "value"
		value: _item.color
	}
	
	Loader {
		id: _ld
		anchors.centerIn: parent
		sourceComponent: _item._selectComponent()
	}
}
