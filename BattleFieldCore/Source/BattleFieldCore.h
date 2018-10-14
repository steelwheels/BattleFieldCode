//
//  BattleFieldCore.h
//  BattleFieldCore
//
//  Created by Tomoo Hamada on 2018/10/14.
//  Copyright © 2018 Steel Wheels Project. All rights reserved.
//

#import "TargetConditionals.h"
#if TARGET_OS_IPHONE
#	import <UIKit/UIKit.h>
	//! Project version number for BattleFieldCore.
	FOUNDATION_EXPORT double BattleFieldCoreVersionNumber;
	//! Project version string for BattleFieldCore.
	FOUNDATION_EXPORT const unsigned char BattleFieldCoreVersionString[];
#else
#	import <Cocoa/Cocoa.h>
	//! Project version number for BattleFieldCore.
	FOUNDATION_EXPORT double BattleFieldCoreVersionNumber;
	//! Project version string for BattleFieldCore.
	FOUNDATION_EXPORT const unsigned char BattleFieldCoreVersionString[];
#endif



