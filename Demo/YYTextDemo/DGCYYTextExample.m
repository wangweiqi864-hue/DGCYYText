//
//  DGCYYTextExample.m
//  YYKitExample
//
//  Created by ibireme on 15/7/18.
//  Copyright (c) 2015 ibireme. All rights reserved.
//

#import "DGCYYTextExample.h"
#import <time.h>
#import "DGCYYText.h"
#import "DGCYYTextDemo-Swift.h"

@interface DGCYYTextExample()
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;
@end

@implementation DGCYYTextExample

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"✎      DGCYYText Demo       ✎";
    self.titles = @[].mutableCopy;
    self.classNames = @[].mutableCopy;
    [self addCell:@"Text Attributes 1" class:@"DGCYYTextAttributeExample"];
    [self addCell:@"Text Attributes 2" class:@"DGCYYTextTagExample"];
    [self addCell:@"Text Attachments" class:@"DGCYYTextAttachmentExample"];
    [self addCell:@"Text Edit" class:@"DGCYYTextEditExample"];
    [self addCell:@"Text Edit Ruby" class:@"DGCYYTextEditRubyExample"];
    [self addCell:@"Copy and Paste" class:@"DGCYYTextCopyPasteExample"];
    [self addCell:@"Undo and Redo" class:@"DGCYYTextUndoRedoExample"];
    [self addCell:@"Ruby Annotation" class:@"DGCYYTextRubyExample"];
    [self addCell:@"Async Display" class:@"DGCYYTextAsyncExample"];
    [self.tableView reloadData];
}

- (void)addCell:(NSString *)title class:(NSString *)className {
    [self.titles addObject:title];
    [self.classNames addObject:className];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YY"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YY"];
    }
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = self.classNames[indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title = _titles[indexPath.row];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
