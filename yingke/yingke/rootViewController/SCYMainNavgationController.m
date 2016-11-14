//
//  SCYMainNavgationController.m
//  yingke
//
//  Created by stone on 16/11/14.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "SCYMainNavgationController.h"

@interface SCYMainNavgationController ()<UIGestureRecognizerDelegate>

@end

@implementation SCYMainNavgationController
//设置navigation背景
+ (void)initialize {
    
    if (self == [SCYMainNavgationController class]) {
        UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
        [bar setBackgroundImage:[UIImage imageNamed:@"global_background"] forBarMetrics:UIBarMetricsDefault];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //实现全屏滑动返回
    
    id target = self.interactivePopGestureRecognizer.delegate;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
#pragma clang diagnostic pop
    [self.view addGestureRecognizer:pan];
    
    // 取消边缘滑动手势
    self.interactivePopGestureRecognizer.enabled = NO;
    
    pan.delegate = self;
}

#pragma mark ---- <UIGestureRecognizerDelegate>


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 判断下当前是不是在根控制器
    return self.childViewControllers.count > 1;
}

#pragma mark ---- <非根控制器隐藏底部tabbar>
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
