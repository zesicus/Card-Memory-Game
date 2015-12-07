//
//  ViewController.h
//  翻牌
//
//  Created by TheSix on 8/11/15.
//  Copyright (c) 2015 OCLearning. All rights reserved.
//


//abstract class.  Must implement methods as described below.

#import <UIKit/UIKit.h>
//#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController : UIViewController



//protected
//for subclasses
-(Deck *) creatDeck;

@end

