//
//  KTItem.h
//  KTUserDefaults
//
//  Created by Kazamidori on 2014/05/27.
//  Copyright (c) 2014 Kazamidori. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KTItem : NSObject

@property (assign, nonatomic) NSInteger type;
@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) id value;

@end
