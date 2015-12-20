//
//  GameOverNode.h
//  Space_Cat
//
//  Created by Jesus on 2015-08-03.
//  Copyright (c) 2015 Jesus. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameOverNode : SKNode

+ (instancetype) gameOverAtPosition:(CGPoint) position;
- (void) performAnimation;

@end
