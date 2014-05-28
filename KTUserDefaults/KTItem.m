//
//  KTItem.m
//  KTUserDefaults
//
//  Created by Kazamidori on 2014/05/27.
//  Copyright (c) 2014 Kazamidori. All rights reserved.
//

#import "KTItem.h"

@implementation KTItem

- (id)initWithType:(NSInteger)type key:(NSString *)key value:(id)value
{
    self = [super init];
    if (self) {
        self.type = type;
        self.key = key;
        self.value = value;
    }
    return self;
}

@end
