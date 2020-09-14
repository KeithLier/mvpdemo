//
//  ViewController.m
//  MVPFrameDemo
//
//  Created by keith on 2020/9/10.
//  Copyright © 2020 Charles&Keith. All rights reserved.
//

#import "ViewController.h"
#import "TableViewAdapter.h"
#import "Present.h"
#import "Model.h"
#import "TableViewCell.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) TableViewAdapter *dataSource;
@property (strong, nonatomic) Present *present;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"TableViewCell"];

    // 数据源
    self.present = [[Present alloc] init];
    
    __weak typeof(self) weakSelf = self;
    self.dataSource = [[TableViewAdapter alloc] initWithIdentifier:@"TableViewCell" configureBlock:^(TableViewCell*  _Nonnull cell, Model*  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        cell.nameLabel.text = model.name;
        cell.numLabel.text = model.num;
        cell.delegate = strongSelf.present;
        cell.indexPath = indexPath;
    }];
    // 设置cell高度
    [self.dataSource setRowHeight:44 didSelectedRow:^(id  _Nonnull cell, id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
        
    }];
//    [self.dataSource didSelectedRow:^(id  _Nonnull cell, id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
//        
//    }];
    
    // 设置代理
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
    [self.dataSource addModels:self.present.dataArray];
    [self.tableView reloadData];
}

@end
