//
//  ViewControllerA.m
//  复制层
//
//  Created by SSIT on 2017/12/12.
//  Copyright © 2017年 com.SSIT. All rights reserved.
//

#import "ViewControllerA.h"

@interface ViewControllerA ()

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setupUI];
    
    
}
- (void)setupUI {
    
    // 被复制层
    CALayer *shapeLayer = [CALayer layer];
    shapeLayer.cornerRadius = 25;
    CGFloat width = 50;
    CGFloat height = 50;
    shapeLayer.bounds = CGRectMake(0, 0, width, height);
    shapeLayer.position = CGPointMake(150,150);
    shapeLayer.backgroundColor = [UIColor redColor].CGColor;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    animation.duration = 1;
    animation.fromValue = @1;
    animation.toValue = @5;
//    animation.repeatCount = MAXFLOAT;
    
    CABasicAnimation *alpha = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alpha.fromValue = @(1.0);
    alpha.toValue = @(0.0);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 10;
    group.repeatCount = MAXFLOAT;
    group.animations = @[alpha, animation];
    
    [shapeLayer addAnimation:group forKey:nil];
    
    
    CAReplicatorLayer *relayer = [CAReplicatorLayer layer];
    [self.view.layer addSublayer:relayer];
    
    relayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    relayer.bounds = CGRectMake(0, 0, 300, 300);
    relayer.position = self.view.center;
    relayer.instanceDelay = 1;
    relayer.instanceAlphaOffset = 0.1;
    relayer.instanceCount = 10;
    [relayer addSublayer:shapeLayer];
    relayer.masksToBounds = YES;
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
