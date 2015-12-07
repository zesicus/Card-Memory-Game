//
//  CardMatchingGame.h
//  翻牌
//
//  Created by TheSix on 8/14/15.
//  Copyright (c) 2015 OCLearning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

-(void)resetGame;

@end
