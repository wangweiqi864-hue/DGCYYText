//
//  DGCYYTextAttribute.m
//  DGCYYText <https://github.com/ibireme/DGCYYText>
//
//  Created by ibireme on 14/10/26.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "DGCYYTextAttribute.h"
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "NSAttributedString+DGCYYText.h"
#import "DGCYYTextArchiver.h"


static double _YYDeviceSystemVersion(void) {
    static double version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion.doubleValue;
    });
    return version;
}


NSString *const DGCYYTextBackedStringAttributeName = @"DGCYYTextBackedString";
NSString *const DGCYYTextBindingAttributeName = @"DGCYYTextBinding";
NSString *const DGCYYTextShadowAttributeName = @"DGCYYTextShadow";
NSString *const DGCYYTextInnerShadowAttributeName = @"DGCYYTextInnerShadow";
NSString *const DGCYYTextUnderlineAttributeName = @"DGCYYTextUnderline";
NSString *const DGCYYTextStrikethroughAttributeName = @"DGCYYTextStrikethrough";
NSString *const DGCYYTextBorderAttributeName = @"DGCYYTextBorder";
NSString *const DGCYYTextBackgroundBorderAttributeName = @"DGCYYTextBackgroundBorder";
NSString *const DGCYYTextBlockBorderAttributeName = @"DGCYYTextBlockBorder";
NSString *const DGCYYTextAttachmentAttributeName = @"DGCYYTextAttachment";
NSString *const DGCYYTextHighlightAttributeName = @"DGCYYTextHighlight";
NSString *const DGCYYTextGlyphTransformAttributeName = @"DGCYYTextGlyphTransform";

NSString *const DGCYYTextAttachmentToken = @"\uFFFC";
NSString *const DGCYYTextTruncationToken = @"\u2026";


