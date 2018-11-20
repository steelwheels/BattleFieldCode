/**
 * @file	BFCMachine.swift
 * @brief	Define BFCMachine class
 * @par Copyright
 *   Copyright (C) 2018 Steel Wheels Project
 */

import KiwiControls
import KiwiEngine
import JavaScriptCore
import Foundation

public class BFCMachine: BFCObject
{
	public enum Kind {
		case Tank
	}

	private var mKind:	BFCMachine.Kind
	private var mProcess:	KEProcess
	private var mObject:	BFCMachineObject

	public var angle:	Double

	public init(kind knd: BFCMachine.Kind, config conf: KEConfig) {
		let context	= KEContext(virtualMachine: JSVirtualMachine())
		mKind 		= knd
		mProcess	= KEProcess(context: context, config: conf)
		mObject		= BFCMachineObject(context: context)
		angle 		= 0.0
		super.init(context: context)
	}

	public var object:  BFCMachineObject	{ get { return mObject	}}
	public var process: KEProcess		{ get { return mProcess }}
}

public class BFCMachineObject: BFCObjectModel
{
	private static let	angleItem = "angle"

	public override init(context ctxt: KEContext) {
		super.init(context: ctxt)
	}

	public var angle: Double {
		get      { return getDouble(name: BFCMachineObject.angleItem) }
		set(val) { set(name: BFCMachineObject.angleItem, doubleValue: val) }
	}

	public func importProperties(machine obj: BFCMachine){
		super.importProperties(object: obj)
		angle = obj.angle
	}
}


