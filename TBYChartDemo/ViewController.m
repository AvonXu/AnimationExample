//
//  ViewController.m
//  TBYChartDemo
//
//  Created by avon on 2019/5/31.
//  Copyright © 2019 Tepia. All rights reserved.
//

#import "ViewController.h"

#import "CircularChartView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CircularChartView *chartView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat maxValue = 100;
    
    CircularChartModel *model1 = [[CircularChartModel alloc] initWithGradientColorArray:@[[UIColor colorWithRed:241/255.0 green:137/255.0 blue:31/255.0 alpha:1.0],[UIColor colorWithRed:255/255.0 green:173/255.0 blue:89/255.0 alpha:1.0]] value:30];
    
    CircularChartModel *model2 = [[CircularChartModel alloc] initWithGradientColorArray:@[[UIColor colorWithRed:65/255.0 green:181/255.0 blue:224/255.0 alpha:1.0],[UIColor colorWithRed:242/255.0 green:264/255.0 blue:48/255.0 alpha:1.0]] value:70];


    [self.chartView setValueArray:@[model1,model2] maxValue:maxValue layerWidth:10];

}



@end