DGCYYTextAttributeType DGCYYTextAttributeGetType(NSString *name){
    if (name.length == 0) return DGCYYTextAttributeTypeNone;
    
    static NSMutableDictionary *dic;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dic = [NSMutableDictionary new];
        NSNumber *All = @(DGCYYTextAttributeTypeUIKit | DGCYYTextAttributeTypeCoreText | DGCYYTextAttributeTypeDGCYYText);
        NSNumber *CoreText_DGCYYText = @(DGCYYTextAttributeTypeCoreText | DGCYYTextAttributeTypeDGCYYText);
        NSNumber *UIKit_DGCYYText = @(DGCYYTextAttributeTypeUIKit | DGCYYTextAttributeTypeDGCYYText);
        NSNumber *UIKit_CoreText = @(DGCYYTextAttributeTypeUIKit | DGCYYTextAttributeTypeCoreText);
        NSNumber *UIKit = @(DGCYYTextAttributeTypeUIKit);
        NSNumber *CoreText = @(DGCYYTextAttributeTypeCoreText);
        NSNumber *DGCYYText = @(DGCYYTextAttributeTypeDGCYYText);
        
        dic[NSFontAttributeName] = All;
        dic[NSKernAttributeName] = All;
        dic[NSForegroundColorAttributeName] = UIKit;
        dic[(id)kCTForegroundColorAttributeName] = CoreText;
        dic[(id)kCTForegroundColorFromContextAttributeName] = CoreText;
        dic[NSBackgroundColorAttributeName] = UIKit;
        dic[NSStrokeWidthAttributeName] = All;
        dic[NSStrokeColorAttributeName] = UIKit;
        dic[(id)kCTStrokeColorAttributeName] = CoreText_DGCYYText;
        dic[NSShadowAttributeName] = UIKit_DGCYYText;
        dic[NSStrikethroughStyleAttributeName] = UIKit;
        dic[NSUnderlineStyleAttributeName] = UIKit_CoreText;
        dic[(id)kCTUnderlineColorAttributeName] = CoreText;
        dic[NSLigatureAttributeName] = All;
        dic[(id)kCTSuperscriptAttributeName] = UIKit; //it's a CoreText attrubite, but only supported by UIKit...
        dic[NSVerticalGlyphFormAttributeName] = All;
        dic[(id)kCTGlyphInfoAttributeName] = CoreText_DGCYYText;
        dic[(id)kCTRunDelegateAttributeName] = CoreText_DGCYYText;
        dic[(id)kCTBaselineClassAttributeName] = CoreText_DGCYYText;
        dic[(id)kCTBaselineInfoAttributeName] = CoreText_DGCYYText;
        dic[(id)kCTBaselineReferenceInfoAttributeName] = CoreText_DGCYYText;
        dic[(id)kCTWritingDirectionAttributeName] = CoreText_DGCYYText;
        dic[NSParagraphStyleAttributeName] = All;
        
        if (_YYDeviceSystemVersion() >= 7) {
            dic[NSStrikethroughColorAttributeName] = UIKit;
            dic[NSUnderlineColorAttributeName] = UIKit;
            dic[NSTextEffectAttributeName] = UIKit;
            dic[NSObliquenessAttributeName] = UIKit;
            dic[NSExpansionAttributeName] = UIKit;
            dic[(id)kCTLanguageAttributeName] = CoreText_DGCYYText;
            dic[NSBaselineOffsetAttributeName] = UIKit;
            dic[NSWritingDirectionAttributeName] = All;
            dic[NSAttachmentAttributeName] = UIKit;
            dic[NSLinkAttributeName] = UIKit;
        }
        if (_YYDeviceSystemVersion() >= 8) {
            dic[(id)kCTRubyAnnotationAttributeName] = CoreText;
        }
        
        dic[DGCYYTextBackedStringAttributeName] = DGCYYText;
        dic[DGCYYTextBindingAttributeName] = DGCYYText;
        dic[DGCYYTextShadowAttributeName] = DGCYYText;
        dic[DGCYYTextInnerShadowAttributeName] = DGCYYText;
        dic[DGCYYTextUnderlineAttributeName] = DGCYYText;
        dic[DGCYYTextStrikethroughAttributeName] = DGCYYText;
        dic[DGCYYTextBorderAttributeName] = DGCYYText;
        dic[DGCYYTextBackgroundBorderAttributeName] = DGCYYText;
        dic[DGCYYTextBlockBorderAttributeName] = DGCYYText;
        dic[DGCYYTextAttachmentAttributeName] = DGCYYText;
        dic[DGCYYTextHighlightAttributeName] = DGCYYText;
        dic[DGCYYTextGlyphTransformAttributeName] = DGCYYText;
    });
    NSNumber *num = dic[name];
    if (num != nil) return num.integerValue;
    return DGCYYTextAttributeTypeNone;
}


@implementation DGCYYTextBackedString

+ (instancetype)stringWithString:(NSString *)string {
    DGCYYTextBackedString *one = [self new];
    one.string = string;
    return one;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.string forKey:@"string"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    _string = [aDecoder decodeObjectForKey:@"string"];
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    typeof(self) one = [self.class new];
    one.string = self.string;
    return one;
}

@end


@implementation DGCYYTextBinding

+ (instancetype)bindingWithDeleteConfirm:(BOOL)deleteConfirm {
    DGCYYTextBinding *one = [self new];
    one.deleteConfirm = deleteConfirm;
    return one;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:@(self.deleteConfirm) forKey:@"deleteConfirm"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    _deleteConfirm = ((NSNumber *)[aDecoder decodeObjectForKey:@"deleteConfirm"]).boolValue;
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    typeof(self) one = [self.class new];
    one.deleteConfirm = self.deleteConfirm;
    return one;
}

@end


@implementation DGCYYTextShadow

+ (instancetype)shadowWithColor:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius {
    DGCYYTextShadow *one = [self new];
    one.color = color;
    one.offset = offset;
    one.radius = radius;
    return one;
}

