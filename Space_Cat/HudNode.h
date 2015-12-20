//
//  HudNode.h
//  Space_Cat
//
//  Created by Jesus on 2015-08-02.
//  Copyright (c) 2015 Jesus. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>


@interface HudNode : SKNode
@property (nonatomic) NSInteger lives;
@property (nonatomic) NSInteger score;

+ (instancetype) hudAtPosition: (CGPoint)position inFrame:(CGRect)frame;
- (void) addPoints: (NSInteger) points;
- (BOOL) loseLife;

@end
