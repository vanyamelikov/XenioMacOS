//
//  LibraryGameSearchBar.h
//  XenioUIKit
//
//  Created by Иван Меликов on 01.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import <QuartzCore/QuartzCore.h>

@interface LibraryGameSearchBar : INSNibLoadedView <NSTextFieldDelegate, NSWindowDelegate>

@property (strong) IBOutlet NSImageView *searchIV;
@property (strong) IBOutlet NSBox *underlineBox;
@property (strong) IBOutlet NSTextField *searchTF;
@property (strong) IBOutlet NSImageView *lightLayerIV;
@property (weak) IBOutlet NSTextField *searchTitle;


@end
