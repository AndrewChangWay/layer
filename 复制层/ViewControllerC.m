//
//  ViewControllerC.m
//  复制层
//
//  Created by SSIT on 2017/12/12.
//  Copyright © 2017年 com.SSIT. All rights reserved.
//

#import "ViewControllerC.h"

@interface ViewControllerC ()

@end

@implementation ViewControllerC

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
    
    [self setupUI3];
    
}
- (void)setupUI {
    
    // 被复制层
    CALayer *shapeLayer = [CALayer layer];
    shapeLayer.cornerRadius = 25;
    CGFloat width = 50;
    CGFloat height = 50;
    shapeLayer.bounds = CGRectMake(0, 0, width, height);
    shapeLayer.position = CGPointMake(30,50);
    shapeLayer.backgroundColor = [UIColor redColor].CGColor;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 0.6;
    animation.fromValue = @1;
    animation.toValue = @0.1;
    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = YES;
    
    [shapeLayer addAnimation:animation forKey:nil];
    
    
    CAReplicatorLayer *relayer = [CAReplicatorLayer layer];
    [self.view.layer addSublayer:relayer];
    
    relayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    relayer.bounds = CGRectMake(0, 0, 300, 80);
    relayer.position = self.view.center;
    relayer.instanceDelay = 0.2;
    relayer.instanceAlphaOffset = 0.15;
    relayer.instanceCount = 3;
    relayer.instanceTransform = CATransform3DMakeTranslation(50, 0, 0);
    [relayer addSublayer:shapeLayer];
    
}

- (void)setupUI2 {
    
    // 被复制层
    CALayer *shapeLayer = [CALayer layer];
    shapeLayer.cornerRadius = 15;
    CGFloat width = 30;
    CGFloat height = 30;
    shapeLayer.bounds = CGRectMake(0, 0, width, height);
    shapeLayer.position = CGPointMake(30,50);
    shapeLayer.backgroundColor = [UIColor redColor].CGColor;
    
    
    CAKeyframeAnimation *keyAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    CGPoint p1 = shapeLayer.position;
    CGPoint p2 = CGPointMake(p1.x + 100, p1.y);
    CGPoint p3 = CGPointMake(p1.x + 50, p1.y+90);
    CGPoint p4 = p1;
    
    keyAni.values = @[ [NSValue valueWithCGPoint:p1],
                      [NSValue valueWithCGPoint:p2],
                      [NSValue valueWithCGPoint:p3],
                      [NSValue valueWithCGPoint:p4]];
    
    keyAni.duration = 3;
    keyAni.repeatCount = MAXFLOAT;
    [shapeLayer addAnimation:keyAni forKey:nil];
    
    CAReplicatorLayer *relayer = [CAReplicatorLayer layer];
    [self.view.layer addSublayer:relayer];
    
    relayer.backgroundColor = [UIColor cyanColor].CGColor;
    relayer.bounds = CGRectMake(0, 0, 300, 180);
    relayer.position = CGPointMake(self.view.center.x, 200);
    relayer.instanceDelay = 1;
    relayer.instanceAlphaOffset = 0.15;
    relayer.instanceCount = 3;
   
    [relayer addSublayer:shapeLayer];
    
}

- (void)setupUI3 {
    
    // 被复制层
    CALayer *shapeLayer = [CALayer layer];
    shapeLayer.cornerRadius = 10;
    CGFloat width = 20;
    CGFloat height = 20;
    shapeLayer.bounds = CGRectMake(0, 0, width, height);
    shapeLayer.position = CGPointMake(150,30);
    shapeLayer.backgroundColor = [UIColor redColor].CGColor;
    
//
//    CAKeyframeAnimation *keyAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(160, 100) radius:60 startAngle:-M_PI_2 endAngle:M_PI*2-M_PI_2 clockwise:YES];
//
//    keyAni.path = path.CGPath;
//
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
   
    animation.fromValue = @1;
    animation.toValue = @0.1;
    animation.autoreverses = YES;
    
    CABasicAnimation *alpha = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alpha.fromValue = @(1.0);
    alpha.toValue = @(0.1);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 2;
    group.repeatCount = MAXFLOAT;
    group.animations = @[alpha, animation];
    
    
    [shapeLayer addAnimation:group forKey:nil];
    
    
    
    CAReplicatorLayer *relayer = [CAReplicatorLayer layer];
    [self.view.layer addSublayer:relayer];
    
    relayer.backgroundColor = [UIColor yellowColor].CGColor;
    relayer.bounds = CGRectMake(0, 0, 300, 200);
    relayer.position = CGPointMake(self.view.center.x, 500);
    relayer.instanceDelay = 0.1;
    CGFloat angle = (2*M_PI) / (20);
    relayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1.0);
//    relayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1.0);
    relayer.instanceCount = 20;
    
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
