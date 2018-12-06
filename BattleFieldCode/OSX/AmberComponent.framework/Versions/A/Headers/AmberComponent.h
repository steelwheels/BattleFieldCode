//
//  AmberComponent.h
//  AmberComponent
//
//  Created by Tomoo Hamada on 2018/04/03.
//  Copyright © 2018年 Tomoo Hamada. All rights reserved.
//

#import "TargetConditionals.h"
#if TARGET_OS_IPHONE
#       import <UIKit/UIKit.h>
#else
#       import <Cocoa/Cocoa.h>
#endif

//! Project version number for AmberComponent.
FOUNDATION_EXPORT double AmberComponentVersionNumber;

//! Project version string for AmberComponent.
FOUNDATION_EXPORT const unsigned char AmberComponentVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <AmberComponent/PublicHeader.h>


