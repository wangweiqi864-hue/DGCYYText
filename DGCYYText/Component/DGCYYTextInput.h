//
//  DGCYYTextInput.h
//  DGCYYText <https://github.com/ibireme/DGCYYText>
//
//  Created by ibireme on 15/4/17.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Text position affinity. For example, the offset appears after the last
 character on a line is backward affinity, before the first character on
 the following line is forward affinity.
 */
typedef NS_ENUM(NSInteger, DGCYYTextAffinity) {
    DGCYYTextAffinityForward  = 0, ///< offset appears before the character
    DGCYYTextAffinityBackward = 1, ///< offset appears after the character
};


/**
 A DGCYYTextPosition object represents a position in a text container; in other words, 
 it is an index into the backing string in a text-displaying view.
 
 DGCYYTextPosition has the same API as Apple's implementation in UITextView/UITextField,
 so you can alse use it to interact with UITextView/UITextField.
 */
@interface DGCYYTextPosition : UITextPosition <NSCopying>

@property (nonatomic, readonly) NSInteger offset;
@property (nonatomic, readonly) DGCYYTextAffinity affinity;

+ (instancetype)positionWithOffset:(NSInteger)offset;
+ (instancetype)positionWithOffset:(NSInteger)offset affinity:(DGCYYTextAffinity) affinity;

- (NSComparisonResult)compare:(id)otherPosition;

@end


/**
 A DGCYYTextRange object represents a range of characters in a text container; in other words, 
 it identifies a starting index and an ending index in string backing a text-displaying view.
 
 DGCYYTextRange has the same API as Apple's implementation in UITextView/UITextField,
 so you can alse use it to interact with UITextView/UITextField.
 */
@interface DGCYYTextRange : UITextRange <NSCopying>

@property (nonatomic, readonly) DGCYYTextPosition *start;
@property (nonatomic, readonly) DGCYYTextPosition *end;
@property (nonatomic, readonly, getter=isEmpty) BOOL empty;

+ (instancetype)rangeWithRange:(NSRange)range;
+ (instancetype)rangeWithRange:(NSRange)range affinity:(DGCYYTextAffinity) affinity;
+ (instancetype)rangeWithStart:(DGCYYTextPosition *)start end:(DGCYYTextPosition *)end;
+ (instancetype)defaultRange; ///< <{0,0} Forward>

- (NSRange)asRange;

@end


/**
 A DGCYYTextSelectionRect object encapsulates information about a selected range of 
 text in a text-displaying view.
 
 DGCYYTextSelectionRect has the same API as Apple's implementation in UITextView/UITextField,
 so you can alse use it to interact with UITextView/UITextField.
 */
@interface DGCYYTextSelectionRect : UITextSelectionRect <NSCopying>

@property (nonatomic, readwrite) CGRect rect;
@property (nonatomic, readwrite) UITextWritingDirection writingDirection;
@property (nonatomic, readwrite) BOOL containsStart;
@property (nonatomic, readwrite) BOOL containsEnd;
@property (nonatomic, readwrite) BOOL isVertical;

@end

NS_ASSUME_NONNULL_END
