//
//  CircularChartModel.m
//  TBYChartDemo
//
//  Created by avon on 2019/5/31.
//  Copyright © 2019 Tepia. All rights reserved.
//

#import "CircularChartModel.h"

@implementation CircularChartModel

- (instancetype)initWithGradientColorArray:(NSArray *)gradientColorArray value:(NSInteger)value;
{
    if (self) {
        self.gradientColorArray = [NSArray arrayWithArray:gradientColorArray];
        self.value = value;
    }
    return self;
}
@end
