//
//  ViewController.m
//  ScanView
//
//  Created by tenghu on 2017/10/26.
//  Copyright © 2017年 tenghu. All rights reserved.
//

#import "ViewController.h"
#import "KScanView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<KScanViewDelegate>

@property (nonatomic ,strong)KScanView *scanView;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [_scanView startRunning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark 注意：需要在info.plist中添加 NSCameraUsageDescription 描述
    
    
    _scanView = [[KScanView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    _scanView.scanW = 250;
    _scanView.delegate = self;
    [self.view addSubview:_scanView];
}
#pragma mark -代理方法
-(void)getScanDataString:(NSString*)scanDataString{
    
    NSString *str = [NSString stringWithFormat:@"扫描成功:%@",scanDataString];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:str delegate:self cancelButtonTitle:@"嗯" otherButtonTitles:nil, nil];
    [alert show];
    
    if ([scanDataString hasPrefix:@"http"]) {
        [[UIApplication sharedApplication] openURL: [ NSURL URLWithString:scanDataString ]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
