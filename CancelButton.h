//
//  CancelButton.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 13.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSView+INSNibLoading.h"

@interface CancelButton : INSNibLoadedView{
    NSColor *RGBcolor;
    NSColor *alphaColor;
}

@property (strong) IBOutlet NSBox *backgroundBox;

@end
