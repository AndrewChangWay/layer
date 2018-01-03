//
//  ViewControllerB.m
//  复制层
//
//  Created by SSIT on 2017/12/12.
//  Copyright © 2017年 com.SSIT. All rights reserved.
//

#import "ViewControllerB.h"

@interface ViewControllerB ()

@end

@implementation ViewControllerB

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
    [self setupUI2];
}
- (void)setupUI {
    
    // 被复制层
    CALayer *shapeLayer = [CALayer layer];
    shapeLayer.cornerRadius = 5;
    CGFloat width = 25;
    CGFloat height = 200;
//    shapeLayer.bounds = CGRectMake(0, 0, width, height);
//    shapeLayer.position = CGPointMake(width * 0.5,240);
    shapeLayer.frame = CGRectMake(0, 130, width, height);
    shapeLayer.anchorPoint = CGPointMake(0.5, 1);

    shapeLayer.backgroundColor = [UIColor magentaColor].CGColor;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.duration = 1;
    animation.fromValue = @1;
    animation.toValue = @0;
    animation.autoreverses = YES;
    animation.repeatCount = MAXFLOAT;

    [shapeLayer addAnimation:animation forKey:nil];
    
    
    CAReplicatorLayer *relayer = [CAReplicatorLayer layer];
    [self.view.layer addSublayer:relayer];
    
    relayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    relayer.bounds = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 250);
    relayer.position = CGPointMake(self.view.center.x, 200) ;
    relayer.instanceDelay = 0.3;
    relayer.instanceRedOffset = 0.1;
    relayer.instanceBlueOffset = -0.1;
    relayer.instanceGreenOffset = -0.05;
    relayer.instanceCount = 10;
    relayer.instanceTransform = CATransform3DMakeTranslation(50, 0, 0);
    [relayer addSublayer:shapeLayer];
}

- (void)setupUI2 {
    
    // 被复制层
    CALayer *shapeLayer = [CALayer layer];
    shapeLayer.cornerRadius = 5;
    CGFloat width = 25;
    CGFloat height = 200;
    shapeLayer.frame = CGRectMake(0, 130, width, height);
    shapeLayer.anchorPoint = CGPointMake(0.5, 1);
    
    shapeLayer.backgroundColor = [UIColor magentaColor].CGColor;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.duration = 1;
    animation.fromValue = @1;
    animation.toValue = @0;
    animation.autoreverses = YES;
    animation.repeatCount = MAXFLOAT;
    
    [shapeLayer addAnimation:animation forKey:nil];
    
    
    CAReplicatorLayer *relayer = [CAReplicatorLayer layer];
    [self.view.layer addSublayer:relayer];
    
    relayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    relayer.bounds = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 250);
    relayer.position = CGPointMake(self.view.center.x, 500) ;
    relayer.instanceDelay = 0.3;
    relayer.instanceRedOffset = -0.1;
    relayer.instanceBlueOffset = 0.05;
    relayer.instanceGreenOffset = -0.05;
    relayer.instanceAlphaOffset = 0.1;
    relayer.instanceCount = 10;
    relayer.instanceTransform = CATransform3DMakeTranslation(50, 0, 0);
    [relayer addSublayer:shapeLayer];
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
