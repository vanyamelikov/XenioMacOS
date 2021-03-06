//
//  GiftButton.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 12.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "GiftButton.h"
#import "Colours.h"

@implementation GiftButton

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    alphaColor = [NSColor colorFromHexString:@"#D0A366"];
    RGBcolor   = [NSColor colorFromHexString:@"#D0C878"];
}

-(void)mouseEntered:(NSEvent *)theEvent {
    //draw rollover
    NSLog(@"Mouse entered");
}

-(void)mouseExited:(NSEvent *)theEvent {
    //draw normal
    NSLog(@"Mouse exited");
}

-(void)mouseDown:(NSEvent *)theEvent {
    [self.backgroundBox setFillColor:alphaColor];
}

-(void)mouseUp:(NSEvent *)theEvent {
    [self.backgroundBox setFillColor:RGBcolor];
}

@end
