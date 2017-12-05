//
//  ViewController.m
//  GradientColorDemo
//
//  Created by cafei on 2017/12/5.
//  Copyright © 2017年 cafei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self updateView1Color];
     [self updateView2Color];
    [self updateNavigationBarBGColor];
    self.title = @"Cafei";
}

//设置view1渐变色,横向渐变
- (void)updateView1Color
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.locations = @[@0.3, @0.7, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = self.view1.bounds;
    [self.view1.layer addSublayer:gradientLayer];
}

//设置view2渐变色
- (void)updateView2Color
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.locations = @[@0.3, @0.5, @1.0];
    gradientLayer.startPoint = CGPointMake(1.0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    gradientLayer.frame = self.view2.bounds;
    [self.view2.layer addSublayer:gradientLayer];
}

//设置导航条的背景为渐变色
- (void)updateNavigationBarBGColor
{
    CALayer * bgLayer = [self gradientBGLayerForBounds:CGRectMake(0, 0, self.navigationController.navigationBar.frame.size.width, self.navigationController.navigationBar.frame.size.height)];
    UIGraphicsBeginImageContext(bgLayer.bounds.size);
    [bgLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * bgAsImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (bgAsImage != nil)
    {
        [self.navigationController.navigationBar setBackgroundImage:bgAsImage forBarMetrics:UIBarMetricsDefault];
    }
    else
    {
        NSLog(@"Failded to create gradient bg image, user will see standard tint color gradient.");
    }
}

- (CALayer *)gradientBGLayerForBounds:(CGRect)bounds
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor];
    gradientLayer.locations = @[@0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = bounds;
    return gradientLayer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
