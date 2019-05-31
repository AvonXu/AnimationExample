//
//  CircularChartView.m
//  TBYChartDemo
//
//  Created by avon on 2019/5/31.
//  Copyright © 2019 Tepia. All rights reserved.
//

#import "CircularChartView.h"

@interface CircularChartView()

@property (nonatomic ,assign) CGFloat layerWidth;

@property (nonatomic ,strong) NSMutableArray *layerArray;

@property (nonatomic ,strong) UIColor *bottomColor;

@end

@implementation CircularChartView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setValueArray:(NSArray<CircularChartModel *> *)valueArray maxValue:(CGFloat)maxValue layerWidth:(CGFloat)layerWidth;
{
    self.layerWidth = layerWidth;
    
    __weak __typeof(self)weakSelf = self;
    [self.layerArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        CALayer *layer = (CALayer *)obj;
        if (layer) {
            [layer removeFromSuperlayer];
            [strongSelf.layerArray removeObject:obj];
        }
    }];
    
    NSArray *bottomColorArray ;
    if (self.bottomColor) {
        bottomColorArray = @[self.bottomColor];
    }
    else
    {
         bottomColorArray = @[[UIColor lightGrayColor]];
    }
    [self drawCircleStartAngle:0 endAngle:M_PI*2 colorArray:bottomColorArray];
    
    if (maxValue == 0 || valueArray.count < 1) {
        return;
    }
    __block CGFloat lastEndAngle = M_PI*1.5;
    [valueArray enumerateObjectsUsingBlock:^(CircularChartModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        float percentage = obj.value/maxValue;
        CGFloat angle =  M_PI*2 * percentage;
        CGFloat startAngle = lastEndAngle;
        CGFloat endAngle = startAngle + angle;
        if (obj.gradientColorArray && obj.gradientColorArray.count > 0) {
            [strongSelf drawCircleStartAngle:startAngle endAngle:endAngle colorArray:obj.gradientColorArray];
        }
        lastEndAngle = endAngle;
    }];
}

- (void)drawCircleStartAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle
                  colorArray:(NSArray<UIColor *> *)colorArray;
{
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    
    CGFloat cornerRadius = self.frame.size.width/2.0 - 8.0 - _layerWidth/2.0;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(height/2.0, width/2.0)
                    radius:cornerRadius
                startAngle:startAngle
                  endAngle:endAngle
                 clockwise:YES];
    
    CAShapeLayer *backLayer = [CAShapeLayer layer];
    backLayer.lineWidth = self.layerWidth;
    backLayer.path = path.CGPath;
    backLayer.lineCap = @"butt";
    backLayer.strokeColor = colorArray.firstObject.CGColor;
    backLayer.fillColor = [UIColor clearColor].CGColor;
    
    
    CALayer *gradientLayer = [CALayer layer];
    CAGradientLayer *gradientLayer1 =  [CAGradientLayer layer];
    gradientLayer1.frame = self.bounds;
    __block NSMutableArray *array = [NSMutableArray array];
    if (colorArray.count > 0) {
        [colorArray enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [array addObject:(id)obj.CGColor];
        }];
    }
    [gradientLayer1 setColors:[NSArray arrayWithArray:array]];
    [gradientLayer1 setLocations:@[@0.0,@1]];
    [gradientLayer1 setStartPoint:CGPointMake(0.0, 1.0)];
    [gradientLayer1 setEndPoint:CGPointMake(1.0, 0.0)];
    [gradientLayer addSublayer:gradientLayer1];
    
    [gradientLayer setMask:backLayer];
    
    [self.layer addSublayer:gradientLayer];
    
    [self.layerArray addObject:gradientLayer];
}


#pragma mark - set/get
- (NSMutableArray *)layerArray
{
    if (!_layerArray) {
        _layerArray = [NSMutableArray array];
    }
    return _layerArray;
}

@end
