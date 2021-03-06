//
//  CustomTabbar.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 14.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSView+INSNibLoading.h"
#import "TabItemView.h"

@class CustomTabbar;
@protocol CustomTabbarDelegate <NSObject>
- (void) tabClicked: (NSInteger) sender;
- (void) downloadsButtonClick;
- (void) openChatEvent;
@end

@interface CustomTabbar : INSNibLoadedView <TabItemViewDelegate, NSPopoverDelegate>

@property (strong) IBOutlet NSBox *viewToMove;
@property (strong) IBOutlet TabItemView *tabStore;
@property (strong) IBOutlet TabItemView *tabLibrary;
@property (strong) IBOutlet TabItemView *tabWallet;
@property (strong) IBOutlet TabItemView *tabFriends;
@property (strong) IBOutlet TabItemView *tabSettings;
@property (strong) IBOutlet NSImageView *lightLayerIV;

@property (nonatomic) NSInteger selectedTab;

@property (nonatomic, weak) id <CustomTabbarDelegate> delegate;

@end
