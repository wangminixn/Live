//
//  CFFlowersCell.h
//  flowers
//
//  Created by CF on 2020/3/27.
//  Copyright © 2020 CF. All rights reserved. 
//

#import "CFFlowersCell.h"

@implementation CFFlowersCell


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self)
    {
        CGFloat itemW = self.contentView.frame.size.width - 1;
        self.FlowersItem = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, itemW, itemW)];
        self.FlowersItem.layer.masksToBounds = YES;
        [self.contentView addSubview:self.FlowersItem];
    }
    return self;
}
@end