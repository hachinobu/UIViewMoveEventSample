//
//  HACViewController.m
//  MoveEventView
//
//  Created by Takahiro Nishinobu on 2014/06/02.
//  Copyright (c) 2014年 hachinobu. All rights reserved.
//

#import "HACViewController.h"
#import "HACMoveView.h"

@interface HACViewController () <HACMoveViewDelegate>

@property (nonatomic) CGRect targetRect;
@property (nonatomic) CGRect sliceRect;
@property (nonatomic) CGRect remainderRect;

@end

@implementation HACViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blueColor];
    
    CGFloat amount = CGRectGetWidth(self.view.frame) / 2;
    self.targetRect = self.view.frame;
    self.sliceRect = CGRectNull;
    self.remainderRect = CGRectNull;
    CGRectDivide(_targetRect, &_sliceRect, &_remainderRect, amount, CGRectMaxXEdge);
    
    HACMoveView *leftSlideView = [[HACMoveView alloc] initWithFrame:_remainderRect durationType:DurationTypeLeft];
    leftSlideView.backgroundColor = [UIColor redColor];
    leftSlideView.delegate = self;
    
    HACMoveView *rightSlideView = [[HACMoveView alloc] initWithFrame:_sliceRect durationType:DurationTypeRight];
    rightSlideView .backgroundColor = [UIColor redColor];
    rightSlideView.delegate = self;
    
    [self.view addSubview:leftSlideView];
    [self.view addSubview:rightSlideView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - HACMoveViewDelegate
- (void)finishAnimationWithView:(HACMoveView *)moveView
{
    self.view.backgroundColor = [UIColor yellowColor];
    
    CGFloat amount = CGRectGetHeight(self.view.frame) / 2;
    CGRectDivide(_targetRect, &_sliceRect, &_remainderRect, amount, CGRectMaxYEdge);
    
    HACMoveView *topSlideView = [[HACMoveView alloc] initWithFrame:_remainderRect durationType:DurationTypeTop];
    topSlideView.backgroundColor = [UIColor blueColor];
    
    HACMoveView *bottomView = [[HACMoveView alloc] initWithFrame:_sliceRect durationType:DurationTypeBottom];
    bottomView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:topSlideView];
    [self.view addSubview:bottomView];
}

@end
