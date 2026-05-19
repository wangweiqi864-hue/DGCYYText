//
//  DGCYYText.h
//  DGCYYText <https://github.com/ibireme/DGCYYText>
//
//  Created by ibireme on 15/2/25.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>

#if __has_include(<DGCYYText/DGCYYText.h>)
FOUNDATION_EXPORT double DGCYYTextVersionNumber;
FOUNDATION_EXPORT const unsigned char DGCYYTextVersionString[];
#import <DGCYYText/DGCYYLabel.h>
#import <DGCYYText/DGCYYTextView.h>
#import <DGCYYText/DGCYYTextAttribute.h>
#import <DGCYYText/DGCYYTextArchiver.h>
#import <DGCYYText/DGCYYTextRunDelegate.h>
#import <DGCYYText/DGCYYTextRubyAnnotation.h>
#import <DGCYYText/DGCYYTextLayout.h>
#import <DGCYYText/DGCYYTextLine.h>
#import <DGCYYText/DGCYYTextInput.h>
#import <DGCYYText/DGCYYTextDebugOption.h>
#import <DGCYYText/DGCYYTextKeyboardManager.h>
#import <DGCYYText/DGCYYTextUtilities.h>
#import <DGCYYText/NSAttributedString+DGCYYText.h>
#import <DGCYYText/NSParagraphStyle+DGCYYText.h>
#import <DGCYYText/UIPasteboard+DGCYYText.h>
#else
#import "DGCYYLabel.h"
#import "DGCYYTextView.h"
#import "DGCYYTextAttribute.h"
#import "DGCYYTextArchiver.h"
#import "DGCYYTextRunDelegate.h"
#import "DGCYYTextRubyAnnotation.h"
#import "DGCYYTextLayout.h"
#import "DGCYYTextLine.h"
#import "DGCYYTextInput.h"
#import "DGCYYTextDebugOption.h"
#import "DGCYYTextKeyboardManager.h"
#import "DGCYYTextUtilities.h"
#import "NSAttributedString+DGCYYText.h"
#import "NSParagraphStyle+DGCYYText.h"
#import "UIPasteboard+DGCYYText.h"
#endif
