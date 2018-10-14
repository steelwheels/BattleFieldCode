/**
 * @file	BFCField.swift
 * @brief	Define BFCField class
 * @par Copyright
 *   Copyright (C) 2018 Steel Wheels Project
 */

import Foundation

public class BFCField
{
	private var mField:	Array<Array<BFCObject?>>

	public init(width w: Int, height h: Int){
		mField = [[]]
		/* Allocate 2 dimension array */
		for _ in 0..<h {
			var arr: Array<BFCObject?> = []
			for _ in 0..<w { arr.append(nil) }
			mField.append(arr)
		}
	}
}

