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
@property (nonatomic, copy) ConfigureBlock configureBlock;
@property (nonatomic, strong) NSMutableArray *models;

@end

@implementation TableViewAdapter

- (instancetype)initWithIdentifier:(NSString *)identifier configureBlock:(ConfigureBlock)block {
    self = [super init];
    if (self) {
        self.cellIdentifier = identifier;
        self.configureBlock = block;
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

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.models[(NSUInteger) indexPath.row];
}

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
