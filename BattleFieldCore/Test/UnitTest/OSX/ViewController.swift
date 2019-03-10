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

		let config  = KLConfig(kind: .Operation, doStrict: true, doVerbose: true)
		config.doUseGraphicsPrimitive = true

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
		let operation = KLOperation(console: console, config: config)
		let context   = operation.context
		let program   = JSValue(object: "console.log(\"***** Program\\n\");", in: context)
		let main      = JSValue(object: "function(){ console.log(\"***** main\\n\"); }", in: context)
		let _ = operation.compile(program!, main!)

		let queue = KLOperationQueue()
		let _ = queue.execute(JSValue(object: operation, in: context), JSValue(nullIn: context))
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}


}

