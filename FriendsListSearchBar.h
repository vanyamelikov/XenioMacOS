//
//  FriendsListSearchBar.h
//  XenioUIKit
//
//  Created by Иван Меликов on 02.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import <QuartzCore/QuartzCore.h>

@interface FriendsListSearchBar : INSNibLoadedView <NSTextFieldDelegate, NSWindowDelegate>

@property (strong) IBOutlet NSImageView *searchIV;
@property (strong) IBOutlet NSImageView *addFriendIV;
@property (strong) IBOutlet NSBox *underlineBox;
@property (strong) IBOutlet NSTextField *searchTF;
@property (strong) IBOutlet NSImageView *lightLayerIV;
@property (weak) IBOutlet NSTextField *searchTitle;
@property (weak) IBOutlet NSTextField *currentOnlineLabel;


@end
