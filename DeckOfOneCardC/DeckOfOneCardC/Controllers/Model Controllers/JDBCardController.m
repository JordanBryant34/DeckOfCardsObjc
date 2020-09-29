//
//  JDBCardController.m
//  DeckOfOneCardC
//
//  Created by Jordan Bryant on 9/29/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import "JDBCardController.h"

@implementation JDBCardController

+ (JDBCardController *)sharedController {
    static JDBCardController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [JDBCardController new];
    });
    return sharedController;
}

- (void)drawNewCard:(NSNumber *)numberOfCards completion:(void (^)(NSArray<JDBCard *> *_Nullable))completion {
    NSString *urlString = [NSString stringWithFormat:@"https://deckofcardsapi.com/api/deck/new/draw/?count=%@", numberOfCards];
    NSURL *url = [NSURL URLWithString: urlString];
    
    NSLog(@"%@", url.absoluteString);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil);
            });
            return;
        }
        
        if (!data) {
            NSLog(@"No data received when drawing new card.");
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil);
            });
            return;
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingAllowFragments error: &error];
        NSArray *cardsArray = topLevelDictionary[@"cards"];
        
        NSMutableArray *cardsPlaceholder = [NSMutableArray array];
        
        for (NSDictionary *cardDictionary in cardsArray) {
            JDBCard *card = [[JDBCard alloc] initWithDict:cardDictionary];
            [cardsPlaceholder addObject: card];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(cardsPlaceholder);
        });
        
    }] resume] ;
}

- (void)fetchCardImage:(JDBCard *)card completion:(void (^)(UIImage * _Nullable))completion {
    NSURL *url = [NSURL URLWithString:card.imageUrl];
    
    NSLog(@"%@", url.absoluteString);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil);
            });
            return;
        }
        
        if (!data) {
            NSLog(@"No data received when getting card image.");
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil);
            });
            return;
        }
        
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(image);
        });
        
    }] resume] ;
}

@end
