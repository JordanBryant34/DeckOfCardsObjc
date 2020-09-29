//
//  JDBCard.h
//  DeckOfOneCardC
//
//  Created by Jordan Bryant on 9/29/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JDBCard : NSObject

- (instancetype)initWithSuit:(NSString *)suit value:(NSString *)value imageUrl:(NSString *)imageUrl;
- (instancetype)initWithDict:(NSDictionary *)dictionary;

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *value;
@property (nonatomic, copy, readonly) NSString *imageUrl;

@end

NS_ASSUME_NONNULL_END
