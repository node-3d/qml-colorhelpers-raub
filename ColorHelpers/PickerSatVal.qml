ColorRectSatVal {
	id: _sv
	
	signal valueChanged(sat: real, val: real)
	
	property real crossSize: 12
	property string crossShape: "circle"
	property color color: "#666688"
	
	property real _sat: _sv.color.hsvSaturation
	property real _val: _sv.color.hsvValue
	
	property real _tmpSat: -1
	property real _tmpVal: -1
	
	property real _hue: _sv.color.hsvHue
	hue: _sv._hue >= 0 ? _sv._hue : 0
	
	Timer {
		id: _timer
		interval: 1000
		running: false
		repeat: false
		onTriggered: {
			_sv._tmpSat = -1;
			_sv._tmpVal = -1;
		}
	}
	
	Crosshair {
		size: _sv.crossSize
		shape: _sv.crossShape
		color: "white"
		u: _sv._tmpSat > -1 ? _sv._tmpSat : _sv._sat
		v: 1.0 - (_sv._tmpVal > -1 ? _sv._tmpVal : _sv._val)
	}
	
	MouseRect {
		vMargin: _sv.crossSize
		uMargin: _sv.crossSize
		onUvChanged: (u, v) => {
			_sv._tmpSat = u;
			_sv._tmpVal = 1.0 - v;
			_timer.restart();
			_sv.valueChanged(u, 1.0 - v);
		}
	}
}
