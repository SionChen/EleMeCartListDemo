//
//  CartListViewController.m
//  EleMeCartListDemo
//
//  Created by 超级腕电商 on 2017/9/15.
//  Copyright © 2017年 超级腕电商. All rights reserved.
//

#import "CartListViewController.h"
#import "CartListTableViewCell.h"
#import "CartBottomView.h"
#import "UIView+Size.h"

#define screenWidth      [UIScreen mainScreen].bounds.size.width
#define screenHeight     [UIScreen mainScreen].bounds.size.height
#define navBarHeight      self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight  [UIApplication sharedApplication].statusBarFrame.size.height
#define CartAnimation_Time     0.5
@interface CartListViewController ()<UITableViewDelegate,UITableViewDataSource,CartAddViewDelegate,CAAnimationDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic,strong) CartBottomView *cartBottomView;
@end

@implementation CartListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"EleMeCartListDemo";
    [self initViews];
}
-(void)initViews{
    CGFloat viewWidth  = screenWidth;
    CGFloat viewHeight = screenHeight - statusBarHeight - navBarHeight - 60;
    self.tableView.frame = CGRectMake(0, navBarHeight+statusBarHeight, viewWidth, viewHeight);
    [self.view addSubview:self.tableView];
    self.cartBottomView.frame = CGRectMake(0, self.tableView.bottom, viewWidth, 60);
    [self.view addSubview:self.cartBottomView];
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 104.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CartListTableViewCell";
    
    CartListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CartListTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}
#pragma mark CartAddViewDelegate
-(void)cartViewAddButtonActionWithCartAddView:(CartAddView *)cartAddView
{
    CGRect rect = [cartAddView convertRect:cartAddView.addButton.frame toView:self.view];
    [self joinCartAnimationWithRect:rect];
}
#pragma mark -加入购物车动画
-(void)joinCartAnimationWithRect:(CGRect)rect
{
    CGFloat endPoint_x = [self.cartBottomView convertRect:self.cartBottomView.cartButton.frame toView:self.view].origin.x+self.cartBottomView.cartButton.width/2;
    CGFloat endPoint_y = [self.cartBottomView convertRect:self.cartBottomView.cartButton.frame toView:self.view].origin.y+self.cartBottomView.cartButton.height/2;
    
    CGFloat startX = rect.origin.x;
    CGFloat startY = rect.origin.y;
    
    UIBezierPath * path= [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(startX, startY)];
    
    //三点曲线
    [path addCurveToPoint:CGPointMake(endPoint_x, endPoint_y)
             controlPoint1:CGPointMake(startX, startY)
             controlPoint2:CGPointMake(startX - 250, startY - 100)];
    CALayer * dotLayer = [CALayer layer];
    dotLayer.backgroundColor = [UIColor purpleColor].CGColor;
    dotLayer.frame = CGRectMake(0, 0, 20, 20);
    dotLayer.cornerRadius = 10;
    [self.view.layer addSublayer:dotLayer];
    [self groupAnimationWithPath:path andDotLayer:dotLayer];
}
#pragma mark - 组合动画
-(void)groupAnimationWithPath:(UIBezierPath *)path andDotLayer:(CALayer *)dotLayer
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"alpha"];
    alphaAnimation.duration = CartAnimation_Time;
    alphaAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    alphaAnimation.toValue = [NSNumber numberWithFloat:0.1];
    alphaAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[animation,alphaAnimation];
    groups.duration = CartAnimation_Time;
    groups.removedOnCompletion = NO;
    groups.fillMode = kCAFillModeForwards;
    groups.delegate = self;
    [groups setValue:@"groupsAnimation" forKey:@"animationName"];
    [dotLayer addAnimation:groups forKey:nil];
    [self performSelector:@selector(removeFromLayer:) withObject:dotLayer afterDelay:CartAnimation_Time];
}
- (void)removeFromLayer:(CALayer *)layerAnimation{
    
    [layerAnimation removeFromSuperlayer];
}
#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
    if ([[anim valueForKey:@"animationName"]isEqualToString:@"groupsAnimation"]) {
        
        NSMutableArray *values = [NSMutableArray array];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
        
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        anim.fillMode = kCAFillModeForwards;
        anim.values = values;
        anim.duration = Animation_Time;
        [self.cartBottomView.cartButton.layer addAnimation:anim forKey:nil];
        
    }
}
#pragma mark G
-(UITableView*)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:(CGRectZero) style:(UITableViewStylePlain)];
        _tableView.backgroundColor = [UIColor yellowColor];
        //_tableView.frame = CGRectMake(0, mTabBar.bottom, viewWidth, viewHeight);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsHorizontalScrollIndicator = false;
        _tableView.showsVerticalScrollIndicator = true;
        _tableView.delaysContentTouches = false;
        _tableView.scrollsToTop = true;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.sectionHeaderHeight = 0.0;
        _tableView.sectionFooterHeight = 0.0;
    }
    return _tableView;
}
-(CartBottomView*)cartBottomView{
    if(!_cartBottomView){
        _cartBottomView = [[CartBottomView alloc] init];
    }
    return _cartBottomView;
}

@end
