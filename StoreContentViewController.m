//
//  StoreContentViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "StoreContentViewController.h"
#import "StoreGamesView.h"
#import "StoreGamesGridView.h"
#import "StoreMainGridView.h"
#import "ImageUtils.h"
#import "Colours.h"
#import "MainWindow.h"

@interface StoreContentViewController ()
@property (nonatomic) StoreMainGridView *storeMainGridView;
@property (nonatomic) StoreGamesView *storeGamesList;
@property (nonatomic) StoreGamesGridView *storeGamesGrid;
@property (nonatomic) BOOL isList;
@end

@implementation StoreContentViewController

#define kShowListGridButtons 108.0f
#define kHideListGridButtons 26.0f

//1134,
//594)

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isList = YES;
    NSSplitViewController *view = (NSSplitViewController *)self.parentViewController;
    StoreSideMenu *storeSideMenu = view.splitViewItems[0].viewController.view.subviews[0];
    storeSideMenu.delegate = self;
    
    [self hideListGridButtons:YES];
    
    self.storeGamesList = [[StoreGamesView alloc] initWithFrame:self.gamesTabController.frame];
    self.storeGamesGrid = [[StoreGamesGridView alloc] initWithFrame:self.gamesTabController.frame];
    self.storeMainGridView = [[StoreMainGridView alloc] initWithFrame:CGRectMake(self.gamesTabController.frame.origin.x,
                                                                                 self.gamesTabController.frame.origin.x,
                                                                                 1134,
                                                                                 594)];
    
    [self.storeMainGridView setWantsLayer:YES];
    [self.gamesTabController.layer setMasksToBounds:YES];
    [self.storeMainGridView.layer setContentsGravity:kCAGravityResizeAspect];
    
    [self.storeMainGridView setWantsBestResolutionOpenGLSurface:YES];
    [self.storeMainGridView setAutoresizesSubviews:YES];
    
    NSTabViewItem *item;
    item = [[self gamesTabController] tabViewItemAtIndex:0];
    [item setView:self.storeGamesList];
    
    item = [[self gamesTabController] tabViewItemAtIndex:1];
    [item setView:self.storeGamesGrid];
    
    item = [[self gamesTabController] tabViewItemAtIndex:2];
    [item setView:self.storeMainGridView];
    
    [self.gamesTabController selectTabViewItem:[self.gamesTabController.tabViewItems objectAtIndex:2]];
    
    self.gamesTabController.delegate = self;
    
    MainWindow *mainWindow = (MainWindow *)[[NSApplication sharedApplication] mainWindow];
    mainWindow.delegate = self;
}

- (IBAction)ChangeToListClick:(NSClickGestureRecognizer *)sender {
    if(![self.gamesTabController.selectedTabViewItem isEqual:[self.gamesTabController.tabViewItems objectAtIndex:0]]) {
        [self.gamesTabController selectTabViewItem:[self.gamesTabController.tabViewItems objectAtIndex:0]];
        self.isList = YES;
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"changeBackgroundNotification"
         object:@"background_store_2"];
    }
}

- (IBAction)ChangeToGridClick:(NSClickGestureRecognizer *)sender {
    if(![self.gamesTabController.selectedTabViewItem isEqual:[self.gamesTabController.tabViewItems objectAtIndex:1]]) {
        [self.gamesTabController selectTabViewItem:[self.gamesTabController.tabViewItems objectAtIndex:1]];
        self.isList = NO;
        
    }
}

-(void)itemClicked:(NSInteger)sender :(NSString *)title {
    if(sender == 2 || sender == 3 || sender == 4) {
        [self.gamesTabController selectTabViewItem:[self.gamesTabController.tabViewItems objectAtIndex:2]];
        [self hideListGridButtons:YES];
        self.gamesTabController.alphaValue = 0;
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:1.5f];
        self.gamesTabController.animator.alphaValue = 1;
        [NSAnimationContext endGrouping];
        self.gamesTabController.alphaValue = 1;
    } else {
        [self hideListGridButtons:NO];
        if([title isEqualToString:@"Is free"]) {
            [self.storeGamesList updateTableViewData:YES];
            [self.storeGamesGrid updateCollectionView:NO];
        }
        else {
            [self.storeGamesList updateTableViewData:NO];
            [self.storeGamesGrid updateCollectionView:YES];
        }
        if(self.isList) {
            [self.gamesTabController selectTabViewItem:[self.gamesTabController.tabViewItems objectAtIndex:0]];
        }else {
            [self.gamesTabController selectTabViewItem:[self.gamesTabController.tabViewItems objectAtIndex:1]];
        }
    }
    self.storeCategoriesTitle.stringValue = title;
}

-(void)hideListGridButtons:(BOOL)hidden {
    [self.view setWantsLayer:YES];
    self.listImageView.hidden = hidden;
    self.gridImageView.hidden = hidden;
    if(hidden)
        self.buyXenioButtonConstraint.constant = kHideListGridButtons;
    else
        self.buyXenioButtonConstraint.constant = kShowListGridButtons;
    [self.view updateConstraints];
}

-(void)windowWillStartLiveResize:(NSNotification *)notification {
    if(self.gamesTabController.inLiveResize) {
        NSLog(@"Resize: %@", notification.object);
        [self.storeMainGridView.layer setMasksToBounds:YES];
        [self.storeMainGridView setNeedsDisplay:YES];
        [self.view setNeedsUpdateConstraints:YES];
        [self.view setNeedsDisplay:YES];
    }
}

-(void)tabView:(NSTabView *)tabView willSelectTabViewItem:(NSTabViewItem *)tabViewItem {
    if([tabViewItem isEqual:[self.gamesTabController.tabViewItems objectAtIndex:2]]) {
        self.gamesTabViewBottomConstraint.constant = 20;
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"changeBackgroundNotification"
         object:@"background_store_1"];
    } else if([tabViewItem isEqual:[self.gamesTabController.tabViewItems objectAtIndex:0]]) {
        self.gamesTabViewBottomConstraint.constant = 0;
        self.listImageView.image = [ImageUtils imageTintedWithColor:[NSColor whiteColor] : self.listImageView.image];
        self.gridImageView.image = [ImageUtils imageTintedWithColor:[NSColor colorFromHexString:@"#69a2a9c1"] : self.gridImageView.image];
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"changeBackgroundNotification"
         object:@"background_store_3"];
    } else {
        self.gamesTabViewBottomConstraint.constant = 0;
        self.listImageView.image = [ImageUtils imageTintedWithColor:[NSColor colorFromHexString:@"#69a2a9c1"] : self.listImageView.image];
        self.gridImageView.image = [ImageUtils imageTintedWithColor:[NSColor whiteColor] : self.gridImageView.image];
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"changeBackgroundNotification"
         object:@"background_store_2"];
    }
    
    self.gamesTabController.alphaValue = 0;
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:1.5f];
    self.gamesTabController.animator.alphaValue = 1;
    [NSAnimationContext endGrouping];
    self.gamesTabController.alphaValue = 1;
    
    [self.gamesTabController setNeedsUpdateConstraints:YES];
}

@end
