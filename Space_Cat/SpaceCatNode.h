//
//  SpaceCatNode.h
//  Space_Cat
//
//  Created by Jesus on 2015-06-19.
//  Copyright (c) 2015 Jesus. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SpaceCatNode : SKSpriteNode

+ (instancetype) spaceCatAtPosition: (CGPoint)position;
- (void) performTap;

@end
