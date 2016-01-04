//
//  LLDropDownMenu.h
//
//  Created by ocarol on 15/12/30.
//  Copyright © 2015年 ocarol. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LLDropDownMenu : UIView

@property (nonatomic, strong) NSString *textStr;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, copy) void(^MenuDidSelected)(NSString *selectedItemTitle);

- (instancetype)initWithTitle:(NSString *)text image:(UIImage *)image data:(NSArray *)data menuDidSelected:(void(^)(NSString *selectedItemTitle))MenuDidSelected;
- (void)showMenuContext;
- (void)hidenMenuContext;
- (void)netWorkErrorInfo;
@end
