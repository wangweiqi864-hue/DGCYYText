//
//  DGCYYFPSLabel.m
//  YYKitExample
//
//  Created by ibireme on 15/9/3.
//  Copyright (c) 2015 ibireme. All rights reserved.
//

#import "DGCYYFPSLabel.h"
//#import <YYKit/YYKit.h>
#import "DGCYYText.h"
#import "DGCYYWeakProxy.h"

#define kSize CGSizeMake(55, 20)

@implementation DGCYYFPSLabel {
    CADisplayLink *_dgc_link;
    NSUInteger _dgc_count;
    NSTimeInterval _dgc_lastTime;
    UIFont *_dgc_font;
    UIFont *_dgc_subFont;
    
    NSTimeInterval _dgc_llll;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size = kSize;
    }
    self = [super initWithFrame:frame];
    
    self.layer.cornerRadius = 5;
    self.clipsToBounds = YES;
    self.textAlignment = NSTextAlignmentCenter;
    self.userInteractionEnabled = NO;
    self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.700];
    
    _dgc_font = [UIFont fontWithName:@"Menlo" size:14];
    if (_dgc_font) {
        _dgc_subFont = [UIFont fontWithName:@"Menlo" size:4];
    } else {
        _dgc_font = [UIFont fontWithName:@"Courier" size:14];
        _dgc_subFont = [UIFont fontWithName:@"Courier" size:4];
    }
    
    _dgc_link = [CADisplayLink displayLinkWithTarget:[DGCYYWeakProxy proxyWithTarget:self] selector:@selector(tick:)];
    [_dgc_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    return self;
}

- (void)dealloc {
    [_dgc_link invalidate];
}

- (CGSize)sizeThatFits:(CGSize)size {
    return kSize;
}

- (void)tick:(CADisplayLink *)link {
    if (_dgc_lastTime == 0) {
        _dgc_lastTime = link.timestamp;
        return;
    }
    
    _dgc_count++;
    NSTimeInterval delta = link.timestamp - _dgc_lastTime;
    if (delta < 1) return;
    _dgc_lastTime = link.timestamp;
    float fps = _dgc_count / delta;
    _dgc_count = 0;
    
    CGFloat progress = fps / 60.0;
    UIColor *color = [UIColor colorWithHue:0.27 * (progress - 0.2) saturation:1 brightness:0.9 alpha:1];
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d FPS",(int)round(fps)]];
    [text yy_setColor:color range:NSMakeRange(0, text.length - 3)];
    [text yy_setColor:[UIColor whiteColor] range:NSMakeRange(text.length - 3, 3)];
    text.yy_font = _dgc_font;
    [text yy_setFont:_dgc_subFont range:NSMakeRange(text.length - 4, 1)];
    
    self.attributedText = text;
}

@end
