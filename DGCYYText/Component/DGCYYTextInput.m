//
//  DGCYYTextInput.m
//  DGCYYText <https://github.com/ibireme/DGCYYText>
//
//  Created by ibireme on 15/4/17.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "DGCYYTextInput.h"
#import "DGCYYTextUtilities.h"


@implementation DGCYYTextPosition

+ (instancetype)positionWithOffset:(NSInteger)offset {
    return [self positionWithOffset:offset affinity:DGCYYTextAffinityForward];
}

+ (instancetype)positionWithOffset:(NSInteger)offset affinity:(DGCYYTextAffinity)affinity {
    DGCYYTextPosition *p = [self new];
    p->_offset = offset;
    p->_affinity = affinity;
    return p;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    return [self.class positionWithOffset:_offset affinity:_affinity];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p> (%@%@)", self.class, self, @(_offset), _affinity == DGCYYTextAffinityForward ? @"F":@"B"];
}

- (NSUInteger)hash {
    return _offset * 2 + (_affinity == DGCYYTextAffinityForward ? 1 : 0);
}

- (BOOL)isEqual:(DGCYYTextPosition *)object {
    if (!object) return NO;
    return _offset == object.offset && _affinity == object.affinity;
}

- (NSComparisonResult)compare:(DGCYYTextPosition *)otherPosition {
    if (!otherPosition) return NSOrderedAscending;
    if (_offset < otherPosition.offset) return NSOrderedAscending;
    if (_offset > otherPosition.offset) return NSOrderedDescending;
    if (_affinity == DGCYYTextAffinityBackward && otherPosition.affinity == DGCYYTextAffinityForward) return NSOrderedAscending;
    if (_affinity == DGCYYTextAffinityForward && otherPosition.affinity == DGCYYTextAffinityBackward) return NSOrderedDescending;
    return NSOrderedSame;
}

@end



@implementation DGCYYTextRange {
    DGCYYTextPosition *_dgc_start;
    DGCYYTextPosition *_dgc_end;
}

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    _dgc_start = [DGCYYTextPosition positionWithOffset:0];
    _dgc_end = [DGCYYTextPosition positionWithOffset:0];
    return self;
}

- (DGCYYTextPosition *)start {
    return _dgc_start;
}

- (DGCYYTextPosition *)end {
    return _dgc_end;
}

- (BOOL)isEmpty {
    return _dgc_start.offset == _dgc_end.offset;
}

- (NSRange)asRange {
    return NSMakeRange(_dgc_start.offset, _dgc_end.offset - _dgc_start.offset);
}

+ (instancetype)rangeWithRange:(NSRange)range {
    return [self rangeWithRange:range affinity:DGCYYTextAffinityForward];
}

+ (instancetype)rangeWithRange:(NSRange)range affinity:(DGCYYTextAffinity)affinity {
    DGCYYTextPosition *start = [DGCYYTextPosition positionWithOffset:range.location affinity:affinity];
    DGCYYTextPosition *end = [DGCYYTextPosition positionWithOffset:range.location + range.length affinity:affinity];
    return [self rangeWithStart:start end:end];
}

+ (instancetype)rangeWithStart:(DGCYYTextPosition *)start end:(DGCYYTextPosition *)end {
    if (!start || !end) return nil;
    if ([start compare:end] == NSOrderedDescending) {
        YYTEXT_SWAP(start, end);
    }
    DGCYYTextRange *range = [DGCYYTextRange new];
    range->_start = start;
    range->_end = end;
    return range;
}

+ (instancetype)defaultRange {
    return [self new];
}

- (instancetype)copyWithZone:(NSZone *)zone {
    return [self.class rangeWithStart:_dgc_start end:_dgc_end];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p> (%@, %@)%@", self.class, self, @(_dgc_start.offset), @(_dgc_end.offset - _dgc_start.offset), _dgc_end.affinity == DGCYYTextAffinityForward ? @"F":@"B"];
}

- (NSUInteger)hash {
    return (sizeof(NSUInteger) == 8 ? OSSwapInt64(_dgc_start.hash) : OSSwapInt32(_dgc_start.hash)) + _dgc_end.hash;
}

- (BOOL)isEqual:(DGCYYTextRange *)object {
    if (!object) return NO;
    return [_dgc_start isEqual:object.start] && [_dgc_end isEqual:object.end];
}

@end



@implementation DGCYYTextSelectionRect

@synthesize rect = _rect;
@synthesize writingDirection = _writingDirection;
@synthesize containsStart = _containsStart;
@synthesize containsEnd = _containsEnd;
@synthesize isVertical = _isVertical;

- (id)copyWithZone:(NSZone *)zone {
    DGCYYTextSelectionRect *one = [self.class new];
    one.rect = _rect;
    one.writingDirection = _writingDirection;
    one.containsStart = _containsStart;
    one.containsEnd = _containsEnd;
    one.isVertical = _isVertical;
    return one;
}

@end
