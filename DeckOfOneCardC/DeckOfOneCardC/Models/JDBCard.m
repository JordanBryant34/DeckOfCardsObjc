//
//  JDBCard.m
//  DeckOfOneCardC
//
//  Created by Jordan Bryant on 9/29/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import "JDBCard.h"

@implementation JDBCard

static NSString * const suitKey = @"suit";
static NSString * const valueKey = @"value";
static NSString * const imageUrlKey = @"image";

- (instancetype)initWithSuit:(NSString *)suit value:(NSString *)value imageUrl:(NSString *)imageUrl {
    self = [super init];
    
    if (self) {
        _suit = suit;
        _value = value;
        _imageUrl = imageUrl;
    }
    
    return self;
}

- (instancetype)initWithDict:(NSDictionary *)dictionary {
    NSString *suit = dictionary[suitKey];
    NSString *value = dictionary[valueKey];
    NSString *imageUrl = dictionary[imageUrlKey];
    
    JDBCard *card = [self initWithSuit:suit value:value imageUrl:imageUrl];
    
    return card;
}

@end