+ (instancetype)shadowWithNSShadow:(NSShadow *)nsShadow {
    if (!nsShadow) return nil;
    DGCYYTextShadow *shadow = [self new];
    shadow.offset = nsShadow.shadowOffset;
    shadow.radius = nsShadow.shadowBlurRadius;
    id color = nsShadow.shadowColor;
    if (color) {
        if (CGColorGetTypeID() == CFGetTypeID((__bridge CFTypeRef)(color))) {
            color = [UIColor colorWithCGColor:(__bridge CGColorRef)(color)];
        }
        if ([color isKindOfClass:[UIColor class]]) {
            shadow.color = color;
        }
    }
    return shadow;
}

- (NSShadow *)nsShadow {
    NSShadow *shadow = [NSShadow new];
    shadow.shadowOffset = self.offset;
    shadow.shadowBlurRadius = self.radius;
    shadow.shadowColor = self.color;
    return shadow;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.color forKey:@"color"];
    [aCoder encodeObject:@(self.radius) forKey:@"radius"];
    [aCoder encodeObject:[NSValue valueWithCGSize:self.offset] forKey:@"offset"];
    [aCoder encodeObject:self.subShadow forKey:@"subShadow"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    _color = [aDecoder decodeObjectForKey:@"color"];
    _radius = ((NSNumber *)[aDecoder decodeObjectForKey:@"radius"]).floatValue;
    _offset = ((NSValue *)[aDecoder decodeObjectForKey:@"offset"]).CGSizeValue;
    _subShadow = [aDecoder decodeObjectForKey:@"subShadow"];
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    typeof(self) one = [self.class new];
    one.color = self.color;
    one.radius = self.radius;
    one.offset = self.offset;
    one.subShadow = self.subShadow.copy;
    return one;
}

@end


@implementation DGCYYTextDecoration

- (instancetype)init {
    self = [super init];
    _style = DGCYYTextLineStyleSingle;
    return self;
}

+ (instancetype)decorationWithStyle:(DGCYYTextLineStyle)style {
    DGCYYTextDecoration *one = [self new];
    one.style = style;
    return one;
}
+ (instancetype)decorationWithStyle:(DGCYYTextLineStyle)style width:(NSNumber *)width color:(UIColor *)color {
    DGCYYTextDecoration *one = [self new];
    one.style = style;
    one.width = width;
    one.color = color;
    return one;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:@(self.style) forKey:@"style"];
    [aCoder encodeObject:self.width forKey:@"width"];
    [aCoder encodeObject:self.color forKey:@"color"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    self.style = ((NSNumber *)[aDecoder decodeObjectForKey:@"style"]).unsignedIntegerValue;
    self.width = [aDecoder decodeObjectForKey:@"width"];
    self.color = [aDecoder decodeObjectForKey:@"color"];
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    typeof(self) one = [self.class new];
    one.style = self.style;
    one.width = self.width;
    one.color = self.color;
    return one;
}

@end


@implementation DGCYYTextBorder

+ (instancetype)borderWithLineStyle:(DGCYYTextLineStyle)lineStyle lineWidth:(CGFloat)width strokeColor:(UIColor *)color {
    DGCYYTextBorder *one = [self new];
    one.lineStyle = lineStyle;
    one.strokeWidth = width;
    one.strokeColor = color;
    return one;
}

+ (instancetype)borderWithFillColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius {
    DGCYYTextBorder *one = [self new];
    one.fillColor = color;
    one.cornerRadius = cornerRadius;
    one.insets = UIEdgeInsetsMake(-2, 0, 0, -2);
    return one;
}

