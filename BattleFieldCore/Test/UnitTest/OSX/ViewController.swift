//
//  ViewController.swift
//  UnitTest
//
//  Created by Tomoo Hamada on 2018/11/17.
//  Copyright © 2018 Steel Wheels Project. All rights reserved.
//

import BattleFieldCore
import KiwiEngine
import KiwiLibrary
import KiwiControls
import CoconutData
import JavaScriptCore
import Cocoa

class ViewController: NSViewController
{
	@IBOutlet public var mConsoleView: KCConsoleView!
		
	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		let console = mConsoleView.console
		console.print(string: "Hello\n")

		let config  = KEConfig(kind: .Operation, doStrict: true, doVerbose: true)
		let machine = BFCMachine(kind: .Tank, config: config)

		guard let srcurl = URL.openPanel(title: "Select user script", selection: .SelectFile, fileTypes: ["js"]) else {
			console.error(string: "Failed to select use script")
			return
		}

		let compiler = BFCCompiler(console: console, config: config)
		guard compiler.compile(machine: machine, script: srcurl) else {
			console.error(string: "Failed to setup\n")
			return
		}

		machine.xPosition = 10.0
		machine.yPosition = 10.0
		machine.angle     = Double.pi / 2.0

		let object = machine.object
		object.importProperties(machine: machine)

		/* allocate operation */
		let owncontext = KEContext(virtualMachine: JSVirtualMachine())
		let operation  = KLOperation(ownerContext: owncontext, console: console, config: config)
		let program    = JSValue(object: "console.log(\"***** Program\\n\");", in: owncontext)
		let main       = JSValue(object: "function(){ console.log(\"***** main\\n\"); }", in: owncontext)
		let _ = operation.compile(program!, main!)

		let queue = KLOperationQueue(console: console)
		let _ = queue.execute(JSValue(object: operation, in: owncontext), JSValue(nullIn: owncontext))
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}


}

