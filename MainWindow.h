//
//  MainWindow.h
//  XenioUIKit
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainWindow : NSWindow <NSWindowDelegate>

@property (nonatomic) NSString *backgroundImageName;

-(void)changeBackgroundImage : (NSImage *)image;

@end
