//
//  ViewController.m
//  DisplayStarView
//
//  Created by 刘转 on 2017/9/19.
//  Copyright © 2017年 刘转. All rights reserved.
//

#import "ViewController.h"
#import "DisplayStarView.h"

@interface ViewController ()<DisplayStarViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 五星评价
#pragma mark------block形式获取分数
    DisplayStarView *sv = [[DisplayStarView alloc]initWithFrame:CGRectMake(20, 20, 120,40) finish:^(CGFloat currentScore) {
        NSLog(@"++++*************++++++++++%lf",currentScore);
    }];
    sv.starSize = 28.0;
    sv.currentScore = 3.0;
    [self.view addSubview:sv];
    
    #pragma mark------delegate获取分数
    //方式一
    DisplayStarView *sv1 = [[DisplayStarView alloc]initWithFrame:CGRectMake(20, 80, 120,40)];
    sv1.delegate = self;
    sv1.starSize = 28.0;
    sv1.currentScore = 4.0;
    [self.view addSubview:sv1];
    
    //方式二
    DisplayStarView *sv2 = [[DisplayStarView alloc]initWithFrame:CGRectMake(20, 160, 120,40) delegate:self];
    sv2.starSize = 28.0;
    sv2.currentScore = 4.0;
    sv2.fullColor = [UIColor redColor];
    sv2.emptyColor = [UIColor greenColor];
    [self.view addSubview:sv2];
}
#pragma mark ---DisplayStarViewDelegate
-(void)starRateView:(DisplayStarView *)starRateView currentScore:(CGFloat)currentScore{
    NSLog(@"++++*************++++++++++%lf",currentScore);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
