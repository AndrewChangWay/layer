//
//  ViewControllerD.m
//  复制层
//
//  Created by SSIT on 2017/12/12.
//  Copyright © 2017年 com.SSIT. All rights reserved.
//

#import "ViewControllerD.h"

@interface ViewControllerD ()
@property (weak, nonatomic) IBOutlet UIImageView *imv;

@end

@implementation ViewControllerD

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
    
    CGFloat width = CGRectGetWidth(self.imv.frame);
    CGFloat height = 400;
    
    CALayer *imglayer = [CALayer layer];
    imglayer.bounds = CGRectMake(0, 0, 200, 150);
    imglayer.position = CGPointMake(width/2, 100);
    imglayer.contents = (__bridge id)[UIImage imageNamed:@"image"].CGImage;
    
    CAReplicatorLayer *relayer = [CAReplicatorLayer layer];
    [self.view.layer addSublayer:relayer];
    
    relayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    relayer.bounds = CGRectMake(0, 0, width, height);
    relayer.position = self.view.center;;
    relayer.instanceCount = 2;
    
    CATransform3D tra = CATransform3DMakeScale(1, -1, 1);
//    tra.m34 = 2;
//    relayer.instanceTransform = tra;
    relayer.instanceTransform = CATransform3DTranslate(tra, 0, 50, 0);//CATransform3DMakeTranslation(0, 200, 0);
    [relayer addSublayer:imglayer];
    
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
