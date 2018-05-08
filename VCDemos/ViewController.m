//
//  ViewController.m
//  VCDemos
//
//  Created by sunyazhou on 2018/5/8.
//  Copyright © 2018年 Kwai Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "VC1ViewController.h"
#import "VC2ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)VC1ViewController *vc1;
@property (nonatomic, strong)VC2ViewController *vc2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.vc1 = [[VC1ViewController alloc] init];
    self.vc2 = [[VC2ViewController alloc] init];
    
    [self addChildViewController:self.vc1];
    [self.view addSubview:self.vc1.view];
    self.vc1.view.frame = CGRectMake(0, 0, 100, 100);
    [self.vc1 didMoveToParentViewController:self];//子控制器被通知有了一个父控制器


    
    [self addChildViewController:self.vc2];
    [self.view addSubview:self.vc2.view];
    self.vc2.view.frame = CGRectMake(0, 0, 100, 100);
    [self.vc2 didMoveToParentViewController:self];//子控制器被通知有了一个父控制器

}


- (BOOL)shouldAutomaticallyForwardAppearanceMethods{
    //手动管理子VC的生命周期
    return NO;
}


- (IBAction)click:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self.vc1 beginAppearanceTransition:NO animated:YES];
        [self.vc2 beginAppearanceTransition:YES animated:YES];
        [self.vc1 endAppearanceTransition];
        [self.vc2 endAppearanceTransition];
    } else {
        [self.vc1 beginAppearanceTransition:YES animated:YES];
        [self.vc2 beginAppearanceTransition:NO animated:YES];
        [self.vc1 endAppearanceTransition];
        [self.vc2 endAppearanceTransition];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
