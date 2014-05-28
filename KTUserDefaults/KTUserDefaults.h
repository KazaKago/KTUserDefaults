//
//  KTUserDefaults.h
//  KTUserDefaults
//
//  Created by Kazamidori on 2014/05/27.
//  Copyright (c) 2014 Kazamidori. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KTUserDefaults : NSUserDefaults

+ (KTUserDefaults *)standardUserDefaults;
- (id)init;
- (id)initWithSuiteName:(NSString *)suitename;

@end
