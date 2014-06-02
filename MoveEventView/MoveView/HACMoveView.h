//
//  HACMoveView.h
//  MoveEventView
//
//  Created by Takahiro Nishinobu on 2014/06/02.
//  Copyright (c) 2014年 hachinobu. All rights reserved.
//

typedef NS_ENUM(NSInteger, DurationType) {
    DurationTypeTop,
    DurationTypeLeft,
    DurationTypeRight,
    DurationTypeBottom,
};

#import <UIKit/UIKit.h>

@protocol HACMoveViewDelegate;

@interface HACMoveView : UIView

@property (nonatomic, weak) NSObject<HACMoveViewDelegate> *delegate;
- (id)initWithFrame:(CGRect)frame durationType:(DurationType)duration;

@end

@protocol HACMoveViewDelegate <NSObject>

- (void)finishAnimationWithView:(HACMoveView *)moveView;

@end