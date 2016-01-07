//
//  ViewController.m
//  LLDropDownMenuDemo
//
//  Created by ocarol on 16/1/7.
//  Copyright © 2016年 ocarol. All rights reserved.
//

#import "ViewController.h"
#import "LLDropDownMenu.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"下拉Demo";
    __weak __typeof(self) weakSelf = self;
    UIImage *img = [UIImage imageNamed:@"arrow-left-default"];
    // 将图片旋转90度
    img = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationLeft];
    NSArray *data = @[@"天安门",@"西直门",@"宣武门",@"八达岭",@"公主坟",@"复兴门",@"水立方",@"三棵树",@"王府井",@"西三旗",@"西二旗",@"回龙观",@"天通苑",@"圆明园",@"国家图书馆",@"中山公园",@"科技园"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[LLDropDownMenu alloc] initWithTitle:@"区域" image:img data:data menuDidSelected:^(NSString *selectedItemTitle) {
        //添加模糊请求代码
        weakSelf.title = selectedItemTitle;
        
    }]];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
