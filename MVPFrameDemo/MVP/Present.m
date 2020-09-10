//
//  Present.m
//  MVPFrameDemo
//
//  Created by keith on 2020/9/10.
//  Copyright © 2020 Charles&Keith. All rights reserved.
//

#import "Present.h"
#import "Model.h"

@implementation Present

- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadData];
    }
    return self;
}

- (void)loadData {
    NSArray *array = @[
        @{ @"name" : @"张三", @"num" : @"99"},
        @{ @"name" : @"李四", @"num" : @"99"},
        @{ @"name" : @"王五", @"num" : @"99"},
        @{ @"name" : @"赵六", @"num" : @"99"},
        @{ @"name" : @"郑七", @"num" : @"99"},
        @{ @"name" : @"黄一", @"num" : @"99"},
        @{ @"name" : @"钱八", @"num" : @"99"},
        @{ @"name" : @"孙二", @"num" : @"99"},
        @{ @"name" : @"刘九", @"num" : @"99"}
    ];
    
    for (NSDictionary *dict in array) {
        Model *model = [Model modelWithDictionary:dict];
        [self.dataArray addObject:model];
    }
}

- (void)didClickNumber:(NSString *)num atIndexPath:(NSIndexPath *)indexPath {
    @synchronized (self) {
        if (indexPath.row < self.dataArray.count) {
            Model *model = self.dataArray[indexPath.row];
            model.num = num;
        }
    }
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