- (instancetype)init {
    self = [super init];
    self.lineStyle = DGCYYTextLineStyleSingle;
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:@(self.lineStyle) forKey:@"lineStyle"];
    [aCoder encodeObject:@(self.strokeWidth) forKey:@"strokeWidth"];
    [aCoder encodeObject:self.strokeColor forKey:@"strokeColor"];
    [aCoder encodeObject:@(self.lineJoin) forKey:@"lineJoin"];
    [aCoder encodeObject:[NSValue valueWithUIEdgeInsets:self.insets] forKey:@"insets"];
    [aCoder encodeObject:@(self.cornerRadius) forKey:@"cornerRadius"];
    [aCoder encodeObject:self.shadow forKey:@"shadow"];
    [aCoder encodeObject:self.fillColor forKey:@"fillColor"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    _lineStyle = ((NSNumber *)[aDecoder decodeObjectForKey:@"lineStyle"]).unsignedIntegerValue;
    _strokeWidth = ((NSNumber *)[aDecoder decodeObjectForKey:@"strokeWidth"]).doubleValue;
    _strokeColor = [aDecoder decodeObjectForKey:@"strokeColor"];
    _lineJoin = (CGLineJoin)((NSNumber *)[aDecoder decodeObjectForKey:@"join"]).unsignedIntegerValue;
    _insets = ((NSValue *)[aDecoder decodeObjectForKey:@"insets"]).UIEdgeInsetsValue;
    _cornerRadius = ((NSNumber *)[aDecoder decodeObjectForKey:@"cornerRadius"]).doubleValue;
    _shadow = [aDecoder decodeObjectForKey:@"shadow"];
    _fillColor = [aDecoder decodeObjectForKey:@"fillColor"];
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    typeof(self) one = [self.class new];
    one.lineStyle = self.lineStyle;
    one.strokeWidth = self.strokeWidth;
    one.strokeColor = self.strokeColor;
    one.lineJoin = self.lineJoin;
    one.insets = self.insets;
    one.cornerRadius = self.cornerRadius;
    one.shadow = self.shadow.copy;
    one.fillColor = self.fillColor;
    return one;
}

@end


@implementation DGCYYTextAttachment

+ (instancetype)attachmentWithContent:(id)content {
    DGCYYTextAttachment *one = [self new];
    one.content = content;
    return one;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.content forKey:@"content"];
    [aCoder encodeObject:[NSValue valueWithUIEdgeInsets:self.contentInsets] forKey:@"contentInsets"];
    [aCoder encodeObject:self.userInfo forKey:@"userInfo"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    _content = [aDecoder decodeObjectForKey:@"content"];
    _contentInsets = ((NSValue *)[aDecoder decodeObjectForKey:@"contentInsets"]).UIEdgeInsetsValue;
    _userInfo = [aDecoder decodeObjectForKey:@"userInfo"];
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    typeof(self) one = [self.class new];
    if ([self.content respondsToSelector:@selector(copy)]) {
        one.content = [self.content copy];
    } else {
        one.content = self.content;
    }
    one.contentInsets = self.contentInsets;
    one.userInfo = self.userInfo.copy;
    return one;
}

@end


@implementation DGCYYTextHighlight

+ (instancetype)highlightWithAttributes:(NSDictionary *)attributes {
    DGCYYTextHighlight *one = [self new];
    one.attributes = attributes;
    return one;
}

+ (instancetype)highlightWithBackgroundColor:(UIColor *)color {
    DGCYYTextBorder *highlightBorder = [DGCYYTextBorder new];
    highlightBorder.insets = UIEdgeInsetsMake(-2, -1, -2, -1);
    highlightBorder.cornerRadius = 3;
    highlightBorder.fillColor = color;
    
    DGCYYTextHighlight *one = [self new];
    [one setBackgroundBorder:highlightBorder];
    return one;
}

