//
//  ErrorImgView.m
//
//  Created by ocarol on 16/1/4.
//  Copyright © 2016年 ocarol. All rights reserved.
//

#import "ErrorImgView.h"
#import "UIView+Frame.h"

#define KScreenHeight   [UIScreen mainScreen].bounds.size.height
#define KScreenWidth    [UIScreen mainScreen].bounds.size.width
#define AutoSizeScaleX  (KScreenHeight > 480 ? KScreenWidth/320 : 1.0)
#define AutoSizeScaleY  (KScreenHeight > 480 ? KScreenHeight/568 : 1.0)
#define CGRectMakeCustom(x, y, width, height) CGRectMake(x * AutoSizeScaleX, y * AutoSizeScaleY, width * AutoSizeScaleX, height * AutoSizeScaleY)

#define ColorI(c) [UIColor colorWithRed:((c>>16)&0xff)/255.0 green:((c>>8)&0xff)/255.0 blue:(c&0xff)/255.0 alpha:1.0]

@interface ErrorImgView ()
@property (nonatomic, strong) UILabel *errorLabel;
@end

@implementation ErrorImgView

+ (void)showErrorImageViewWithTitle:(NSString *)title ImageName:(NSString *)imageName onView:(UIView *)view {
    [self showErrorImageViewWithTitle:title Image:[UIImage imageNamed:imageName] onView:view];
}

+ (void)showErrorImageViewWithTitle:(NSString *)title Image:(UIImage *)image onView:(UIView *)view {
    [ErrorImgView removeErrorImageViewFromView:view];
    ErrorImgView *erroViewImageview = [[ErrorImgView alloc] initWithImage:image];
    erroViewImageview.errorLabel.text = title;
    [erroViewImageview addSubviewTo:view];

}

+ (void)showErrorImageViewWithEnum:(errorImgViewEnum)errorImgViewEnum ImageName:(NSString *)imageName onView:(UIView *)view {
    [self showErrorImageViewWithEnum:errorImgViewEnum Image:[UIImage imageNamed:imageName] onView:view];
}

+ (void)showErrorImageViewWithEnum:(errorImgViewEnum)errorImgViewEnum Image:(UIImage *)image onView:(UIView *)view {
    [ErrorImgView removeErrorImageViewFromView:view];
    ErrorImgView *erroViewImageview = [[ErrorImgView alloc] initWithImage:image];
    [erroViewImageview showErrorImageViewWithEnum:errorImgViewEnum onView:view];
}

+ (void)removeErrorImageViewFromView:(UIView *)view {

    for (id subViews in view.subviews) {
        if ([subViews isKindOfClass:[ErrorImgView class]]) {
            [subViews removeFromSuperview];
        }
    }

}

- (void)showErrorImageViewWithEnum:(errorImgViewEnum)errorImgViewEnum onView:(UIView *)view {
    [self addSubviewTo:view];

    switch (errorImgViewEnum) {
        case errorImgViewWithdataEmpty:
            self.errorLabel.text = @"没有搜索到相关信息～";
            break;
        case errorImgViewWithNetworkError:
            self.errorLabel.text = @"网络繁忙请稍后再试～";
            break;
        default:
            break;
    }
}


- (void)addSubviewTo:(UIView *)view {

    [view addSubview:self];
    
    self.frame = CGRectMakeCustom(0, 0, 100, 100);
    self.centerX = view.width / 2.0f;
    self.centerY = view.height / 2.0f- 10 *AutoSizeScaleY;
    self.errorLabel.centerX = self.width/2.0f;
    self.errorLabel.y = self.height + 10 *AutoSizeScaleY;

}

-(UILabel *)errorLabel {

    if (!_errorLabel) {
        UILabel *errorLabel = [[UILabel alloc] initWithFrame:CGRectMakeCustom(0, 110, 320, 15)];
        _errorLabel = errorLabel;
        errorLabel.textColor = ColorI(0xa8a8a8);
        errorLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:errorLabel];
    }
    return _errorLabel;
}
@end
