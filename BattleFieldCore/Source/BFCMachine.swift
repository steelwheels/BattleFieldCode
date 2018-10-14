/**
 * @file	BFCMachine.swift
 * @brief	Define BFCMachine class
 * @par Copyright
 *   Copyright (C) 2018 Steel Wheels Project
 */

import KiwiControls
import Foundation

public class BFCMachine: BFCObject
{
	public enum Kind {
		case Tank
	}

	private var mKind:	BFCMachine.Kind

	public init(kind knd: BFCMachine.Kind) {
		mKind	= knd
	}
}

