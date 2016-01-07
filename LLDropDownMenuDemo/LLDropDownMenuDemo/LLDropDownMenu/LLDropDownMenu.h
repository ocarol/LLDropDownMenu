//
//  LLDropDownMenu.h
//
//  Created by ocarol on 15/12/30.
//  Copyright © 2015年 ocarol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Definition.h"
#import "LLDropDownMenuCell.h"
#import "ErrorImgView.h"
#import "UIView+Frame.h"

@interface LLDropDownMenu : UIView

@property (nonatomic, strong) NSString *textStr;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, copy) void(^MenuDidSelected)(NSString *selectedItemTitle);

/**
 *  初始化下拉控件
 *
 *  @param text            下拉控件显示的标题
 *  @param image           菜单中出险错误时的背景提示图
 *  @param data            下拉控件的展示数据
 *  @param MenuDidSelected 点击菜单中某项执行的block
 *
 *  @return 下拉菜单对象
 */
- (instancetype)initWithTitle:(NSString *)text image:(UIImage *)image data:(NSArray *)data menuDidSelected:(void(^)(NSString *selectedItemTitle))MenuDidSelected;
- (void)showMenuContext;
- (void)hidenMenuContext;
- (void)netWorkErrorInfo;
@end
