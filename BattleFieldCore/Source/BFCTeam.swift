/**
 * @file	BFCTeam.swift
 * @brief	Define BFCTeam class
 * @par Copyright
 *   Copyright (C) 2018 Steel Wheels Project
 */

import KiwiEngine
import JavaScriptCore
import Foundation

public class BFCTeam
{
	public var context:	KEContext

	public init(){
		guard let vm = JSVirtualMachine() else {
			fatalError("Failed to allocate JavaScript VM")
		}
		context = KEContext(virtualMachine: vm)
	}
}

