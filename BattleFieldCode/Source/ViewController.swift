/**
 * @file	ViewController.swift
 * @brief	Define ViewController class
 * @par Copyright
 *   Copyright (C) 2018 Steel Wheels Project
 */

import AmberComponent
import KiwiControls
import CoconutData
#if os(OSX)
import Cocoa
#else
import UIKit
#endif

class ViewController: AMCMultiViewController
{
	#if os(OSX)
	public override func viewWillAppear() {
		super.viewWillAppear()
		doViewWillAppear()
	}
	#else
	public override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		doViewWillAppear()
	}
	#endif

	private func doViewWillAppear()
	{
		/* Setup application */
		let application = AMCApplication.shared
		let context     = application.context
		let console     = application.console
		let config	= application.config

		/* Define _boot object */
		let bootobj = AMCBootObject.sharedObject(context: context)
		let bootcmp = AMCBootObjectCompiler(console: console, config: config)
		guard bootcmp.compile(context: context, bootObject: bootobj, console: console) else {
			console.error(string: "/* Failed to compile boot object */\n")
			return
		}

		/* Load built in manifest file */
		guard let baseurl  = Bundle.main.resourceURL else {
			console.error(string: "/* Failed to get resource URL */\n")
			return
		}

		/* Allocate resource object based on the manifest */
		let resource = AMCResource(instanceName: "resource", baseURL: baseurl, context: context, console: console)
		if let err =  AMCManifest.load(into: resource) {
			CNLog(type: .Error, message: err.toString(), place: #file)
		}
		config.doVerbose = true
		if config.doVerbose {
			console.print(string: "/* Built in resource */\n")
			if let resource = application.resource {
				let text = resource.toText()
				text.print(console: console)
			} else {
				console.print(string: "{} // Not\n")
			}
		}

		/* Compile the application */
		let compiler = AMCApplicationCompiler(console: console, config: config)
		guard compiler.compile(application: application, resource: resource) else {
			CNLog(type: .Error, message: "Failed to compile application", place: #function)
			return
		}

		/* Load startup page */
		if let mainname = resource.mainWindowName() {
			let program = application.program
			if !super.pushView(viewName: mainname, program: program, console: console, config: config) {
				console.error(string: "Failed to load \(mainname)\n")
			}
		}
	}
}

