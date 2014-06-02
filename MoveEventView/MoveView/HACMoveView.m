//
//  HACMoveView.m
//  MoveEventView
//
//  Created by Takahiro Nishinobu on 2014/06/02.
//  Copyright (c) 2014年 hachinobu. All rights reserved.
//

#import "HACMoveView.h"

@interface HACMoveView ()

@property (nonatomic) DurationType durationType;
@property (nonatomic) CGPoint durationPoint;

@end

@implementation HACMoveView

- (id)initWithFrame:(CGRect)frame durationType:(DurationType)durationType
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _durationType = durationType;
    }
    return self;
}

#pragma mark - View Event
- (void)willMoveToWindow:(UIWindow *)newWindow
{
    
}

- (void)didMoveToWindow
{
    
}


- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (!newSuperview) {
        if ([_delegate respondsToSelector:@selector(finishAnimationWithView:)]) {
            [_delegate finishAnimationWithView:self];
        }
        return;
    }
    
    CGRect rect = self.frame;
    switch (_durationType) {
        case DurationTypeTop:
            self.durationPoint = CGPointMake(.0f, -CGRectGetMaxY(rect));
            break;
            
        case DurationTypeLeft:
            self.durationPoint = CGPointMake(-CGRectGetMaxX(rect), .0f);
            break;
            
        case DurationTypeRight:
            self.durationPoint = CGPointMake(CGRectGetMaxX(rect), .0f);
            break;
            
        case DurationTypeBottom:
            self.durationPoint = CGPointMake(.0f, CGRectGetMaxY(rect));
            break;
            
        default:
            break;
    }
}

- (void)didMoveToSuperview
{
    [UIView animateWithDuration:2.0f animations:^{
        self.frame = (CGRect) { self.durationPoint, self.frame.size };
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
