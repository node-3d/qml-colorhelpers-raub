Rectangle {
	id: _rect
	
	property list<color> colors: ["white", "black"]
	property alias orientation: _gradient.orientation
	
	Component {
		id: _stop
		GradientStop {}
	}
	
	function _fillStops() {
		const countColors = _rect.colors.length;
		if (countColors < 2) {
			return;
		}
		const step = 1 / (countColors - 1);
		const newStops = [];
		
		for (let i = 0, j = 0; j <= 1; i++, j += step) {
			const stop = _stop.createObject(
				_rect,
				{ position: j, color: colors[i] },
			);
			newStops.push(stop);
		}
		
		_gradient.stops = newStops;
		_rect.update()
	}
	
	onColorsChanged: _fillStops()
	
	gradient: Gradient {
		id: _gradient
	}
}
