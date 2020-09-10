//
//  Model.m
//  MVPFrameDemo
//
//  Created by keith on 2020/9/10.
//  Copyright © 2020 Charles&Keith. All rights reserved.
//

#import "Model.h"

@implementation Model

+ (Model *)modelWithDictionary:(NSDictionary *)dictionary {
    Model *model = [[Model alloc] init];
    model.name = dictionary[@"name"];
    model.num = dictionary[@"num"];
    return model;
}

@end
