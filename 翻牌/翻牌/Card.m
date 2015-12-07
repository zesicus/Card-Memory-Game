//
//  Card.m
//  翻牌
//
//  Created by TheSix on 8/12/15.
//  Copyright (c) 2015 OCLearning. All rights reserved.
//

#import "Card.h"

@implementation Card

//检查牌匹配，如果otherCards里有你的牌，得1分（基本分数，其它model有翻倍奖励等）
-(int) match:(NSArray *)otherCards {
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
