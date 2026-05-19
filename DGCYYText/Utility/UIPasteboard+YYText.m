//
//  UIPasteboard+DGCYYText.m
//  DGCYYText <https://github.com/ibireme/DGCYYText>
//
//  Created by ibireme on 15/4/2.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "UIPasteboard+DGCYYText.h"
#import "NSAttributedString+DGCYYText.h"
#import <MobileCoreServices/MobileCoreServices.h>


#if __has_include("DGCYYImage.h")
#import "DGCYYImage.h"
#define DGCYYTextAnimatedImageAvailable 1
#elif __has_include(<DGCYYImage/DGCYYImage.h>)
#import <DGCYYImage/DGCYYImage.h>
#define DGCYYTextAnimatedImageAvailable 1
#elif __has_include(<YYWebImage/DGCYYImage.h>)
#import <YYWebImage/DGCYYImage.h>
#define DGCYYTextAnimatedImageAvailable 1
#else
#define DGCYYTextAnimatedImageAvailable 0
#endif


// Dummy class for category
@interface DGCUIPasteboard_DGCYYText : NSObject @end
@implementation DGCUIPasteboard_DGCYYText @end


NSString *const DGCYYTextPasteboardTypeAttributedString = @"com.ibireme.NSAttributedString";
NSString *const DGCYYTextUTTypeWEBP = @"com.google.webp";

@implementation UIPasteboard (DGCYYText)


- (void)setYy_PNGData:(NSData *)PNGData {
    [self setData:PNGData forPasteboardType:(id)kUTTypePNG];
}

- (NSData *)yy_PNGData {
    return [self dataForPasteboardType:(id)kUTTypePNG];
}

- (void)setYy_JPEGData:(NSData *)JPEGData {
    [self setData:JPEGData forPasteboardType:(id)kUTTypeJPEG];
}

- (NSData *)yy_JPEGData {
    return [self dataForPasteboardType:(id)kUTTypeJPEG];
}

- (void)setYy_GIFData:(NSData *)GIFData {
    [self setData:GIFData forPasteboardType:(id)kUTTypeGIF];
}

- (NSData *)yy_GIFData {
    return [self dataForPasteboardType:(id)kUTTypeGIF];
}

- (void)setYy_WEBPData:(NSData *)WEBPData {
    [self setData:WEBPData forPasteboardType:DGCYYTextUTTypeWEBP];
}

- (NSData *)yy_WEBPData {
    return [self dataForPasteboardType:DGCYYTextUTTypeWEBP];
}

- (void)setYy_ImageData:(NSData *)imageData {
    [self setData:imageData forPasteboardType:(id)kUTTypeImage];
}

- (NSData *)yy_ImageData {
    return [self dataForPasteboardType:(id)kUTTypeImage];
}

- (void)setYy_AttributedString:(NSAttributedString *)attributedString {
    self.string = [attributedString yy_plainTextForRange:NSMakeRange(0, attributedString.length)];
    NSData *data = [attributedString yy_archiveToData];
    if (data) {
        NSDictionary *item = @{DGCYYTextPasteboardTypeAttributedString : data};
        [self addItems:@[item]];
    }
    [attributedString enumerateAttribute:DGCYYTextAttachmentAttributeName inRange:NSMakeRange(0, attributedString.length) options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(DGCYYTextAttachment *attachment, NSRange range, BOOL *stop) {
        
        // save image
        UIImage *simpleImage = nil;
        if ([attachment.content isKindOfClass:[UIImage class]]) {
            simpleImage = attachment.content;
        } else if ([attachment.content isKindOfClass:[UIImageView class]]) {
            simpleImage = ((UIImageView *)attachment.content).image;
        }
        if (simpleImage) {
            NSDictionary *item = @{@"com.apple.uikit.image" : simpleImage};
            [self addItems:@[item]];
        }
        
#if DGCYYTextAnimatedImageAvailable
        // save animated image
        if ([attachment.content isKindOfClass:[UIImageView class]]) {
            UIImageView *imageView = attachment.content;
            Class aniImageClass = NSClassFromString(@"DGCYYImage");
            UIImage *image = imageView.image;
            if (aniImageClass && [image isKindOfClass:aniImageClass]) {
                NSData *data = [image valueForKey:@"animatedImageData"];
                NSNumber *type = [image valueForKey:@"animatedImageType"];
                if (data) {
                    switch (type.unsignedIntegerValue) {
                        case YYImageTypeGIF: {
                            NSDictionary *item = @{(id)kUTTypeGIF : data};
                            [self addItems:@[item]];
                        } break;
                        case YYImageTypePNG: { // APNG
                            NSDictionary *item = @{(id)kUTTypePNG : data};
                            [self addItems:@[item]];
                        } break;
                        case YYImageTypeWebP: {
                            NSDictionary *item = @{(id)DGCYYTextUTTypeWEBP : data};
                            [self addItems:@[item]];
                        } break;
                        default: break;
                    }
                }
            }
        }
#endif
        
    }];
}

- (NSAttributedString *)yy_AttributedString {
    for (NSDictionary *items in self.items) {
        NSData *data = items[DGCYYTextPasteboardTypeAttributedString];
        if (data) {
            return [NSAttributedString yy_unarchiveFromData:data];
        }
    }
    return nil;
}

@end
