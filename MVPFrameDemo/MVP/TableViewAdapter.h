//
//  TableViewAdapter.h
//  MVPFrameDemo
//
//  Created by keith on 2020/9/10.
//  Copyright © 2020 Charles&Keith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ConfigureBlock)(id cell, id model, NSIndexPath * indexPath);
typedef void (^DidSelectedRow)(id cell, id model, NSIndexPath * indexPath);

@interface TableViewAdapter : NSObject<UITableViewDataSource, UITableViewDelegate>

- (instancetype)initWithIdentifier:(NSString *)identifier configureBlock:(ConfigureBlock)block;
- (void)setRowHeight:(CGFloat)rowHeight didSelectedRow:(DidSelectedRow)block;

- (void)didSelectedRow:(DidSelectedRow)block;

- (void)addModels:(NSArray *)models;

@end


NS_ASSUME_NONNULL_END
