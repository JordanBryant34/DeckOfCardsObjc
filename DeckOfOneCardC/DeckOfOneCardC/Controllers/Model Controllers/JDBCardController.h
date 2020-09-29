//
//  JDBCardController.h
//  DeckOfOneCardC
//
//  Created by Jordan Bryant on 9/29/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JDBCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface JDBCardController : NSObject

+ (JDBCardController *)sharedController;

- (void)drawNewCard:(NSNumber *)numberOfCards completion:(void(^) (NSArray<JDBCard *> *_Nullable cards))completion;
- (void)fetchCardImage:(JDBCard *)card completion:(void(^) (UIImage *_Nullable image))completion;

@end

NS_ASSUME_NONNULL_END
