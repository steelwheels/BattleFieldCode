/**
 * @file	BFCCompiler.swift
 * @brief	Define BFCCompiler class
 * @par Copyright
 *   Copyright (C) 2018 Steel Wheels Project
 */

import KiwiEngine
import KiwiLibrary
import CoconutData
import JavaScriptCore
import Foundation

public class BFCCompiler: KLCompiler
{
	public override init(console cons: CNConsole, config conf: KEConfig) {
		super.init(console: cons, config: conf)
	}

	public func compile(machine target: BFCMachine, script srcurl: URL) -> Bool {
		/* Compile Libraries */
		let context = target.context
		guard super.compile(context: context) else {
			return false
		}

		/* Define machine object */
		let object = target.object
		log(string: "/* Define _machine_info */\n")
		context.set(name: "_machine_info", object: object)
		compile(context: context, instance: "_machine_info", object: object)

		/* Define machine class */
		guard defineMachineClass(context: context) else {
			return false
		}

		/* Read user scripts */
		if let script = readFromURL(URL: srcurl) {
			let _ = compile(context: context, statement: script)
		} else {
			console.error(string: "Failed to read user script\n")
			return false
		}

		/* The global variale "machine" must be defined in user script */
		guard let _ = context.objectForKeyedSubscript("machine") else {
			console.error(string: "The global variable \"machine\" must be defined in the user script")
			return false
		}

		/* Define main function */
		let mainscr =   "function main() {\n" +
				"    machine.action() ;\n" +
				"};\n"
		let _ = compile(context: context, statement: mainscr)

		/* End of compile process */
		log(string: "/* Finish compile process */\n")
		return true
	}

	private func defineMachineClass(context ctxt: KEContext) -> Bool {
		if let script = readResource(fileName: "Script/machine", fileExtension: "js", forClass: BFCCompiler.self) {
			let _ = compile(context: ctxt, statement: script)
			return true
		} else {
			return false
		}
	}
}