- (void)setAttributes:(NSDictionary *)attributes {
    _attributes = attributes.mutableCopy;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    NSData *data = nil;
    @try {
        data = [DGCYYTextArchiver archivedDataWithRootObject:self.attributes];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    [aCoder encodeObject:data forKey:@"attributes"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    NSData *data = [aDecoder decodeObjectForKey:@"attributes"];
    @try {
        _attributes = [DGCYYTextUnarchiver unarchiveObjectWithData:data];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    typeof(self) one = [self.class new];
    one.attributes = self.attributes.mutableCopy;
    return one;
}

- (void)_makeMutableAttributes {
    if (!_attributes) {
        _attributes = [NSMutableDictionary new];
    } else if (![_attributes isKindOfClass:[NSMutableDictionary class]]) {
        _attributes = _attributes.mutableCopy;
    }
}

- (void)setFont:(UIFont *)font {
    [self _makeMutableAttributes];
    if (font == (id)[NSNull null] || font == nil) {
        ((NSMutableDictionary *)_attributes)[(id)kCTFontAttributeName] = [NSNull null];
    } else {
        CTFontRef ctFont = CTFontCreateWithName((__bridge CFStringRef)font.fontName, font.pointSize, NULL);
        if (ctFont) {
            ((NSMutableDictionary *)_attributes)[(id)kCTFontAttributeName] = (__bridge id)(ctFont);
            CFRelease(ctFont);
        }
    }
}

- (void)setColor:(UIColor *)color {
    [self _makeMutableAttributes];
    if (color == (id)[NSNull null] || color == nil) {
        ((NSMutableDictionary *)_attributes)[(id)kCTForegroundColorAttributeName] = [NSNull null];
        ((NSMutableDictionary *)_attributes)[NSForegroundColorAttributeName] = [NSNull null];
    } else {
        ((NSMutableDictionary *)_attributes)[(id)kCTForegroundColorAttributeName] = (__bridge id)(color.CGColor);
        ((NSMutableDictionary *)_attributes)[NSForegroundColorAttributeName] = color;
    }
}

- (void)setStrokeWidth:(NSNumber *)width {
    [self _makeMutableAttributes];
    if (width == (id)[NSNull null] || width == nil) {
        ((NSMutableDictionary *)_attributes)[(id)kCTStrokeWidthAttributeName] = [NSNull null];
    } else {
        ((NSMutableDictionary *)_attributes)[(id)kCTStrokeWidthAttributeName] = width;
    }
}

- (void)setStrokeColor:(UIColor *)color {
    [self _makeMutableAttributes];
    if (color == (id)[NSNull null] || color == nil) {
        ((NSMutableDictionary *)_attributes)[(id)kCTStrokeColorAttributeName] = [NSNull null];
        ((NSMutableDictionary *)_attributes)[NSStrokeColorAttributeName] = [NSNull null];
    } else {
        ((NSMutableDictionary *)_attributes)[(id)kCTStrokeColorAttributeName] = (__bridge id)(color.CGColor);
        ((NSMutableDictionary *)_attributes)[NSStrokeColorAttributeName] = color;
    }
}

- (void)setTextAttribute:(NSString *)attribute value:(id)value {
    [self _makeMutableAttributes];
    if (value == nil) value = [NSNull null];
    ((NSMutableDictionary *)_attributes)[attribute] = value;
}

- (void)setShadow:(DGCYYTextShadow *)shadow {
    [self setTextAttribute:DGCYYTextShadowAttributeName value:shadow];
}

- (void)setInnerShadow:(DGCYYTextShadow *)shadow {
    [self setTextAttribute:DGCYYTextInnerShadowAttributeName value:shadow];
}

- (void)setUnderline:(DGCYYTextDecoration *)underline {
    [self setTextAttribute:DGCYYTextUnderlineAttributeName value:underline];
}

- (void)setStrikethrough:(DGCYYTextDecoration *)strikethrough {
    [self setTextAttribute:DGCYYTextStrikethroughAttributeName value:strikethrough];
}

- (void)setBackgroundBorder:(DGCYYTextBorder *)border {
    [self setTextAttribute:DGCYYTextBackgroundBorderAttributeName value:border];
}

- (void)setBorder:(DGCYYTextBorder *)border {
    [self setTextAttribute:DGCYYTextBorderAttributeName value:border];
}

- (void)setAttachment:(DGCYYTextAttachment *)attachment {
    [self setTextAttribute:DGCYYTextAttachmentAttributeName value:attachment];
}

@end

