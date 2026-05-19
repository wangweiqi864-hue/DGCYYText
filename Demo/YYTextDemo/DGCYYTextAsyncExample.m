//
//  DGCYYTextAsyncExample.m
//  YYKitExample
//
//  Created by ibireme on 15/9/3.
//  Copyright (c) 2015 ibireme. All rights reserved.
//

#import "DGCYYTextAsyncExample.h"
#import "DGCYYText.h"
#import "DGCYYImage.h"
#import "UIImage+YYWebImage.h"
#import "UIView+YYAdd.h"
#import "NSBundle+YYAdd.h"
#import "NSString+YYAdd.h"
#import "CALayer+YYAdd.h"
#import "UIControl+YYAdd.h"
#import "DGCYYTextExampleHelper.h"
#import "DGCYYFPSLabel.h"

#define kCellHeight 34

@interface DGCYYTextAsyncExampleCell : UITableViewCell
@property (nonatomic, assign) BOOL async;
- (void)setAyncText:(NSAttributedString *)text;
@end


@implementation DGCYYTextAsyncExampleCell {
    UILabel *_dgc_uiLabel;
    DGCYYLabel *_dgc_yyLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _dgc_uiLabel = [UILabel new];
    _dgc_uiLabel.font = [UIFont systemFontOfSize:8];
    _dgc_uiLabel.numberOfLines = 0;
    _dgc_uiLabel.size = CGSizeMake(kScreenWidth, kCellHeight);
    
    _dgc_yyLabel = [DGCYYLabel new];
    _dgc_yyLabel.font = _dgc_uiLabel.font;
    _dgc_yyLabel.numberOfLines = _dgc_uiLabel.numberOfLines;
    _dgc_yyLabel.size = _dgc_uiLabel.size;
    _dgc_yyLabel.displaysAsynchronously = YES; /// enable async display
    _dgc_yyLabel.hidden = YES;
    
    [self.contentView addSubview:_dgc_uiLabel];
    [self.contentView addSubview:_dgc_yyLabel];
    return self;
}

- (void)setAsync:(BOOL)async {
    if (_async == async) return;
    _async = async;
    _dgc_uiLabel.hidden = async;
    _dgc_yyLabel.hidden = !async;
}

- (void)setAyncText:(id)text {
    if (_async) {
        _dgc_yyLabel.layer.contents = nil;
        _dgc_yyLabel.textLayout = text;
    } else {
        _dgc_uiLabel.attributedText = text;
    }
}

@end


@interface DGCYYTextAsyncExample () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign) BOOL async;
@property (nonatomic, strong) NSArray *strings;
@property (nonatomic, strong) NSArray *layouts;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation DGCYYTextAsyncExample

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [UITableView new];
    self.tableView.frame = self.view.bounds;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[DGCYYTextAsyncExampleCell class] forCellReuseIdentifier:@"id"];
    [self.view addSubview:self.tableView];
    
    
    
    NSMutableArray *strings = [NSMutableArray new];
    NSMutableArray *layouts = [NSMutableArray new];
    for (int i = 0; i < 300; i++) {
        NSString *str = [NSString stringWithFormat:@"%d Async Display Test ✺◟(∗❛ัᴗ❛ั∗)◞✺ ✺◟(∗❛ัᴗ❛ั∗)◞✺ 😀😖😐😣😡🚖🚌🚋🎊💖💗💛💙🏨🏦🏫 Async Display Test ✺◟(∗❛ัᴗ❛ั∗)◞✺ ✺◟(∗❛ัᴗ❛ั∗)◞✺ 😀😖😐😣😡🚖🚌🚋🎊💖💗💛💙🏨🏦🏫",i];
        
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:str];
        text.yy_font = [UIFont systemFontOfSize:10];
        text.yy_lineSpacing = 0;
        text.yy_strokeWidth = @(-3);
        text.yy_strokeColor = [UIColor redColor];
        text.yy_lineHeightMultiple = 1;
        text.yy_maximumLineHeight = 12;
        text.yy_minimumLineHeight = 12;
        
        NSShadow *shadow = [NSShadow new];
        shadow.shadowBlurRadius = 1;
        shadow.shadowColor = [UIColor redColor];
        shadow.shadowOffset = CGSizeMake(0, 1);
        [strings addObject:text];
        
        // it better to do layout in background queue...
        DGCYYTextContainer *container = [DGCYYTextContainer containerWithSize:CGSizeMake(kScreenWidth, kCellHeight)];
        DGCYYTextLayout *layout = [DGCYYTextLayout layoutWithContainer:container text:text];
        [layouts addObject:layout];
    }
    self.strings = strings;
    self.layouts = layouts;
    
    
    
    UIView *toolbar;
    if ([UIVisualEffectView class]) {
        toolbar = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
    } else {
        toolbar = [UIToolbar new];
    }
    toolbar.size = CGSizeMake(kScreenWidth, 40);
    toolbar.top = kiOS7Later ? 64 : 0;
    [self.view addSubview:toolbar];
    
    
    DGCYYFPSLabel *fps = [DGCYYFPSLabel new];
    fps.centerY = toolbar.height / 2;
    fps.left = 5;
    [toolbar addSubview:fps];
    
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"UILabel/DGCYYLabel(Async): ";
    label.font = [UIFont systemFontOfSize:14];
    [label sizeToFit];
    label.centerY = toolbar.height / 2;
    label.left = fps.right + 10;
    [toolbar addSubview:label];
    
    UISwitch *switcher = [UISwitch new];
    [switcher sizeToFit];
    switcher.centerY = toolbar.height / 2;
    switcher.left = label.right + (kiOS7Later ? 10 : -10);
    switcher.layer.transformScale = 0.7;
    __weak typeof(self) _self = self;
    [switcher addBlockForControlEvents:UIControlEventValueChanged block:^(UISwitch *switcher) {
        typeof(_self) self = _self;
        if (!self) return;
        [self setAsync:switcher.isOn];
    }];
    [toolbar addSubview:switcher];
}

- (void)setAsync:(BOOL)async {
    _async = async;
    [self.tableView.visibleCells enumerateObjectsUsingBlock:^(DGCYYTextAsyncExampleCell *cell, NSUInteger idx, BOOL *stop) {
        cell.async = async;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        if (_async) {
            [cell setAyncText:_layouts[indexPath.row]];
        } else {
            [cell setAyncText:_strings[indexPath.row]];
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _strings.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kCellHeight;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DGCYYTextAsyncExampleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id" forIndexPath:indexPath];
    
    cell.async = _async;
    if (_async) {
        [cell setAyncText:_layouts[indexPath.row]];
    } else {
        [cell setAyncText:_strings[indexPath.row]];
    }
    
    return cell;
}

@end
