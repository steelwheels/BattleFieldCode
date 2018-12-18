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
		/* Load startup page */
		if let file = CNFilePath.URLForResourceFile(fileName: "startup", fileExtension: "amb", subdirectory: "Script") {
			let application = AMCApplication.shared
			let program     = application.program
			let config      = application.config
			config.doVerbose = true				// DEBUG
			let console     = application.console
			let subview = AMCSingleViewController(scriptURL: file, parentViewController: self, program: program, console: console, doVerbose: config.doVerbose)
			let idx = super.add(name: "startup", viewController: subview)
			let _ = self.select(byIndex: idx)
		} else {
			fatalError("[Error] No startup.amb file")
		}
	}
}

