//
//  MVPTableViewCell.m
//  CC_VideoToolBoxLearning_1
//
//  Created by keith on 2020/9/7.
//  Copyright © 2020 Miss CC. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)plus:(id)sender {
    NSInteger num = [self.numLabel.text integerValue];
    num++;
    if (num >= 100) {
        num = 1;
    }
    [self setNumber:[NSString stringWithFormat:@"%ld",num]];
}

- (IBAction)minus:(id)sender {
    NSInteger num = [self.numLabel.text integerValue];
    num--;
    if (num <= 0) {
        num = 99;
    }
    [self setNumber:[NSString stringWithFormat:@"%ld",num]];
}

- (void)setNumber:(NSString *)num {
    self.numLabel.text = num;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickNumber:atIndexPath:)]) {
        [self.delegate didClickNumber:num atIndexPath:self.indexPath];
    }
}

@end
