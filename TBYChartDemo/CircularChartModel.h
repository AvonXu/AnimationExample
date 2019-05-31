//
//  CircularChartModel.h
//  TBYChartDemo
//
//  Created by avon on 2019/5/31.
//  Copyright © 2019 Tepia. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface CircularChartModel : NSObject

@property (nonatomic ,strong) NSArray *gradientColorArray;


@property (nonatomic ,assign) NSInteger value;

- (instancetype)initWithGradientColorArray:(NSArray *)gradientColorArray value:(NSInteger)value;
@end

