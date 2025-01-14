ColorRectHue {
	id: _hue
	
	signal valueChanged(hue: real)
	
	property real hue: 0
	property real crossSize: 12
	property string crossShape: "boxFlat"
	
	property real _tmpHue: -1
	
	Timer {
		id: _timer
		interval: 1000
		running: false
		repeat: false
		onTriggered: {
			_hue._tmpHue = -1;
		}
	}
	
	Crosshair {
		shape: _hue.crossShape
		size: _hue.crossSize
		color: "white"
		u: 0.5
		v: _hue._tmpHue > -1 ? _hue._tmpHue : _hue.hue
	}
	
	MouseRect {
		id: _mouse
		vMargin: _hue.crossSize
		onUvChanged: (u, v) => {
			_hue._tmpHue = v;
			_timer.restart();
			_hue.valueChanged(v);
		}
	}
}
