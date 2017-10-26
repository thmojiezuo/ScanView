//
//  HMScanView.h
//  HeadManage
//
//  Created by a111 on 17/9/4.
//  Copyright © 2017年 Tenghu. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol KScanViewDelegate <NSObject>

-(void)getScanDataString:(NSString*)scanDataString;

@end


@interface KScanView : UIView

@property (nonatomic,assign) id<KScanViewDelegate> delegate;
@property (nonatomic,assign) int scanW; //扫描框的宽

- (void)startRunning; //开始扫描
- (void)stopRunning; //停止扫描


@end
