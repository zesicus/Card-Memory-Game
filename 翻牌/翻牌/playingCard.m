//
//  playingCard.m
//  翻牌
//
//  Created by TheSix on 8/13/15.
//  Copyright (c) 2015 OCLearning. All rights reserved.
//

#import "playingCard.h"

@implementation playingCard

//重写Card.m的match函数，得分规则
-(int)match:(NSArray *)otherCards {
    int score = 0;
    if ([otherCards count] == 1) {
        id card = [otherCards firstObject];
        if ([card isKindOfClass:[playingCard class]]) {
            playingCard *otherCard = (playingCard *)card;
            if ([self.suit isEqualToString:otherCard.suit]) {
                score = 1; //花色匹配，得1分
            } else if (self.rank == otherCard.rank) {
                score = 4; //数字匹配，得4分
            }
        }
        
    }
    return score;
}

//组牌：把花和数字组合
-(NSString *)contents {
    NSArray *rankString = [playingCard rankStrings];
    //self.rank是脚标
    return [rankString[self.rank] stringByAppendingString:self.suit];
}

//类方法：组牌字符库
+(NSArray *)rankStrings {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}
+(NSArray *)validSuits {
    return @[@"♣️",@"♠️",@"♥️",@"♦️"];
}
+(NSUInteger)maxRank {
    return [[self rankStrings] count] - 1;
}

//对suit限制
@synthesize suit = _suit;
//setter
-(void)setSuit:(NSString *)suit {
    if ([[playingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}
//getter
-(NSString *)suit {
    return _suit ? _suit : @"?";
}

//对rank有个边界限制
-(void)setRank:(NSUInteger)rank {
    if (rank <= [playingCard maxRank]) {
        _rank = rank;
    }
}

@end
