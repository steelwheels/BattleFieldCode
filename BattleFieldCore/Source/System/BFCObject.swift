/**
 * @file	BFCObject.swift
 * @brief	Define BFCObject class
 * @par Copyright
 *   Copyright (C) 2018 Steel Wheels Project
 */

import KiwiEngine
import Foundation

public class BFCObject
{
	private var mContext:		KEContext
	
	public var xPosition:		Double
	public var yPosition:		Double

	public init(context ctxt: KEContext){
		mContext	= ctxt
		xPosition	= 0.0
		yPosition	= 0.0
	}

	public var context: KEContext { get { return mContext }}
}

public class BFCObjectModel: KEObject
{
	private static let	xPositionItem = "xPosition"
	private static let	yPositionItem = "yPosition"

	public override init(context ctxt: KEContext) {
		super.init(context: ctxt)
		xPosition = 0.0
		yPosition = 0.0
	}

	public var xPosition: Double {
		get      { return getDouble(name: BFCObjectModel.xPositionItem) }
		set(val) { set(name: BFCObjectModel.xPositionItem, doubleValue: val) }
	}

	public var yPosition: Double {
		get      { return getDouble(name: BFCObjectModel.yPositionItem) }
		set(val) { set(name: BFCObjectModel.yPositionItem, doubleValue: val) }
	}

	public func importProperties(object obj: BFCObject){
		xPosition = obj.xPosition
		yPosition = obj.yPosition
	}
}

