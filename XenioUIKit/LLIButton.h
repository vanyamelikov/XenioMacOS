//
//  LLIButton.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 12.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSView+INSNibLoading.h"

@interface LLIButton : INSNibLoadedView{
    NSColor *RGBcolor;
    NSColor *alphaColor;
}

@property (strong) IBOutlet NSBox *backgroundBox;
@property (strong) IBOutlet NSBox *hiddenBox;

@property (weak) IBOutlet NSTextField *buttonTitle;

@property (nonatomic) IBInspectable NSString *buttonTitleText;

@end
