
class Tank extends Machine {
	action(){
		console.log("Hello, world !!\n") ;

		const pos = this.position ;
		console.log(" position = " + pos.description + "\n") ;

		console.log("Bye\n") ;
	}
} ;

var machine = new Tank() ;
