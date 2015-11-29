//
//  ViewController.m
//  QuickLookPreviewsImageDemo
//
//  Created by jake on 11/29/15.
//  Copyright © 2015 jake. All rights reserved.
//

#import "ViewController.h"
#import <Quartz/Quartz.h>

@interface WCQLPreviewItem : NSObject  <QLPreviewItem>
@property(retain) NSURL* itemUrl;
- (NSString *)previewItemTitle;
- (NSURL *)previewItemURL;
@end


@implementation WCQLPreviewItem

- (NSString *)previewItemTitle {
    return self.itemUrl.absoluteString;
}
- (NSURL *)previewItemURL {
    return self.itemUrl;
}

@end

@implementation ViewController {
    QLPreviewView *qlView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    qlView = [[QLPreviewView alloc] initWithFrame:self.view.bounds style:QLPreviewViewStyleNormal];
    qlView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable | NSViewMinXMargin | NSViewMinYMargin;
    
    WCQLPreviewItem* previewItem = [WCQLPreviewItem new];
    previewItem.itemUrl = [[NSBundle mainBundle] URLForImageResource:@"IMG_3925"];
    qlView.previewItem = previewItem;
    
    [self.view addSubview:qlView];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

@end