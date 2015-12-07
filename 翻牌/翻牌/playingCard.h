//
//  playingCard.h
//  翻牌
//
//  Created by TheSix on 8/13/15.
//  Copyright (c) 2015 OCLearning. All rights reserved.
//

#import "Card.h"

@interface playingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *)rankStrings;
+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end
