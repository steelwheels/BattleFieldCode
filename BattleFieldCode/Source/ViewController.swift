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
		compiler.postCompile(application: application, resource: resource)

		/* Load startup page */
		if let mainname = resource.mainWindowName() {
			if !self.hasViewController(name: mainname) {
				let newview = AMCSingleViewController(viewName: mainname, parentViewController: self, doVerbose: config.doVerbose)
				self.add(name: mainname, viewController: newview)
			}
			if !super.pushViewController(byName: mainname) {
				console.error(string: "Failed to load \(mainname)\n")
			}
		}
	}
}

