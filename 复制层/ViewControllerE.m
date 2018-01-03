//
//  ViewControllerE.m
//  复制层
//
//  Created by SSIT on 2017/12/24.
//  Copyright © 2017年 com.SSIT. All rights reserved.
//

#import "ViewControllerE.h"

@interface ViewControllerE ()
@property (weak, nonatomic) IBOutlet UILabel *lab;

@end

@implementation ViewControllerE

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
    
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = _lab.frame;
    
    UIColor *c1 = [UIColor yellowColor];
    UIColor *c2 = [UIColor magentaColor];
    UIColor *c3 = [UIColor greenColor];
    
    layer.colors = @[(__bridge id)c1.CGColor, (__bridge id)c2.CGColor, (__bridge id)c3.CGColor ];
    layer.locations = @[@0, @0.7, @1];
    
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 0);
    
    [self.view.layer addSublayer:layer];
    
    
    layer.mask =  _lab.layer;
    _lab.frame = layer.bounds;
    
    
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
