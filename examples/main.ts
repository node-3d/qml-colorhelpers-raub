import * as three from 'three';
import { init, addThreeHelpers } from '3d-core-raub';
import { init as initQml } from '3d-qml-raub';


const {
	doc, Image: Img, gl, Screen,
} = init({
	isGles3: true,
	isWebGL2: true,
	autoEsc: true,
	autoFullscreen: true,
	title: 'Color Helpers',
	width: 192 * 3,
	height: 108 * 3,
});
addThreeHelpers(three, gl);

const { QmlOverlay, loop, View } = initQml({ doc, gl, cwd: process.cwd(), three });
View.libs('..');

const icon = new Img('qml.png'); // use `npm run gui` from "examples", so CWD is there
icon.on('load', () => { doc.icon = (icon as unknown as typeof doc.icon); });

const screen = new Screen({ three });

const overlay = new QmlOverlay({ file: 'qml/gui.qml' });
screen.scene.add(overlay.mesh);

loop(() => screen.draw());
