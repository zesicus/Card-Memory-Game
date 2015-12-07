//
//  ViewController.m
//  翻牌
//
//  Created by TheSix on 8/11/15.
//  Copyright (c) 2015 OCLearning. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [NSThread sleepForTimeInterval:1.0]; //launchImage停留1秒
}

//帮助提示
- (IBAction)helpAlert {
    UIAlertView *hlpAlt = [[UIAlertView alloc] initWithTitle:@"游戏帮助" message:@"规则:\n1.每翻一张牌，消耗1分。\n2.翻取第二张牌花色匹配，得4分，如果数字匹配，得16分。\n3.如果翻第二牌花色和数字都不匹配，处罚2分。\n\n游戏愉快！😉" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [hlpAlt show];
}

//惰性初始化，游戏初始化
-(CardMatchingGame *) game {
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self creatDeck]];
    }
    return _game;
}

//卡牌堆初始化
-(Deck *) creatDeck {
//    return [[PlayingCardDeck alloc] init];
    //不初始化playCardDeck类型，成为抽象类型
    return nil;
}

//翻牌
- (IBAction)clickCard:(UIButton *)sender {
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

//重置卡牌
- (IBAction)resetCards {
    _game = nil;
    [self game];
    [self updateUI];
}

//更新视图
-(void) updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMathched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"您的分数：%li", (long)_game.score];
}

-(NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.isChosen ? @"Poker_selfMade_blank.png" : @"Poker_selfMade_joker.png"];
}

@end
