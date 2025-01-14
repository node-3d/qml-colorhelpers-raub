# Color Helpers for QML

This is a part of [Node3D](https://github.com/node-3d) project.

[![NPM](https://badge.fury.io/js/qml-colorhelpers-raub.svg)](https://badge.fury.io/js/qml-colorhelpers-raub)

```console
npm i -s qml-colorhelpers-raub
```

Simple HSV-oriented color pickers and colored rectangles for QML. The data flow is similar
to React: app.color -> picker.color -> picker.signal -> app.update -> app.color. That is,
unless the app accepts the color change, the picker.color will remain the same, and
will not override the input.


### PickerHsv

Combines `PickerSatVal` and `PickerHue`. The pickers will occupy the whole
item area. Use `widthHue` and `widthGap` to control how the area is distributed.

```js
PickerHsv {
	// set explicit size or anchors! or it will be 0x0
	width: 195
	height: 150
	
	widthHue: 30 // the default
	widthGap: 15 // the default
	color: app.color // <-- must be from outside
	onValueChanged: value => {
		console.log("PickerHsv onValueChanged", value);
		app.color = value;
	}
}
```


### PickerHue

A vertical box to select color hue. The picker fills the whole item area.

```js
PickerHue {
	// set explicit size or anchors! or it will be 0x0
	width: 30
	height: 150
	
	crossSize: 12 // the default
	crossShape: "boxFlat" // the default, 
	hue: app.hue // <-- must be from outside
	onValueChanged: value => {
		console.log("PickerHue onValueChanged", value);
		app.hue = value;
	}
}
```


### PickerHue

A gradient box to select color saturation and value.
The picker fills the whole item area.

```js
PickerSatVal {
	// set explicit size or anchors! or it will be 0x0
	width: 150
	height: 150
	
	crossSize: 12 // the default
	crossShape: "circle" // the default
	color: app.color // <-- must be from outside
	onValueChanged: (sat, val) => {
		console.log("PickerSatVal onValueChanged", sat, val);
		app.color = Qt.hsva(color.hsvHue, sat, val, 1);
	}
}
```


### ColorRect

Convenient gradient Rectangle where you only need to provide the list of colors.
The colors will spread uniformly across the area.

```js
ColorRect {
	colors: ["white", "black"] // the default
	orientation: Gradient.Vertical // the default
}
```


### ColorRectHue

Same as `ColorRect`, but prebuilt with hue color list.


### ColorRectSatVal

Runs 2 overlayed `ColorRect` items to emulate saturation-value
color variations. Provide a hue value to set the base color.

```js
ColorRectSatVal {
	hue: 1 // the default
}
```


### Crosshair

Visual handle to show the current value on color pickers. It receives
the position coordinates `u, v` in percent, and positions to fit its center over that spot.

```js
Crosshair {
	shape: "box" // "box" "boxFlat" "circle" "circleFlat"
	u: 0 // 0.0 - 1.0 horizontal location
	v: 0 // 0.0 - 1.0 vertical location
	size: 12 // the default
	color: "white" // the default
}
```


### CrosshairRect

A small helper to draw "outlined" rectangles for crosshairs.

```js
CrosshairRect {
	baseW: 12 // the default
	baseH: 12 // the default
	value: "white" // not "color" because this is in fact a Rectangle
	isRound: false // shape - rounded or not
}
```

### MouseRect

A `u, v` oriented mouse area. Meaning it will report coordinates in percents,
ranging from `0.0` to `1.0`. Good for sliders and 2D sliders (as in color pickers).
Has optional margins, because slider knobs usually can go past the selection area, and
should still seem interactive.

```js
MouseArea {
	uMargin: 0 // the default
	vMargin: 0 // the default
	onUvChanged: (u, v) => {
		console.log("MouseArea onUvChanged", sat, val);
	}
```


## Importing

The `./ColorHelpers` directory should be visible to QML engine for importing.

```qml
import ColorHelpers
```

### C++ import path

```cpp
qmlEngine->addImportPath("path to qml-colorhelpers-raub");
```

### Node.js qml-raub

```js
View.libs(require('qml-colorhelpers-raub').absPath);
```

### Manual

Copy this repo or even specifically the `./ColorHelpers` folder to wherever your QML is
ready to grab it. Or use this repo as a submodule if you wish.
