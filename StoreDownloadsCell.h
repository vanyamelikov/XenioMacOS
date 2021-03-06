//
//  StoreDownloadsCell.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "RoundButton.h"
#import "DownloadsExpectationView.h"

@interface StoreDownloadsCell : INSNibLoadedView

@property (strong) IBOutlet NSBox *backgroundBox;
@property (strong) IBOutlet NSImageView *gameImage;
@property (strong) IBOutlet NSTextField *gameNameLabel;
@property (strong) IBOutlet NSView *progressView;
@property (strong) IBOutlet NSTextField *downloadLabel;
@property (strong) IBOutlet RoundButton *button;
@property (weak) IBOutlet NSBox *progressBarView;
@property (weak) IBOutlet DownloadsExpectationView *expectationView;
@property (weak) IBOutlet NSBox *progressBox;


@end
