//
//  TableViewAdapter.m
//  MVPFrameDemo
//
//  Created by keith on 2020/9/10.
//  Copyright © 2020 Charles&Keith. All rights reserved.
//

#import "TableViewAdapter.h"

@interface TableViewAdapter ()

@property (nonatomic, strong) NSString *cellIdentifier;
@property (nonatomic, strong) NSMutableArray *models;
@property (assign, nonatomic) CGFloat rowHeight;
@property (nonatomic, copy) ConfigureBlock configureBlock;
@property (nonatomic, copy) DidSelectedRow didSelected;

@end

@implementation TableViewAdapter

- (instancetype)initWithIdentifier:(NSString *)identifier configureBlock:(ConfigureBlock)block {
    self = [super init];
    if (self) {
        self.cellIdentifier = identifier;
        self.configureBlock = block;
        self.rowHeight = 44.0;
    }
    return self;
}

- (void)addModels:(NSArray *)models {
    if (!models.count) {
        return;
    }
    [self.models addObjectsFromArray:models];
}

- (NSMutableArray *)models {
    if (!_models) {
        _models = [NSMutableArray array];
    }
    return _models;
}

- (void)setRowHeight:(CGFloat)rowHeight didSelectedRow:(DidSelectedRow)block {
    self.rowHeight = rowHeight;
    self.didSelected = block;
}

- (void)didSelectedRow:(DidSelectedRow)block {
    self.didSelected = block;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.models[(NSUInteger) indexPath.row];
}

#pragma -mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.didSelected(cell, item, indexPath);
}

#pragma -mark UITableViewDatasource
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureBlock(cell, item, indexPath);
    return cell;
}

@end
