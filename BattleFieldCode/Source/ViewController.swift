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
		guard let baseurl = Bundle.main.resourceURL else {
			NSLog("No resource URL at \(#function)")
			return
		}
		let resource = AMCResource(baseURL: baseurl, context: context)
		if let err = AMCManifest.load(into: resource) {
			NSLog("Failed to read manifest " + err.toString() + " at \(#function)")
		}
		application.resource = resource
		
		/* Load startup page */
		let program     = application.program
		let config      = application.config
		let console     = application.console
		config.doVerbose = true				// DEBUG

		let subview = AMCSingleViewController(viewName: "startup", parentViewController: self, program: program, console: console, doVerbose: config.doVerbose)
		let idx = super.add(name: "startup", viewController: subview)
		let _ = self.select(byIndex: idx)
	}
}

