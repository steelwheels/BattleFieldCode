/**
 * @file	BFCField.swift
 * @brief	Define BFCField class
 * @par Copyright
 *   Copyright (C) 2018 Steel Wheels Project
 */

import Foundation

public class BFCField
{
	private var mWidth:	Double
	private var mDepth:	Double
	private var mField:	Array<Array<BFCObject?>>

	public init(width w: Double, depth d: Double, xNum x: Int, yNum y: Int){
		mWidth	= w
		mDepth	= d

		mField = [[]]
		/* Allocate 2 dimension array */
		for _ in 0..<y {
			var arr: Array<BFCObject?> = []
			for _ in 0..<x { arr.append(nil) }
			mField.append(arr)
		}
	}

	public var width: Double  { get { return mWidth }}
	public var depth: Double  { get { return mDepth }}
}

