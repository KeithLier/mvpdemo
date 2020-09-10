//
//  Present.h
//  MVPFrameDemo
//
//  Created by keith on 2020/9/10.
//  Copyright © 2020 Charles&Keith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PresentDelegate <NSObject>

- (void)didClickNumber:(NSString *)num atIndexPath:(NSIndexPath *)indexPath;

@end

@interface Present : NSObject<PresentDelegate>

@property(strong, nonatomic) NSMutableArray *dataArray;

@end

NS_ASSUME_NONNULL_END
