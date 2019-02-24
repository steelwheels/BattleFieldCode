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
	private var mViewDidLoaded = false

	#if os(OSX)
	public override func viewDidAppear() {
		super.viewDidAppear()
		doViewDidAppear()
	}
	#else
	public override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		doViewDidAppear()
	}
	#endif

	private func doViewDidAppear() {
		if !mViewDidLoaded {
			/* Setup application */
			let application = AMCApplication.shared
			let console     = application.console
			let config	= application.config
			config.doVerbose = true

			/* Get URL for built-in package */
			guard let baseurl  = Bundle.main.resourceURL else {
				console.error(string: "/* Failed to get resource URL */\n")
				return
			}

			/* Setup log console */
			let loglevel: CNLogType = config.doVerbose ? .Flow : .Warning
			CNLogSetup(console: console, logLevel: loglevel)

			/* Load the application and main window */
			let _ = AMCFileLoader.loadApplication(parentViewController: self, URL: baseurl)
		}
	}
}

