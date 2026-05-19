//
//  DGCYYTextContainerView.m
//  DGCYYText <https://github.com/ibireme/DGCYYText>
//
//  Created by ibireme on 15/4/21.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "DGCYYTextContainerView.h"

@implementation DGCYYTextContainerView {
    BOOL _dgc_attachmentChanged;
    NSMutableArray *_dgc_attachmentViews;
    NSMutableArray *_dgc_attachmentLayers;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    self.backgroundColor = [UIColor clearColor];
    _dgc_attachmentViews = [NSMutableArray array];
    _dgc_attachmentLayers = [NSMutableArray array];
    return self;
}

- (void)setDebugOption:(DGCYYTextDebugOption *)debugOption {
    BOOL needDraw = _debugOption.needDrawDebug;
    _debugOption = debugOption.copy;
    if (_debugOption.needDrawDebug != needDraw) {
        [self setNeedsDisplay];
    }
}

- (void)setTextVerticalAlignment:(DGCYYTextVerticalAlignment)textVerticalAlignment {
    if (_textVerticalAlignment == textVerticalAlignment) return;
    _textVerticalAlignment = textVerticalAlignment;
    [self setNeedsDisplay];
}

- (void)setContentsFadeDuration:(NSTimeInterval)contentsFadeDuration {
    if (_contentsFadeDuration == contentsFadeDuration) return;
    _contentsFadeDuration = contentsFadeDuration;
    if (contentsFadeDuration <= 0) {
        [self.layer removeAnimationForKey:@"contents"];
    }
}

- (void)setLayout:(DGCYYTextLayout *)layout {
    if (_layout == layout) return;
    _layout = layout;
    _dgc_attachmentChanged = YES;
    [self setNeedsDisplay];
}

- (void)setLayout:(DGCYYTextLayout *)layout withFadeDuration:(NSTimeInterval)fadeDuration {
    self.contentsFadeDuration = fadeDuration;
    self.layout = layout;
}

- (void)drawRect:(CGRect)rect {
    // fade content
    [self.layer removeAnimationForKey:@"contents"];
    if (_contentsFadeDuration > 0) {
        CATransition *transition = [CATransition animation];
        transition.duration = _contentsFadeDuration;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        transition.type = kCATransitionFade;
        [self.layer addAnimation:transition forKey:@"contents"];
    }
    
    // update attachment
    if (_dgc_attachmentChanged) {
        for (UIView *view in _dgc_attachmentViews) {
            if (view.superview == self) [view removeFromSuperview];
        }
        for (CALayer *layer in _dgc_attachmentLayers) {
            if (layer.superlayer == self.layer) [layer removeFromSuperlayer];
        }
        [_dgc_attachmentViews removeAllObjects];
        [_dgc_attachmentLayers removeAllObjects];
    }
    
    // draw layout
    CGSize boundingSize = _layout.textBoundingSize;
    CGPoint point = CGPointZero;
    if (_textVerticalAlignment == DGCYYTextVerticalAlignmentCenter) {
        if (_layout.container.isVerticalForm) {
            point.x = -(self.bounds.size.width - boundingSize.width) * 0.5;
        } else {
            point.y = (self.bounds.size.height - boundingSize.height) * 0.5;
        }
    } else if (_textVerticalAlignment == DGCYYTextVerticalAlignmentBottom) {
        if (_layout.container.isVerticalForm) {
            point.x = -(self.bounds.size.width - boundingSize.width);
        } else {
            point.y = (self.bounds.size.height - boundingSize.height);
        }
    }
    [_layout drawInContext:UIGraphicsGetCurrentContext() size:self.bounds.size point:point view:self layer:self.layer debug:_debugOption cancel:nil];
    
    // update attachment
    if (_dgc_attachmentChanged) {
        _dgc_attachmentChanged = NO;
        for (DGCYYTextAttachment *a in _layout.attachments) {
            if ([a.content isKindOfClass:[UIView class]]) [_dgc_attachmentViews addObject:a.content];
            if ([a.content isKindOfClass:[CALayer class]]) [_dgc_attachmentLayers addObject:a.content];
        }
    }
}

- (void)setFrame:(CGRect)frame {
    CGSize oldSize = self.bounds.size;
    [super setFrame:frame];
    if (!CGSizeEqualToSize(oldSize, self.bounds.size)) {
        [self setNeedsLayout];
    }
}

- (void)setBounds:(CGRect)bounds {
    CGSize oldSize = self.bounds.size;
    [super setBounds:bounds];
    if (!CGSizeEqualToSize(oldSize, self.bounds.size)) {
        [self setNeedsLayout];
    }
}

#pragma mark - UIResponder forward

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return [self.hostView canPerformAction:action withSender:sender];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.hostView;
}

#pragma mark - Override define
- (void)_define:(id)sender {
    if ([self.hostView canPerformAction:@selector(_define:) withSender:sender]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.hostView performSelector:@selector(_define:) withObject:sender];
        });
    }
}

@end
