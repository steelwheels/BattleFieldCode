/**
 * @file	AppDelegate.swift
 * @brief	Define AppDelegate class
 * @par Copyright
 *   Copyright (C) 2018 Steel Wheels Project
 */

import AmberComponent
#if os(OSX)
import Cocoa
#else
import UIKit
#endif

#if os(OSX)

@NSApplicationMain

class AppDelegate: AMCApplicationDelegate
{
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Insert code here to initialize your application
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
}

#else

@UIApplicationMain
class AppDelegate: AMCApplicationDelegate
{
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		return super.application(application, willFinishLaunchingWithOptions: launchOptions)
	}
}

#endif
