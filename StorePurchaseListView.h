//
//  StorePurchaseListView.h
//  XenioUIKit
//
//  Created by Иван Меликов on 03.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@class StorePurchaseListView;
@protocol StorePurchaseListViewDelegate <NSObject>
- (void) itemClicked: (NSInteger) sender;
@end

@interface StorePurchaseListView : INSNibLoadedView <NSTableViewDelegate, NSTableViewDataSource>

@property (strong) IBOutlet NSTableView *tableView;
@property (nonatomic) NSMutableArray *dataSourceArray;

@property (nonatomic, weak) id <StorePurchaseListViewDelegate> delegate;

@end
