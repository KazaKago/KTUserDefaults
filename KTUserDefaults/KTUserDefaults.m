//
//  KTUserDefaults.m
//  KTUserDefaults
//
//  Created by Kazamidori on 2014/05/27.
//  Copyright (c) 2014 Kazamidori. All rights reserved.
//

#import "KTUserDefaults.h"
#import "KTItem.h"

@interface KTUserDefaults ()

@property(nonatomic, strong) NSMutableArray *itemArray;
@property(nonatomic, readwrite) NSUserDefaults *userDefaults;

enum {
    KT_TYPE_OBJECT,
    KT_TYPE_VALUE,
    KT_TYPE_BOOL,
    KT_TYPE_INTEGER,
    KT_TYPE_FLOAT,
    KT_TYPE_DOUBLE,
    KT_TYPE_URL,
    KT_TYPE_REMOVE,
};

@end

@implementation KTUserDefaults

+ (KTUserDefaults *)standardUserDefaults
{
    return [[KTUserDefaults alloc] init];
}

- (id)init
{
    self = [super init];
    if (self) {
        self.itemArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)initWithSuiteName:(NSString *)suitename
{
    self = [super initWithSuiteName:suitename];
    if (self) {
        self.itemArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (BOOL)synchronize
{
    for(int i = 0; i < self.itemArray.count; i++){
        KTItem *item = self.itemArray[i];
        switch (item.type) {
            case KT_TYPE_OBJECT:
                [super setObject:item.value forKey:item.key];
                break;
            case KT_TYPE_VALUE:
                [super setValue:item.value forKey:item.key];
                break;
            case KT_TYPE_BOOL:
                [super setBool:[item.value boolValue] forKey:item.key];
                break;
            case KT_TYPE_INTEGER:
                [super setInteger:[item.value integerValue] forKey:item.key];
                break;
            case KT_TYPE_FLOAT:
                [super setFloat:[item.value floatValue] forKey:item.key];
                break;
            case KT_TYPE_DOUBLE:
                [super setDouble:[item.value doubleValue] forKey:item.key];
                break;
            case KT_TYPE_URL:
                [super setURL:item.value forKey:item.key];
                break;
            case KT_TYPE_REMOVE:
                [super removeObjectForKey:item.key];
                break;
            default:
                break;
        }
    }

    [self.itemArray removeAllObjects];
    return [super synchronize];
}

- (void)setObject:(id)value forKey:(NSString *)defaultName
{
    KTItem *item = [[KTItem alloc] init];
    item.type = KT_TYPE_OBJECT;
    item.key = defaultName;
    item.value = value;
    [self.itemArray addObject:item];
}

- (void)setValue:(id)value forKey:(NSString *)defaultName
{
    KTItem *item = [[KTItem alloc] init];
    item.type = KT_TYPE_VALUE;
    item.key = defaultName;
    item.value = value;
    [self.itemArray addObject:item];
}

- (void)setBool:(BOOL)value forKey:(NSString *)defaultName
{
    KTItem *item = [[KTItem alloc] init];
    item.type = KT_TYPE_BOOL;
    item.key = defaultName;
    item.value = @(value);
    [self.itemArray addObject:item];
}

- (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName
{
    KTItem *item = [[KTItem alloc] init];
    item.type = KT_TYPE_INTEGER;
    item.key = defaultName;
    item.value = @(value);
    [self.itemArray addObject:item];
}

- (void)setFloat:(float)value forKey:(NSString *)defaultName
{
    KTItem *item = [[KTItem alloc] init];
    item.type = KT_TYPE_FLOAT;
    item.key = defaultName;
    item.value = @(value);
    [self.itemArray addObject:item];
}

- (void)setDouble:(double)value forKey:(NSString *)defaultName
{
    KTItem *item = [[KTItem alloc] init];
    item.type = KT_TYPE_DOUBLE;
    item.key = defaultName;
    item.value = @(value);
    [self.itemArray addObject:item];
}

- (void)setURL:(NSURL *)url forKey:(NSString *)defaultName
{
    KTItem *item = [[KTItem alloc] init];
    item.type = KT_TYPE_URL;
    item.key = defaultName;
    item.value = url;
    [self.itemArray addObject:item];
}

- (void)removeObjectForKey:(NSString *)defaultName
{
    KTItem *item = [[KTItem alloc] init];
    item.type = KT_TYPE_REMOVE;
    item.key = defaultName;
    item.value = nil;
    [self.itemArray addObject:item];
}

@end
