//
//  PlayingCardViewController.m
//  翻牌
//
//  Created by TheSix on 8/19/15.
//  Copyright (c) 2015 OCLearning. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"
@interface PlayingCardViewController ()

@end

@implementation PlayingCardViewController

-(Deck *)creatDeck {
    return [[PlayingCardDeck alloc] init];
}

@end
