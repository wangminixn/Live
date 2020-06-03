//
//  MessagesViewController.m
//  iMessageSuffixStr
//
//  Created by mac on 2020/3/27.
//  Copyright © 2020 CF. All rights reserved.
//

#import "MessagesViewController.h"

@interface MessagesViewController ()

@end

@interface MessagesViewController ()<MSStickerBrowserViewDataSource>
@property (nonatomic,strong) NSMutableArray *FlowersArr;
@property (nonatomic,strong) MSStickerBrowserViewController *FlowersBrowserVc;
@end

@implementation MessagesViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadStickers];
    [self createStickerBrowserViewController];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)loadStickers{
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < 15; i++) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"cactus_and_flowers_%d@2x",i] withExtension:@"png"];
        MSSticker *sticker = [[MSSticker alloc]initWithContentsOfFileURL:url localizedDescription:@"" error:nil];
        [mArray addObject:sticker];
    }
    self.FlowersArr = mArray;
}

- (void)createStickerBrowserViewController{
    self.FlowersBrowserVc = [[MSStickerBrowserViewController alloc]initWithStickerSize:MSStickerSizeRegular];
    [self addChildViewController:self.FlowersBrowserVc];
    [self.view addSubview:self.FlowersBrowserVc.view];
    self.FlowersBrowserVc.stickerBrowserView.backgroundColor = [UIColor whiteColor];
    self.FlowersBrowserVc.stickerBrowserView.dataSource = self;
    self.FlowersBrowserVc.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view.topAnchor constraintEqualToAnchor:self.FlowersBrowserVc.view.topAnchor].active = YES;
    [self.view.bottomAnchor constraintEqualToAnchor:self.FlowersBrowserVc.view.bottomAnchor].active = YES;
    [self.view.leftAnchor constraintEqualToAnchor:self.FlowersBrowserVc.view.leftAnchor].active = YES;
    [self.view.rightAnchor constraintEqualToAnchor:self.FlowersBrowserVc.view.rightAnchor].active = YES;
}

-(NSInteger)numberOfStickersInStickerBrowserView:(MSStickerBrowserView *)stickerBrowserView{
    return self.FlowersArr.count;
}

- (MSSticker *)stickerBrowserView:(MSStickerBrowserView *)stickerBrowserView stickerAtIndex:(NSInteger)index{
    return self.FlowersArr[index];
}

@end
