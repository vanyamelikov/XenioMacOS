//
//  ChatMainView.h
//  XenioUIKit
//
//  Created by Иван Меликов on 25.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "ChatMessageModel.h"
#import "ChatMsgInItem.h"
#import "ChatMsgOutItem.h"
#import "ChatMsgLiveItem.h"
#import "ChatDialogsView.h"

@class ChatMainView;
@protocol ChatMainViewDelegate <NSObject>
-(void)closeChatMainView;
@end

@interface ChatMainView : INSNibLoadedView <NSTableViewDelegate, NSTableViewDataSource>
@property (weak) IBOutlet NSTextField *chatNameLabel;
@property (weak) IBOutlet NSTableView *chatTableView;
@property (weak) IBOutlet NSTextField *chatMessageTextField;
@property (weak) IBOutlet NSBox *enterMessageBox;

@property (nonatomic, weak) id<ChatMainViewDelegate> delegate;

@end
