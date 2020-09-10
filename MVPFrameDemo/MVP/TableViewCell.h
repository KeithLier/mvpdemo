//
//  MVPTableViewCell.h
//  CC_VideoToolBoxLearning_1
//
//  Created by keith on 2020/9/7.
//  Copyright © 2020 Miss CC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Present.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;

@property (strong, nonatomic) NSIndexPath *indexPath;
@property (weak, nonatomic) id<PresentDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
