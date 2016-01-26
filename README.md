# LLDropDownMenu
下拉选项
## LLDropDownMenuDemo动态展示图：
![](LLDropDownMenuDemo.gif)

## LLDropDownMenu的用法：
# 1. 创建LLDropDownMenu：
```objc
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
```
Demo中示例代码：
```objc
 __weak __typeof(self) weakSelf = self;
UIImage *img = [UIImage imageNamed:@"arrow-left-default"];
NSArray *data = @[@"天安门",@"西直门",@"宣武门",@"八达岭",@"公主坟",@"复兴门",@"水立方",@"三棵树",@"王府井",@"西三旗",@"西二旗",@"回龙观",@"天通苑",@"圆明园",@"国家图书馆",@"中山公园",@"科技园"];

[[LLDropDownMenu alloc] initWithTitle:@"北京" image:img data:data menuDidSelected:^(NSString *selectedItemTitle) {
        //添加点击菜单是执行的代码块
        weakSelf.title = selectedItemTitle;
        
    }];
```
# 2. 显示LLDropDownMenu：
```objc
/**
 *  显示菜单
 */
- (void)showMenuContext; 
```

# 3. 隐藏LLDropDownMenu：
```objc
/**
 *  隐藏菜单
 */
- (void)hidenMenuContext; 
```

