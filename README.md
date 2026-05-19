DGCYYText
==============
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/ibireme/DGCYYText/master/LICENSE)&nbsp;
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/DGCYYText.svg?style=flat)](http://cocoapods.org/pods/DGCYYText)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/p/DGCYYText.svg?style=flat)](http://cocoadocs.org/docsets/DGCYYText)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;
[![Build Status](https://travis-ci.org/ibireme/DGCYYText.svg?branch=master)](https://travis-ci.org/ibireme/DGCYYText)

Powerful text framework for iOS to display and edit rich text.<br/>
(It's a component of [YYKit](https://github.com/ibireme/YYKit))


Features
==============

- UILabel and UITextView API compatible
- High performance asynchronous text layout and rendering
- Extended CoreText attributes with more text effects
- Text attachments with UIImage, UIView and CALayer
- Custom highlight text range to allow user interact with
- Text parser support (built in markdown/emoticon parser)
- Text container path and exclusion paths support
- Vertical form layout support (for CJK text)
- Image and attributed text copy/paste support
- Attributed text placeholder support
- Custom keyboard view support
- Undo and redo control
- Attributed text archiver and unarchiver support
- Multi-language and VoiceOver support
- Interface Builder support
- Fully documented


Architecture
==============
DGCYYText vs TextKit

<img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/architecture.png" width="400">


Text Attributes
==============

### DGCYYText supported attributes
<table>
  <thead>
    <tr>
      <th>Demo</th>
      <th>Attribute Name</th>
      <th>Class</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/DGCYYText Extended/DGCYYTextAttachment.gif" width="200"></td>
      <td>TextAttachment</td>
      <td>DGCYYTextAttachment</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/DGCYYText Extended/DGCYYTextHighlight.gif" width="200"></td>
      <td>TextHighlight</td>
      <td>DGCYYTextHighlight</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/DGCYYText Extended/DGCYYTextBinding.gif" width="200"></td>
      <td>TextBinding</td>
      <td>DGCYYTextBinding</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/DGCYYText Extended/DGCYYTextShadow.png" width="200"></td>
      <td>TextShadow<br/>TextInnerShadow</td>
      <td>DGCYYTextShadow</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/DGCYYText Extended/DGCYYTextBorder.png" width="200"></td>
      <td>TextBorder</td>
      <td>DGCYYTextBorder</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/DGCYYText Extended/DGCYYTextBackgroundBorder.png" width="200"></td>
      <td>TextBackgroundBorder</td>
      <td>DGCYYTextBorder</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/DGCYYText Extended/DGCYYTextBlockBorder.png" width="200"></td>
      <td>TextBlockBorder</td>
      <td>DGCYYTextBorder</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Obliqueness.png" width="200"></td>
      <td>TextGlyphTransform</td>
      <td> NSValue(CGAffineTransform)</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Underline.png" width="200"></td>
      <td>TextUnderline</td>
      <td>DGCYYTextDecoration</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Strikethrough.png" width="200"></td>
      <td>TextStrickthrough</td>
      <td>DGCYYTextDecoration</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/DGCYYText Extended/DGCYYTextBackedString.png" width="200"></td>
      <td>TextBackedString</td>
      <td>DGCYYTextBackedString</td>
    </tr>
  </tbody>
</table>

### CoreText attributes which is supported by DGCYYText
<table>
  <thead>
    <tr>
      <th>Demo</th>
      <th>Attribute Name</th>
      <th>Class</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Font.png" width="200"></td>
      <td> Font </td>
      <td>UIFont(CTFontRef)</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Kern.png" width="200"></td>
      <td> Kern </td>
      <td>NSNumber</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Stroke.png" width="200"></td>
      <td> StrokeWidth </td>
      <td> NSNumber </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/StrokeColor.png" width="200"></td>
      <td> StrokeColor </td>
      <td> CGColorRef </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Shadow.png" width="200"></td>
      <td> Shadow </td>
      <td> NSShadow </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Ligature.png" width="200"></td>
      <td> Ligature </td>
      <td> NSNumber </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/VerticalForms.png" width="200"></td>
      <td> VerticalGlyphForm </td>
      <td> NSNumber(BOOL) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/WriteDirection.png" width="200"></td>
      <td> WritingDirection </td>
      <td> NSArray(NSNumber) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/RunDelegate.png" width="200"></td>
      <td> RunDelegate </td>
      <td> CTRunDelegateRef </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/Alignment.png" width="200"></td>
      <td> TextAlignment </td>
      <td> NSParagraphStyle <br/>(NSTextAlignment) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/LineBreakMode.png" width="200"></td>
      <td> LineBreakMode </td>
      <td> NSParagraphStyle <br/>(NSLineBreakMode) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/LineSpacing.png" width="200"></td>
      <td> LineSpacing </td>
      <td> NSParagraphStyle <br/>(CGFloat) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/ParagraphSpacing.png" width="200"></td>
      <td> ParagraphSpacing <br/> ParagraphSpacingBefore </td>
      <td> NSParagraphStyle <br/>(CGFloat) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/FirstLineHeadIndent.png" width="200"></td>
      <td> FirstLineHeadIndent </td>
      <td> NSParagraphStyle <br/>(CGFloat) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/HeadIndent.png" width="200"></td>
      <td> HeadIndent </td>
      <td> NSParagraphStyle <br/>(CGFloat) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/TailIndent.png" width="200"></td>
      <td> TailIndent </td>
      <td> NSParagraphStyle <br/>(CGFloat) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/MinimumLineHeight.png" width="200"></td>
      <td> MinimumLineHeight </td>
      <td> NSParagraphStyle <br/>(CGFloat) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/MaximumLineHeight.png" width="200"></td>
      <td> MaximumLineHeight </td>
      <td> NSParagraphStyle <br/>(CGFloat) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/LineHeightMultiple.png" width="200"></td>
      <td> LineHeightMultiple </td>
      <td> NSParagraphStyle <br/>(CGFloat) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/BaseWritingDirection.png" width="200"></td>
      <td> BaseWritingDirection </td>
      <td> NSParagraphStyle <br/>(NSWritingDirection) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/Tab.png" width="200"></td>
      <td> DefaultTabInterval <br/> TabStops </td>
      <td> NSParagraphStyle <br/>CGFloat/NSArray(NSTextTab)</td>
    </tr>
  </tbody>
</table>


Usage
==============

### Basic
```objc
// YYLabel (similar to UILabel)
YYLabel *label = [YYLabel new];
label.frame = ...
label.font = ...
label.textColor = ...
label.textAlignment = ...
label.lineBreakMode = ...
label.numberOfLines = ...
label.text = ...
    
// DGCYYTextView (similar to UITextView)
DGCYYTextView *textView = [DGCYYTextView new];
textView.frame = ...
textView.font = ...
textView.textColor = ...
textView.dataDetectorTypes = ...
textView.placeHolderText = ...
textView.placeHolderTextColor = ...
textView.delegate = ...
```    

### Attributed text
```objc
// 1. Create an attributed string.
NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"Some Text, blabla..."];
    
// 2. Set attributes to text, you can use almost all CoreText attributes.
text.yy_font = [UIFont boldSystemFontOfSize:30];
text.yy_color = [UIColor blueColor];
[text yy_setColor:[UIColor redColor] range:NSMakeRange(0, 4)];
text.yy_lineSpacing = 10;
    
// 3. Set to YYLabel or DGCYYTextView.
YYLabel *label = [YYLabel new];
label.frame = ...
label.attributedString = text;
    
DGCYYTextView *textView = [DGCYYTextView new];
textView.frame = ...
textView.attributedString = text;
```

### Text highlight
    
You can use some convenience methods to set text highlight:
```objc
[text yy_setTextHighlightRange:range
                       color:[UIColor blueColor]
             backgroundColor:[UIColor grayColor]
                   tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){ 
                       NSLog(@"tap text range:..."); 
                   }];
```
Or set the text highlight with your custom config:
```objc
// 1. Create a 'highlight' attribute for text.
DGCYYTextBorder *border = [DGCYYTextBorder borderWithFillColor:[UIColor grayColor] cornerRadius:3];
   
DGCYYTextHighlight *highlight = [DGCYYTextHighlight new];
[highlight setColor:[UIColor whiteColor]];
[highlight setBackgroundBorder:highlightBorder];
highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
 NSLog(@"tap text range:..."); 
 // you can also set the action handler to YYLabel or DGCYYTextView.
};
    
// 2. Add 'highlight' attribute to a range of text.
[attributedText yy_setTextHighlight:highlight range:highlightRange];
    
// 3. Set text to label or text view.
YYLabel *label = ...
label.attributedText = attributedText
    
DGCYYTextView *textView = ...
textView.attributedText = ...
    
// 4. Receive user interactive action.
label.highlightTapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
   NSLog(@"tap text range:...");
};
label.highlightLongPressAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
   NSLog(@"long press text range:...");
};
    
@UITextViewDelegate
- (void)textView:(DGCYYTextView *)textView didTapHighlight:(DGCYYTextHighlight *)highlight inRange:(NSRange)characterRange rect:(CGRect)rect {
   NSLog(@"tap text range:...");
}
- (void)textView:(DGCYYTextView *)textView didLongPressHighlight:(DGCYYTextHighlight *)highlight inRange:(NSRange)characterRange rect:(CGRect)rect {
   NSLog(@"long press text range:...");
}
```

### Text attachments
```objc
NSMutableAttributedString *text = [NSMutableAttributedString new];
UIFont *font = [UIFont systemFontOfSize:16];
NSMutableAttributedString *attachment = nil;
	
// UIImage attachment
UIImage *image = [UIImage imageNamed:@"dribbble64_imageio"];
attachment = [NSMutableAttributedString yy_attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:image.size alignToFont:font alignment:DGCYYTextVerticalAlignmentCenter];
[text appendAttributedString: attachment];
	
// UIView attachment
UISwitch *switcher = [UISwitch new];
[switcher sizeToFit];
attachment = [NSMutableAttributedString yy_attachmentStringWithContent:switcher contentMode:UIViewContentModeBottom attachmentSize:switcher.size alignToFont:font alignment:DGCYYTextVerticalAlignmentCenter];
[text appendAttributedString: attachment];
	
// CALayer attachment
CASharpLayer *layer = [CASharpLayer layer];
layer.path = ...
attachment = [NSMutableAttributedString yy_attachmentStringWithContent:layer contentMode:UIViewContentModeBottom attachmentSize:switcher.size alignToFont:font alignment:DGCYYTextVerticalAlignmentCenter];
[text appendAttributedString: attachment];
```

### Text layout calculation
```objc
NSAttributedString *text = ...
CGSize size = CGSizeMake(100, CGFLOAT_MAX);
DGCYYTextLayout *layout = [DGCYYTextLayout layoutWithContainerSize:size text:text];
	
// get text bounding
layout.textBoundingRect; // get bounding rect
layout.textBoundingSize; // get bounding size
	
 // query text layout
[layout lineIndexForPoint:CGPointMake(10,10)];
[layout closestLineIndexForPoint:CGPointMake(10,10)];
[layout closestPositionToPoint:CGPointMake(10,10)];
[layout textRangeAtPoint:CGPointMake(10,10)];
[layout rectForRange:[DGCYYTextRange rangeWithRange:NSMakeRange(10,2)]];
[layout selectionRectsForRange:[DGCYYTextRange rangeWithRange:NSMakeRange(10,2)]];
	
// text layout display
YYLabel *label = [YYLabel new];
label.size = layout.textBoundingSize;
label.textLayout = layout;
```

### Adjust text line position
```objc
// Convenience methods:
// 1. Create a text line position modifier, implements `DGCYYTextLinePositionModifier` protocol.
// 2. Set it to label or text view.
	
DGCYYTextLinePositionSimpleModifier *modifier = [DGCYYTextLinePositionSimpleModifier new];
modifier.fixedLineHeight = 24;
	
YYLabel *label = [YYLabel new];
label.linePositionModifier = modifier;
	
// Fully control
DGCYYTextLinePositionSimpleModifier *modifier = [DGCYYTextLinePositionSimpleModifier new];
modifier.fixedLineHeight = 24;
	
DGCYYTextContainer *container = [DGCYYTextContainer new];
container.size = CGSizeMake(100, CGFLOAT_MAX);
container.linePositionModifier = modifier;
	
DGCYYTextLayout *layout = [DGCYYTextLayout layoutWithContainer:container text:text];
YYLabel *label = [YYLabel new];
label.size = layout.textBoundingSize;
label.textLayout = layout;
```	
	
### Asynchronous layout and rendering
```objc
// If you have performance issues,
// you may enable the asynchronous display mode.
YYLabel *label = ...
label.displaysAsynchronously = YES;
    
// If you want to get the highest performance, you should do 
// text layout with `DGCYYTextLayout` class in background thread.
YYLabel *label = [YYLabel new];
label.displaysAsynchronously = YES;
label.ignoreCommonProperties = YES;
    
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
   // Create attributed string.
   NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"Some Text"];
   text.yy_font = [UIFont systemFontOfSize:16];
   text.yy_color = [UIColor grayColor];
   [text yy_setColor:[UIColor redColor] range:NSMakeRange(0, 4)];
 	
   // Create text container
   DGCYYTextContainer *container = [DGCYYTextContainer new];
   container.size = CGSizeMake(100, CGFLOAT_MAX);
   container.maximumNumberOfRows = 0;
   
   // Generate a text layout.
   DGCYYTextLayout *layout = [DGCYYTextLayout layoutWithContainer:container text:text];
   
   dispatch_async(dispatch_get_main_queue(), ^{
       label.size = layout.textBoundingSize;
       label.textLayout = layout;
   });
});
```

### Text container control
```objc
YYLabel *label = ...
label.textContainerPath = [UIBezierPath bezierPathWith...];
label.exclusionPaths = 	@[[UIBezierPath bezierPathWith...];,...];
label.textContainerInset = UIEdgeInsetsMake(...);
label.verticalForm = YES/NO;
    
DGCYYTextView *textView = ...
textView.exclusionPaths = 	@[[UIBezierPath bezierPathWith...];,...];
textView.textContainerInset = UIEdgeInsetsMake(...);
textView.verticalForm = YES/NO;
```
   
### Text parser
```objc
// 1. Create a text parser
	
DGCYYTextSimpleEmoticonParser *parser = [DGCYYTextSimpleEmoticonParser new];
NSMutableDictionary *mapper = [NSMutableDictionary new];
mapper[@":smile:"] = [UIImage imageNamed:@"smile.png"];
mapper[@":cool:"] = [UIImage imageNamed:@"cool.png"];
mapper[@":cry:"] = [UIImage imageNamed:@"cry.png"];
mapper[@":wink:"] = [UIImage imageNamed:@"wink.png"];
parser.emoticonMapper = mapper;
	
DGCYYTextSimpleMarkdownParser *parser = [DGCYYTextSimpleMarkdownParser new];
[parser setColorWithDarkTheme];
    
MyCustomParser *parser = ... // custom parser
    
// 2. Attach parser to label or text view
YYLabel *label = ...
label.textParser = parser;
    
DGCYYTextView *textView = ...
textView.textParser = parser;
```
  
### Debug
```objc
// Set a shared debug option to show text layout result.
DGCYYTextDebugOption *debugOptions = [DGCYYTextDebugOption new];
debugOptions.baselineColor = [UIColor redColor];
debugOptions.CTFrameBorderColor = [UIColor redColor];
debugOptions.CTLineFillColor = [UIColor colorWithRed:0.000 green:0.463 blue:1.000 alpha:0.180];
debugOptions.CGGlyphBorderColor = [UIColor colorWithRed:1.000 green:0.524 blue:0.000 alpha:0.200];
[DGCYYTextDebugOption setSharedDebugOption:debugOptions];
```

### More examples
See `Demo/DGCYYTextDemo.xcodeproj` for more examples:

<img src="https://raw.github.com/ibireme/DGCYYText/master/Demo/DemoSnapshot/text_path.gif" width="320">
<img src="https://raw.github.com/ibireme/DGCYYText/master/Demo/DemoSnapshot/text_markdown.gif" width="320">
<br/> <br/>
<img src="https://raw.github.com/ibireme/DGCYYText/master/Demo/DemoSnapshot/text_vertical.gif" width="320">
<img src="https://raw.github.com/ibireme/DGCYYText/master/Demo/DemoSnapshot/text_paste.gif" width="320">


Installation
==============

### CocoaPods

1. Add `pod 'DGCYYText'` to your Podfile.
2. Run `pod install` or `pod update`.
3. Import \<DGCYYText/DGCYYText.h\>.


### Carthage

1. Add `github "ibireme/DGCYYText"` to your Cartfile.
2. Run `carthage update --platform ios` and add the framework to your project.
3. Import \<DGCYYText/DGCYYText.h\>.


### Manually

1. Download all the files in the `DGCYYText` subdirectory.
2. Add the source files to your Xcode project.
3. Link with required frameworks:
    * UIKit
    * CoreFoundation
    * CoreText
    * QuartzCore
    * Accelerate
    * MobileCoreServices
4. Import `DGCYYText.h`.


### Notice
You may add [YYImage](https://github.com/ibireme/YYImage) or [YYWebImage](https://github.com/ibireme/YYWebImage) to your project if you want to support animated image (GIF/APNG/WebP).


Documentation
==============
Full API documentation is available on [CocoaDocs](http://cocoadocs.org/docsets/DGCYYText/).<br/>
You can also install documentation locally using [appledoc](https://github.com/tomaz/appledoc).


Requirements
==============
This library requires `iOS 6.0+` and `Xcode 8.0+`.


License
==============
DGCYYText is released under the MIT license. See LICENSE file for details.


<br/><br/>
---
中文介绍
==============
功能强大的 iOS 富文本编辑与显示框架。<br/>
(该项目是 [YYKit](https://github.com/ibireme/YYKit) 组件之一)


特性
==============
- API 兼容 UILabel 和 UITextView
- 支持高性能的异步排版和渲染
- 扩展了 CoreText 的属性以支持更多文字效果
- 支持 UIImage、UIView、CALayer 作为图文混排元素
- 支持添加自定义样式的、可点击的文本高亮范围
- 支持自定义文本解析 (内置简单的 Markdown/表情解析)
- 支持文本容器路径、内部留空路径的控制
- 支持文字竖排版，可用于编辑和显示中日韩文本
- 支持图片和富文本的复制粘贴
- 文本编辑时，支持富文本占位符
- 支持自定义键盘视图
- 撤销和重做次数的控制
- 富文本的序列化与反序列化支持
- 支持多语言，支持 VoiceOver
- 支持 Interface Builder
- 全部代码都有文档注释


架构
==============
DGCYYText 和 TextKit 架构对比

<img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/architecture.png" width="400">


文本属性
==============

### DGCYYText 原生支持的属性
<table>
  <thead>
    <tr>
      <th>Demo</th>
      <th>Attribute Name</th>
      <th>Class</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/DGCYYText Extended/DGCYYTextAttachment.gif" width="200"></td>
      <td>TextAttachment</td>
      <td>DGCYYTextAttachment</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/DGCYYText Extended/DGCYYTextHighlight.gif" width="200"></td>
      <td>TextHighlight</td>
      <td>DGCYYTextHighlight</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/DGCYYText Extended/DGCYYTextBinding.gif" width="200"></td>
      <td>TextBinding</td>
      <td>DGCYYTextBinding</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/DGCYYText Extended/DGCYYTextShadow.png" width="200"></td>
      <td>TextShadow<br/>TextInnerShadow</td>
      <td>DGCYYTextShadow</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/DGCYYText Extended/DGCYYTextBorder.png" width="200"></td>
      <td>TextBorder</td>
      <td>DGCYYTextBorder</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/DGCYYText Extended/DGCYYTextBackgroundBorder.png" width="200"></td>
      <td>TextBackgroundBorder</td>
      <td>DGCYYTextBorder</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/DGCYYText Extended/DGCYYTextBlockBorder.png" width="200"></td>
      <td>TextBlockBorder</td>
      <td>DGCYYTextBorder</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Obliqueness.png" width="200"></td>
      <td>TextGlyphTransform</td>
      <td> NSValue(CGAffineTransform)</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Underline.png" width="200"></td>
      <td>TextUnderline</td>
      <td>DGCYYTextDecoration</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Strikethrough.png" width="200"></td>
      <td>TextStrickthrough</td>
      <td>DGCYYTextDecoration</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/DGCYYText Extended/DGCYYTextBackedString.png" width="200"></td>
      <td>TextBackedString</td>
      <td>DGCYYTextBackedString</td>
    </tr>
  </tbody>
</table>

### DGCYYText 支持的 CoreText 属性
<table>
  <thead>
    <tr>
      <th>Demo</th>
      <th>Attribute Name</th>
      <th>Class</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Font.png" width="200"></td>
      <td> Font </td>
      <td>UIFont(CTFontRef)</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Kern.png" width="200"></td>
      <td> Kern </td>
      <td>NSNumber</td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Stroke.png" width="200"></td>
      <td> StrokeWidth </td>
      <td> NSNumber </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/StrokeColor.png" width="200"></td>
      <td> StrokeColor </td>
      <td> CGColorRef </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Shadow.png" width="200"></td>
      <td> Shadow </td>
      <td> NSShadow </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Ligature.png" width="200"></td>
      <td> Ligature </td>
      <td> NSNumber </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/VerticalForms.png" width="200"></td>
      <td> VerticalGlyphForm </td>
      <td> NSNumber(BOOL) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/WriteDirection.png" width="200"></td>
      <td> WritingDirection </td>
      <td> NSArray(NSNumber) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/RunDelegate.png" width="200"></td>
      <td> RunDelegate </td>
      <td> CTRunDelegateRef </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/Alignment.png" width="200"></td>
      <td> TextAlignment </td>
      <td> NSParagraphStyle <br/>(NSTextAlignment) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/LineBreakMode.png" width="200"></td>
      <td> LineBreakMode </td>
      <td> NSParagraphStyle <br/>(NSLineBreakMode) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/LineSpacing.png" width="200"></td>
      <td> LineSpacing </td>
      <td> NSParagraphStyle <br/>(CGFloat) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/ParagraphSpacing.png" width="200"></td>
      <td> ParagraphSpacing <br/> ParagraphSpacingBefore </td>
      <td> NSParagraphStyle <br/>(CGFloat) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/FirstLineHeadIndent.png" width="200"></td>
      <td> FirstLineHeadIndent </td>
      <td> NSParagraphStyle <br/>(CGFloat) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/HeadIndent.png" width="200"></td>
      <td> HeadIndent </td>
      <td> NSParagraphStyle <br/>(CGFloat) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/TailIndent.png" width="200"></td>
      <td> TailIndent </td>
      <td> NSParagraphStyle <br/>(CGFloat) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/MinimumLineHeight.png" width="200"></td>
      <td> MinimumLineHeight </td>
      <td> NSParagraphStyle <br/>(CGFloat) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/MaximumLineHeight.png" width="200"></td>
      <td> MaximumLineHeight </td>
      <td> NSParagraphStyle <br/>(CGFloat) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/LineHeightMultiple.png" width="200"></td>
      <td> LineHeightMultiple </td>
      <td> NSParagraphStyle <br/>(CGFloat) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/BaseWritingDirection.png" width="200"></td>
      <td> BaseWritingDirection </td>
      <td> NSParagraphStyle <br/>(NSWritingDirection) </td>
    </tr>
    <tr>
      <td><img src="https://raw.github.com/ibireme/DGCYYText/master/Attributes/CoreText and TextKit/Paragraph/Tab.png" width="200"></td>
      <td> DefaultTabInterval <br/> TabStops </td>
      <td> NSParagraphStyle <br/>CGFloat/NSArray(NSTextTab)</td>
    </tr>
  </tbody>
</table>


用法
==============

### 基本用法
```objc
// YYLabel (和 UILabel 用法一致)
YYLabel *label = [YYLabel new];
label.frame = ...
label.font = ...
label.textColor = ...
label.textAlignment = ...
label.lineBreakMode = ...
label.numberOfLines = ...
label.text = ...
    
// DGCYYTextView (和 UITextView 用法一致)
DGCYYTextView *textView = [DGCYYTextView new];
textView.frame = ...
textView.font = ...
textView.textColor = ...
textView.dataDetectorTypes = ...
textView.placeHolderText = ...
textView.placeHolderTextColor = ...
textView.delegate = ...
```    

### 属性文本
```objc
// 1. 创建一个属性文本
NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"Some Text, blabla..."];
    
// 2. 为文本设置属性
text.yy_font = [UIFont boldSystemFontOfSize:30];
text.yy_color = [UIColor blueColor];
[text yy_setColor:[UIColor redColor] range:NSMakeRange(0, 4)];
text.yy_lineSpacing = 10;
    
// 3. 赋值到 YYLabel 或 DGCYYTextView
YYLabel *label = [YYLabel new];
label.frame = ...
label.attributedString = text;
    
DGCYYTextView *textView = [DGCYYTextView new];
textView.frame = ...
textView.attributedString = text;
```   

### 文本高亮

你可以用一些已经封装好的简便方法来设置文本高亮：
```objc
[text yy_setTextHighlightRange:range
                       color:[UIColor blueColor]
             backgroundColor:[UIColor grayColor]
                   tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){ 
                       NSLog(@"tap text range:..."); 
                   }];
```
或者用更复杂的办法来调节文本高亮的细节：
```objc
// 1. 创建一个"高亮"属性，当用户点击了高亮区域的文本时，"高亮"属性会替换掉原本的属性
DGCYYTextBorder *border = [DGCYYTextBorder borderWithFillColor:[UIColor grayColor] cornerRadius:3];
   
DGCYYTextHighlight *highlight = [DGCYYTextHighlight new];
[highlight setColor:[UIColor whiteColor]];
[highlight setBackgroundBorder:highlightBorder];
highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
 NSLog(@"tap text range:..."); 
 // 你也可以把事件回调放到 YYLabel 和 DGCYYTextView 来处理。
};
    
// 2. 把"高亮"属性设置到某个文本范围
[attributedText yy_setTextHighlight:highlight range:highlightRange];
    
// 3. 把属性文本设置到 YYLabel 或 DGCYYTextView
YYLabel *label = ...
label.attributedText = attributedText
    
DGCYYTextView *textView = ...
textView.attributedText = ...
    
// 4. 接受事件回调
label.highlightTapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
   NSLog(@"tap text range:...");
};
label.highlightLongPressAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
   NSLog(@"long press text range:...");
};
    
@UITextViewDelegate
- (void)textView:(DGCYYTextView *)textView didTapHighlight:(DGCYYTextHighlight *)highlight inRange:(NSRange)characterRange rect:(CGRect)rect {
   NSLog(@"tap text range:...");
}
- (void)textView:(DGCYYTextView *)textView didLongPressHighlight:(DGCYYTextHighlight *)highlight inRange:(NSRange)characterRange rect:(CGRect)rect {
   NSLog(@"long press text range:...");
}
```

### 图文混排
```objc
NSMutableAttributedString *text = [NSMutableAttributedString new];
UIFont *font = [UIFont systemFontOfSize:16];
NSMutableAttributedString *attachment = nil;
	
// 嵌入 UIImage
UIImage *image = [UIImage imageNamed:@"dribbble64_imageio"];
attachment = [NSMutableAttributedString yy_attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:image.size alignToFont:font alignment:DGCYYTextVerticalAlignmentCenter];
[text appendAttributedString: attachment];
	
// 嵌入 UIView
UISwitch *switcher = [UISwitch new];
[switcher sizeToFit];
attachment = [NSMutableAttributedString yy_attachmentStringWithContent:switcher contentMode:UIViewContentModeBottom attachmentSize:switcher.size alignToFont:font alignment:DGCYYTextVerticalAlignmentCenter];
[text appendAttributedString: attachment];
	
// 嵌入 CALayer
CASharpLayer *layer = [CASharpLayer layer];
layer.path = ...
attachment = [NSMutableAttributedString yy_attachmentStringWithContent:layer contentMode:UIViewContentModeBottom attachmentSize:switcher.size alignToFont:font alignment:DGCYYTextVerticalAlignmentCenter];
[text appendAttributedString: attachment];
```

### 文本布局计算
```objc
NSAttributedString *text = ...
CGSize size = CGSizeMake(100, CGFLOAT_MAX);
DGCYYTextLayout *layout = [DGCYYTextLayout layoutWithContainerSize:size text:text];
	
// 获取文本显示位置和大小
layout.textBoundingRect; // get bounding rect
layout.textBoundingSize; // get bounding size
	
 // 查询文本排版结果
[layout lineIndexForPoint:CGPointMake(10,10)];
[layout closestLineIndexForPoint:CGPointMake(10,10)];
[layout closestPositionToPoint:CGPointMake(10,10)];
[layout textRangeAtPoint:CGPointMake(10,10)];
[layout rectForRange:[DGCYYTextRange rangeWithRange:NSMakeRange(10,2)]];
[layout selectionRectsForRange:[DGCYYTextRange rangeWithRange:NSMakeRange(10,2)]];
	
// 显示文本排版结果
YYLabel *label = [YYLabel new];
label.size = layout.textBoundingSize;
label.textLayout = layout;
```
	
### 文本行位置调整
```objc
// 由于中文、英文、Emoji 等字体高度不一致，或者富文本中出现了不同字号的字体，
// 可能会造成每行文字的高度不一致。这里可以添加一个修改器来实现固定行高，或者自定义文本行位置。
  
// 简单的方法:
// 1. 创建一个文本行位置修改类，实现 `DGCYYTextLinePositionModifier` 协议。
// 2. 设置到 Label 或 TextView。
	
DGCYYTextLinePositionSimpleModifier *modifier = [DGCYYTextLinePositionSimpleModifier new];
modifier.fixedLineHeight = 24;
	
YYLabel *label = [YYLabel new];
label.linePositionModifier = modifier;
	
// 完全控制:
DGCYYTextLinePositionSimpleModifier *modifier = [DGCYYTextLinePositionSimpleModifier new];
modifier.fixedLineHeight = 24;
	
DGCYYTextContainer *container = [DGCYYTextContainer new];
container.size = CGSizeMake(100, CGFLOAT_MAX);
container.linePositionModifier = modifier;
	
DGCYYTextLayout *layout = [DGCYYTextLayout layoutWithContainer:container text:text];
YYLabel *label = [YYLabel new];
label.size = layout.textBoundingSize;
label.textLayout = layout;
```

### 异步排版和渲染
```objc  
// 如果你在显示字符串时有性能问题，可以这样开启异步模式：
YYLabel *label = ...
label.displaysAsynchronously = YES;
    
// 如果需要获得最高的性能，你可以在后台线程用 `DGCYYTextLayout` 进行预排版： 
YYLabel *label = [YYLabel new];
label.displaysAsynchronously = YES; //开启异步绘制
label.ignoreCommonProperties = YES; //忽略除了 textLayout 之外的其他属性
    
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
   // 创建属性字符串
   NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"Some Text"];
   text.yy_font = [UIFont systemFontOfSize:16];
   text.yy_color = [UIColor grayColor];
   [text yy_setColor:[UIColor redColor] range:NSMakeRange(0, 4)];
 
   // 创建文本容器
   DGCYYTextContainer *container = [DGCYYTextContainer new];
   container.size = CGSizeMake(100, CGFLOAT_MAX);
   container.maximumNumberOfRows = 0;
   
   // 生成排版结果
   DGCYYTextLayout *layout = [DGCYYTextLayout layoutWithContainer:container text:text];
   
   dispatch_async(dispatch_get_main_queue(), ^{
       label.size = layout.textBoundingSize;
       label.textLayout = layout;
   });
});
```

### 文本容器控制
```objc
YYLabel *label = ...
label.textContainerPath = [UIBezierPath bezierPathWith...];
label.exclusionPaths = 	@[[UIBezierPath bezierPathWith...];,...];
label.textContainerInset = UIEdgeInsetsMake(...);
label.verticalForm = YES/NO;
    
DGCYYTextView *textView = ...
textView.exclusionPaths = 	@[[UIBezierPath bezierPathWith...];,...];
textView.textContainerInset = UIEdgeInsetsMake(...);
textView.verticalForm = YES/NO;
```    

### 文本解析
```objc
// 1. 创建一个解析器
	
// 内置简单的表情解析
DGCYYTextSimpleEmoticonParser *parser = [DGCYYTextSimpleEmoticonParser new];
NSMutableDictionary *mapper = [NSMutableDictionary new];
mapper[@":smile:"] = [UIImage imageNamed:@"smile.png"];
mapper[@":cool:"] = [UIImage imageNamed:@"cool.png"];
mapper[@":cry:"] = [UIImage imageNamed:@"cry.png"];
mapper[@":wink:"] = [UIImage imageNamed:@"wink.png"];
parser.emoticonMapper = mapper;
	
// 内置简单的 markdown 解析
DGCYYTextSimpleMarkdownParser *parser = [DGCYYTextSimpleMarkdownParser new];
[parser setColorWithDarkTheme];
    
// 实现 `DGCYYTextParser` 协议的自定义解析器
MyCustomParser *parser = ... 
    
// 2. 把解析器添加到 YYLabel 或 DGCYYTextView
YYLabel *label = ...
label.textParser = parser;
    
DGCYYTextView *textView = ...
textView.textParser = parser;
```

### Debug
```objc
// 设置一个全局的 debug option 来显示排版结果。
DGCYYTextDebugOption *debugOptions = [DGCYYTextDebugOption new];
debugOptions.baselineColor = [UIColor redColor];
debugOptions.CTFrameBorderColor = [UIColor redColor];
debugOptions.CTLineFillColor = [UIColor colorWithRed:0.000 green:0.463 blue:1.000 alpha:0.180];
debugOptions.CGGlyphBorderColor = [UIColor colorWithRed:1.000 green:0.524 blue:0.000 alpha:0.200];
[DGCYYTextDebugOption setSharedDebugOption:debugOptions];
```

### 更多示例
查看演示工程 `Demo/DGCYYTextDemo.xcodeproj`:

<img src="https://raw.github.com/ibireme/DGCYYText/master/Demo/DemoSnapshot/text_path.gif" width="320">
<img src="https://raw.github.com/ibireme/DGCYYText/master/Demo/DemoSnapshot/text_markdown.gif" width="320">
<br/> <br/>
<img src="https://raw.github.com/ibireme/DGCYYText/master/Demo/DemoSnapshot/text_vertical.gif" width="320">
<img src="https://raw.github.com/ibireme/DGCYYText/master/Demo/DemoSnapshot/text_paste.gif" width="320">


安装
==============

### CocoaPods

1. 在 Podfile 中添加 `pod 'DGCYYText'`。
2. 执行 `pod install` 或 `pod update`。
3. 导入 \<DGCYYText/DGCYYText.h\>。


### Carthage

1. 在 Cartfile 中添加 `github "ibireme/DGCYYText"`。
2. 执行 `carthage update --platform ios` 并将生成的 framework 添加到你的工程。
3. 导入 \<DGCYYText/DGCYYText.h\>。


### 手动安装

1. 下载 DGCYYText 文件夹内的所有内容。
2. 将 DGCYYText 内的源文件添加(拖放)到你的工程。
3. 链接以下 frameworks:
    * UIKit
    * CoreFoundation
    * CoreText
    * QuartzCore
    * Accelerate
    * MobileCoreServices
4. 导入 `DGCYYText.h`。


### 注意
你可以添加 [YYImage](https://github.com/ibireme/YYImage) 或 [YYWebImage](https://github.com/ibireme/YYWebImage) 到你的工程，以支持动画格式(GIF/APNG/WebP)的图片。


文档
==============
你可以在 [CocoaDocs](http://cocoadocs.org/docsets/DGCYYText/) 查看在线 API 文档，也可以用 [appledoc](https://github.com/tomaz/appledoc) 本地生成文档。


系统要求
==============
该项目最低支持 `iOS 6.0` 和 `Xcode 8.0`。


已知问题
==============
* DGCYYText 并不能支持所有 CoreText/TextKit 的属性，比如 NSBackgroundColor、NSStrikethrough、NSUnderline、NSAttachment、NSLink 等，但 DGCYYText 中基本都有对应属性作为替代。详情见上方表格。
* DGCYYTextView 未实现局部刷新，所以在输入和编辑大量的文本（比如超过大概五千个汉字、或大概一万个英文字符）时会出现较明显的卡顿现象。
* 竖排版时，添加 exclusionPaths 在少数情况下可能会导致文本显示空白。
* 当添加了非矩形的 textContainerPath，并且有嵌入大于文本排版方向宽度的 RunDelegate 时，RunDelegate 之后的文字会无法显示。这是 CoreText 的 Bug（或者说是 Feature）。

许可证
==============
DGCYYText 使用 MIT 许可证，详情见 LICENSE 文件。


