//
//  Card.h
//  翻牌
//
//  Created by TheSix on 8/12/15.
//  Copyright (c) 2015 OCLearning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMathched) BOOL matched;

-(int) match: (NSArray *)otherCards;

@end
