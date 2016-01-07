//
//  Definition.h
//  LLDropDownMenuDemo
//
//  Created by ocarol on 16/1/7.
//  Copyright © 2016年 ocarol. All rights reserved.
//

#ifndef Definition_h
#define Definition_h
#define KMainViewBackgroundColor ColorI(0xf6f6f6)
#define IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define KScreenWidth [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height
#define AutoSizeScaleX (KScreenHeight > 480 ? KScreenWidth/320 : 1.0)
#define AutoSizeScaleY (KScreenHeight > 480 ? KScreenHeight/568 : 1.0)
#define CGRectMakeCustom(x, y, width, height) CGRectMake(x * AutoSizeScaleX, y * AutoSizeScaleY, width * AutoSizeScaleX, height * AutoSizeScaleY)
#define CGSizeMakeCustom(width,height)  CGSizeMake(width * AutoSizeScaleX,height * AutoSizeScaleY)
#define Font(s) (IOS9 ? [UIFont systemFontOfSize:s] : [UIFont fontWithName:@"STHeitiSC-Light" size:s]) // San Francisco
#define ColorI(c) [UIColor colorWithRed:((c>>16)&0xff)/255.0 green:((c>>8)&0xff)/255.0 blue:(c&0xff)/255.0 alpha:1.0] // ColorI(0xbfbfbf)
// 4inch的间距
#define LENGTH_4INCH_ADAPTED(l) l
#endif /* Definition_h */
