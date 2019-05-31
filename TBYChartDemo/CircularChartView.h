//
//  CircularChartView.h
//  TBYChartDemo
//
//  Created by avon on 2019/5/31.
//  Copyright © 2019 Tepia. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CircularChartModel.h"

@interface CircularChartView : UIView
/**
 
 @param valueArray <#valueArray description#>
 @param maxValue <#maxValue description#>
 @param cornerRadius <#cornerRadius description#>
 */
- (void)setValueArray:(NSArray<CircularChartModel *> *)valueArray maxValue:(CGFloat)maxValue layerWidth:(CGFloat)layerWidth;

@end
