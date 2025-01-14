MouseArea {
	id: _mouse
	
	signal uvChanged(u: real, v: real)
	
	property real uMargin: 0
	property real vMargin: 0
	
	anchors.fill: parent
	anchors.leftMargin: -uMargin
	anchors.rightMargin: -uMargin
	anchors.topMargin: -vMargin
	anchors.bottomMargin: -vMargin
	
	function _handleMouse(event) {
		if (event.buttons & Qt.LeftButton === 0) {
			return;
		}
		
		const x = event.x - uMargin;
		const y = event.y - vMargin;
		const w = width - 2 * uMargin;
		const h = height - 2 * vMargin;
		const u = Math.max(0, Math.min(w,  x)) / w;
		const v = Math.max(0, Math.min(h, y)) / h;
		
		uvChanged(u, v);
	}
	
	onPositionChanged: event => _handleMouse(event)
	onPressed: event => _handleMouse(event)
}
