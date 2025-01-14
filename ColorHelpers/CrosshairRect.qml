Rectangle {
	id: _rect
	
	property real baseW: 12
	property real baseH: 12
	property color value: "white"
	property bool isRound: false
	
	anchors.centerIn: parent
	width: _rect.baseW + 3
	height: _rect.baseH + 3
	radius: _rect.isRound ? (_rect.baseH + 3) / 2 : 0
	color: "transparent"
	border.width: 3
	border.color: "black"
	border.pixelAligned: false
	antialiasing: true
	
	Rectangle {
		anchors.centerIn: parent
		width: _rect.baseW + 1
		height: _rect.baseH + 1
		radius: _rect.isRound ? (_rect.baseH + 2) / 2 : 0
		color: "transparent"
		border.width: 1.5
		border.color: _rect.value
		border.pixelAligned: false
		antialiasing: true
	}
}
