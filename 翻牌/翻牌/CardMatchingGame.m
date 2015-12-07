//
//  CardMatchingGame.m
//  翻牌
//
//  Created by TheSix on 8/14/15.
//  Copyright (c) 2015 OCLearning. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //纸牌堆
@end

@implementation CardMatchingGame

//惰性实例化（getter）
-(NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

static const int MATCH_BONUS = 4;//红利翻倍
static const int MISMATCH_PENALTY = 2;//处罚
static const int COST_TO_CHOOSE = 1;//翻牌消耗
//游戏分数计算规则
-(void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    if (!card.isMathched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            //和另一张牌匹配
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMathched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {//得分红利 和 处罚
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

//如果牌索引在牌堆总索引之内，返回这张牌
-(Card *)cardAtIndex:(NSUInteger)index {
    return (index < self.cards.count) ? self.cards[index] : nil;
}

//游戏重置
-(void)resetGame {
    for (Card *card in _cards) {
        card.chosen = NO;
        card.matched = NO;
    }
}

@end
