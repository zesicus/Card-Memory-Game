//
//  Deck.m
//  翻牌
//
//  Created by TheSix on 8/12/15.
//  Copyright (c) 2015 OCLearning. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation Deck

-(instancetype) init {
    self = [super init];
    if (self) {
        if (!_cards) {
            _cards = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

-(void)addCard: (Card *) card atTop:(BOOL)atTop{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

-(void)addCard: (Card *) card {
    [self addCard:card atTop:NO];
}

//抽取一张随机牌，从牌堆拿掉并返回这张牌
-(Card *)drawRandomCard {
    Card *randomCard = nil;
    if ([self.cards count]) { //避免[self.cards count] == 0 下面这句引起崩溃
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

@end
