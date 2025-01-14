Item {
	id: _item
	
	signal valueChanged(value: color)
	
	property real widthHue: 30
	property real widthGap: 15
	property color color: "#666688"
	
	property real _tmpHue: -1
	property real _tmpSat: -1
	property real _tmpVal: -1
	property color _color: (
		_item._tmpHue > -1 ? Qt.hsva(_item._tmpHue, _item._tmpSat, _item._tmpVal, 1) : _item.color
	)
	property real _hue: Math.max(0, Math.min(1, _item._color.hsvHue))
	
	Timer {
		id: _timer
		interval: 1000
		running: false
		repeat: false
		onTriggered: {
			_item._tmpHue = -1;
			_item._tmpSat = -1;
			_item._tmpVal = -1;
		}
	}
	
	PickerSatVal {
		id: _sv
		width: _item.width - (_item.widthHue + _item.widthGap)
		height: _item.height
		
		color: _item._color
		
		onValueChanged: (sat, val) => {
			_item._tmpHue = _item._hue;
			_item._tmpSat = sat;
			_item._tmpVal = val;
			_timer.restart();
			_item.valueChanged(Qt.hsva(_hue.hue, sat, val, 1));
		}
	}
	
	PickerHue {
		id: _hue
		
		width: _item.widthHue
		height: _item.height
		
		hue: _item._hue
		x: _sv.x + _sv.width + _item.widthGap
		
		onValueChanged: (hue) => {
			const tmpSat = _item._color.hsvSaturation;
			const tmpVal = _item._color.hsvValue;
			_item._tmpSat = tmpSat;
			_item._tmpVal = tmpVal;
			_item._tmpHue = hue;
			_timer.restart();
			_item.valueChanged(Qt.hsva(hue, tmpSat, tmpVal, 1));
		}
	}
}
