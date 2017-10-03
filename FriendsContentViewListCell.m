//
//  FriendsContentViewListCell.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 22.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "FriendsContentViewListCell.h"

@implementation FriendsContentViewListCell

-(void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self setWantsLayer:YES];
    [self.playerImage.layer setCornerRadius:10.0f];
    [self.playerImage.layer setMasksToBounds:YES];
}

@end
