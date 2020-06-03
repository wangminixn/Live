//
//  CFFlowersVC.m
//  flowers
//
//  Created by CF on 2020/3/27.
//  Copyright © 2020 CF. All rights reserved. 
//

#import "CFFlowersVC.h"
#import "CFFlowersCell.h"

@interface CFFlowersVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *FlowersView;
@end

@implementation CFFlowersVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.FlowersView];
    
   
}
- (BOOL)checkProductDate: (NSString *)tempDate {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *date = [dateFormatter dateFromString:tempDate];
        // 判断是否大于当前时间
        if ([date earlierDate:[NSDate date]] != date) {
            return true;
        } else {
            return false;
        }
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 15;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *activityItems = @[[UIImage imageNamed:[NSString stringWithFormat:@"cactus_and_flowers_%ld",(long)indexPath.row]]];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
    activityVC.excludedActivityTypes = @[
        UIActivityTypePostToFacebook,
        UIActivityTypeAirDrop,
        UIActivityTypePostToWeibo,
        UIActivityTypePostToTencentWeibo
    ];
    UIActivityViewControllerCompletionWithItemsHandler myBlock = ^(UIActivityType __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError) {};
    activityVC.completionWithItemsHandler = myBlock;
    [self presentViewController:activityVC animated:YES completion:nil];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CFFlowersCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CFFlowersCell class]) forIndexPath:indexPath];
    cell.FlowersItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"cactus_and_flowers_%ld",(long)indexPath.row]];
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(UICollectionView *)FlowersView {
    if(_FlowersView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat itemWidth = (self.view.frame.size.width - 40)/3;
        layout.itemSize =CGSizeMake(itemWidth, itemWidth);
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        
        _FlowersView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _FlowersView.showsVerticalScrollIndicator = NO;
        _FlowersView.backgroundColor = [UIColor clearColor];
        _FlowersView.delegate = self;
        _FlowersView.dataSource = self;
        [_FlowersView registerClass:[CFFlowersCell class] forCellWithReuseIdentifier:@"CFFlowersCell"];
    }
    return _FlowersView;
}


@end
