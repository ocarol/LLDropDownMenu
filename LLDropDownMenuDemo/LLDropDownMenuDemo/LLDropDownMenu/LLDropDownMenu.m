//
//  LLDropDownMenu.m
//
//  Created by ocarol on 15/12/30.
//  Copyright © 2015年 ocarol. All rights reserved.
//

#import "LLDropDownMenu.h"


#define KLLDropDownMenuCellStr  @"LLDropDownMenuCellStr"
#define KitemSize               CGSizeMakeCustom(86, 33)
#define KitemSpacing            16 * AutoSizeScaleX
#define KitemLineSpacing        16 * AutoSizeScaleX

@interface LLDropDownMenu()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UILabel *textLable;
@property (nonatomic, strong) UIImageView * imgView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *backgroudView;
@property (nonatomic, strong) UIButton *backgroudBtn;
@property (nonatomic, assign) BOOL isOpen;

@end

@implementation LLDropDownMenu

#pragma mark - 初始化
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.imgView = [[UIImageView alloc] init];
    [self addSubview:self.textLable];
    [self addSubview:self.imgView];
    [self addSubview:self.backgroudBtn];
    [self.backgroudView addSubview:self.collectionView];
    self.isOpen = false;
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.backgroudView];

}

- (instancetype)initWithTitle:(NSString *)text image:(UIImage *)image data:(NSArray *)data menuDidSelected:(void (^)(NSString *))MenuDidSelected {
    if (self = [super initWithFrame:CGRectMakeCustom(0, 0, 50, 24)]) {
        [self setupUI];
        self.textStr = text;
        self.image = image;
        self.dataArray = data;
        self.MenuDidSelected = MenuDidSelected;
    }
    return self;
}

#pragma mark - menu按钮点击事件
- (void)menuBtnClicked {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    if ((!self.isOpen)) {
        [self showMenuContext];
        
    }else{
        [self hidenMenuContext];
    }
}

- (void)netWorkErrorInfo {
    [ErrorImgView showErrorImageViewWithEnum:errorImgViewWithNetworkError ImageName:@"noorder" onView:self.collectionView];
}

- (void)showMenuContext {
    self.isOpen = true;
    self.backgroudView.hidden = NO;
    self.imgView.transform = CGAffineTransformRotate(self.imgView.transform, M_PI);
}

- (void)hidenMenuContext {
self.isOpen = false;
    self.backgroudView.hidden = YES;
    self.imgView.transform = CGAffineTransformIdentity;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return (self.dataArray.count) ? 1 : 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LLDropDownMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KLLDropDownMenuCellStr forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.textStr = self.dataArray[indexPath.item];
    // 回调
    self.MenuDidSelected(self.textStr);
    LLDropDownMenuCell *selectedCell = (LLDropDownMenuCell *)[collectionView cellForItemAtIndexPath:indexPath];
    selectedCell.textLabel.backgroundColor = ColorI(0xe7e7e7);
    [self hidenMenuContext];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    LLDropDownMenuCell *selectedCell = (LLDropDownMenuCell *)[collectionView cellForItemAtIndexPath:indexPath];
    selectedCell.textLabel.backgroundColor = ColorI(0xffffff);

}

#pragma mark - set 方法
- (void)setTextStr:(NSString *)textStr {
    _textStr = textStr;
    self.textLable.text = _textStr;
    [self adiustFrame];
}

- (void)adiustFrame {
    // 计算textLabel的宽度
    [self.textLable sizeToFit];
    self.textLable.x = 10 * AutoSizeScaleX;
    self.textLable.centerY = self.height/2.0f;
    // 计算图片的frame
    self.imgView.frame = CGRectMake(CGRectGetMaxX(self.textLable.frame) + 7 * AutoSizeScaleX, 0, 15, 8);
    self.imgView.centerY = self.height/2.0f;
    // 计算self的宽度
    self.width = CGRectGetMaxX(self.imgView.frame);
    self.backgroudBtn.frame = self.bounds;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imgView.image = _image;
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    if (self.dataArray.count) {
        CGFloat row = (self.dataArray.count % 3) ? (self.dataArray.count / 3 + 1) : (self.dataArray.count / 3);
        CGFloat collectionViewH = row * (KitemSize.height + KitemSpacing) + 22 * AutoSizeScaleY;
        collectionViewH = collectionViewH > KScreenHeight ? KScreenHeight-64 : collectionViewH;
        self.collectionView.frame = CGRectMake(0, 0, KScreenWidth, collectionViewH);
        [ErrorImgView removeErrorImageViewFromView:self.collectionView];

    }else{
        // 没有匹配项
        self.collectionView.frame = CGRectMake(0, 0, KScreenWidth, 200 * AutoSizeScaleY);
        [ErrorImgView showErrorImageViewWithEnum:errorImgViewWithdataEmpty ImageName:@"noorder" onView:self.collectionView];
    }
    [self.collectionView reloadData];
}

#pragma mark - 懒加载
- (UIView *)backgroudView {
    if (!_backgroudView) {
        _backgroudView = [[UIView alloc] init];
        _backgroudView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        _backgroudView.frame = CGRectMake(0, 64, KScreenWidth, KScreenHeight - 64);
        _backgroudView.hidden = YES;
    }
    return _backgroudView;
}

- (UIButton *)backgroudBtn {
    if (!_backgroudBtn) {
        _backgroudBtn = [[UIButton alloc] initWithFrame:self.bounds];
        [_backgroudBtn addTarget:self action:@selector(menuBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroudBtn;
}
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        //创建collectionView 并注册cell
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = KitemSize;
        flowLayout.minimumInteritemSpacing = KitemSpacing;
        flowLayout.minimumLineSpacing = KitemLineSpacing;
        flowLayout.sectionInset = UIEdgeInsetsMake(16 * AutoSizeScaleY, 15 * AutoSizeScaleX, 22 * AutoSizeScaleY, 15 * AutoSizeScaleX);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMakeCustom(0, 0, 320, 100) collectionViewLayout:flowLayout];
        [_collectionView registerClass:[LLDropDownMenuCell class] forCellWithReuseIdentifier:KLLDropDownMenuCellStr];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = KMainViewBackgroundColor;


    }
    return _collectionView;
}

- (UILabel *)textLable {
    if (!_textLable) {
        _textLable = [[UILabel alloc] init];
        _textLable.font = Font(17);
        _textLable.textColor = ColorI(0x3090ef);
    }
    return _textLable;
}

#pragma mark - dealloc
- (void)dealloc {
    [self.backgroudView removeFromSuperview];
}

@end
