import ColorHelpers


Rectangle {
	id: _root
	anchors.fill: parent
	
	color: 'black'
	
	Rectangle {
		color: 'black'
		anchors.top: parent.top
		anchors.right: parent.right
		anchors.bottom: parent.verticalCenter
		anchors.left: parent.left
		
		PickerHsv {
			anchors.top: parent.top
			anchors.right: parent.horizontalCenter
			anchors.bottom: parent.bottom
			anchors.left: parent.left
			anchors.margins: 10
			
			color: _root.color
			onValueChanged: (color) => { _root.color = color; }
		}
		
		PickerHsv {
			anchors.top: parent.top
			anchors.right: parent.right
			anchors.bottom: parent.bottom
			anchors.left: parent.horizontalCenter
			anchors.margins: 10
			
			color: _root.color
			onValueChanged: (color) => { _root.color = color; }
		}
	}
	
	Item {
		anchors.top: parent.verticalCenter
		anchors.right: parent.right
		anchors.bottom: parent.bottom
		anchors.left: parent.left
		
		Text {
			anchors.centerIn: parent
			text: "The color is synchronized\nback and forth through _root.color"
			horizontalAlignment: Qt.AlignCenter
			color: "white"
			style: Text.Outline
			styleColor: "black"
			font.pixelSize: 24
		}
	}
}
