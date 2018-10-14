/**
 * @file	BFCNaturalObject.swift
 * @brief	Define BFCNaturalObject class
 * @par Copyright
 *   Copyright (C) 2018 Steel Wheels Project
 */

import Foundation

public class BFCNaturalObject: BFCObject
{
	public enum Kind {
		case Rock
	}

	private var mKind:	BFCNaturalObject.Kind

	public init(kind knd: BFCNaturalObject.Kind) {
		mKind	= knd
	}
}

