//
//  LLDropDownMenuCell.m
//
//  Created by ocarol on 15/12/30.
//  Copyright © 2015年 ocarol. All rights reserved.
//

#import "LLDropDownMenuCell.h"



@implementation LLDropDownMenuCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.textLabel = [[UILabel alloc] initWithFrame:self.bounds];
    self.textLabel.backgroundColor = ColorI(0xffffff);
    self.textLabel.layer.borderWidth = LENGTH_4INCH_ADAPTED(1);
    self.textLabel.layer.borderColor = [ColorI(0xdddddd) CGColor];
    self.textLabel.font = Font(13);
    self.textLabel.textColor = ColorI(0x3d3d3d);
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.textLabel];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textLabel.frame = self.bounds;
}
@end
