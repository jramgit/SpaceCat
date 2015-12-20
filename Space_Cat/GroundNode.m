//
//  GroundNode.m
//  Space_Cat
//
//  Created by Jesus on 2015-06-21.
//  Copyright (c) 2015 Jesus. All rights reserved.
//

#import "GroundNode.h"
#import "Util.h"

@implementation GroundNode

+ (instancetype) groundWithSize:(CGSize)size {
    GroundNode *ground = [self spriteNodeWithColor:[SKColor clearColor] size:size];
    ground.name = @"Ground";
    ground.position = CGPointMake(size.width/2, size.height/2);
    ground.zPosition = 1;
    [ground setupPhysicsBody];
    
    return ground;
}

- (void) setupPhysicsBody{
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
     self.physicsBody.dynamic = NO;
    //This is because I was trying to understand why the witdh/height/2
    //ground.anchorPoint = CGPointMake(0,0);
    //ground.position = CGPointMake (0,0);
    
    self.physicsBody.categoryBitMask = CollisionCategoryGround;
    self.physicsBody.collisionBitMask   = CollisionCategoryDebris;
    self.physicsBody.contactTestBitMask = CollisionCategoryEnemy;
}

@end
