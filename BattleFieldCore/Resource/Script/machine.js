/**
 * machine.js
 */

class Machine {
	get position() {
		let x = _machine_info.xPosition ;
		let y = _machine_info.yPosition ;
		return new Point(x, y)
	}

	action() {
		/* descript machine action here */
	}
}
