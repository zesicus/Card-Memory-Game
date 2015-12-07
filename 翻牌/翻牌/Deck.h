//
//  Deck.h
//  翻牌
//
//  Created by TheSix on 8/12/15.
//  Copyright (c) 2015 OCLearning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "playingCard.h"

@interface Deck : NSObject

-(void)addCard: (Card *) card atTop:(BOOL)atTop;
-(void)addCard: (Card *) card;

-(Card *)drawRandomCard;

@end
