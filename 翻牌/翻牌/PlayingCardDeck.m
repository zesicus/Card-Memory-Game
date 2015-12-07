//
//  PlayingCardDeck.m
//  翻牌
//
//  Created by TheSix on 8/13/15.
//  Copyright (c) 2015 OCLearning. All rights reserved.
//

#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

//初始化，把一副牌加入牌堆、、
- (instancetype) init {
    self = [super init];
    if (self) {
        for (NSString *suit in [playingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [playingCard maxRank]; rank++) {
                playingCard *card = [[playingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
