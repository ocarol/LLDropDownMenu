//
//  ErrorImgView.h
//
//  Created by ocarol on 16/1/4.
//  Copyright © 2016年 ocarol. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    errorImgViewWithNetworkError = 0,
    errorImgViewWithdataEmpty,
} errorImgViewEnum;

@interface ErrorImgView : UIImageView
/**
 *  显示错误信息
 *
 *  @param title 显示的错误文字
 *  @param image 显示的错误图片
 *  @param view  错误信息的父控件
 */
+ (void)showErrorImageViewWithTitle:(NSString *)title Image:(UIImage *)image onView:(UIView *)view;

/**
 *  显示错误信息
 *
 *  @param title     显示的错误文字
 *  @param imageName 显示的错误图片名称
 *  @param view      错误信息的父控件
 */
+ (void)showErrorImageViewWithTitle:(NSString *)title ImageName:(NSString *)imageName onView:(UIView *)view;

/**
 *  显示错误信息
 *
 *  @param title           显示的错误文字
 *  @param image           显示的错误图片
 *  @param view            错误信息的父控件
 *  @param errorLabelColor 错误文字的颜色
 *  @param errorLabelColor 错误文字的字体
 */
+ (void)showErrorImageViewWithTitle:(NSString *)title Image:(UIImage *)image onView:(UIView *)view errorLabelColor:(UIColor *)errorLabelColor labelFont:(UIFont *)labelFont;

/**
 *  显示错误信息
 *
 *  @param errorImgViewEnum 显示的错误文字对应的枚举,errorImgViewWithdataEmpty表示数据为空;errorImgViewWithNetworkError表示网络链接失败
 *  @param image            显示的错误图片
 *  @param view             错误信息的父控件
 */
+ (void)showErrorImageViewWithEnum:(errorImgViewEnum)errorImgViewEnum Image:(UIImage *)image onView:(UIView *)view;

/**
 *  显示错误信息
 *
 *  @param errorImgViewEnum 显示的错误文字对应的枚举,errorImgViewWithdataEmpty表示数据为空;errorImgViewWithNetworkError表示网络链接失败
 *  @param imageName        显示的错误图片
 *  @param view             错误信息的父控件
 */
+ (void)showErrorImageViewWithEnum:(errorImgViewEnum)errorImgViewEnum ImageName:(NSString *)imageName onView:(UIView *)view;

/**
 *  将错误信息从父控件移除
 *
 *  @param view 错误信息的父控件
 */
+ (void)removeErrorImageViewFromView:(UIView *)view;

@end
