//
//  MachineNode.m
//  Space_Cat
//
//  Created by Jesus on 2015-06-19.
//  Copyright (c) 2015 Jesus. All rights reserved.
//

#import "MachineNode.h"

@implementation MachineNode

+ (instancetype) machineAtPosition:(CGPoint)position {
    MachineNode *machine = [self spriteNodeWithImageNamed:@"machine_1"];
    machine.position = position;
    machine.zPosition = 8;
    machine.anchorPoint = CGPointMake(0.5,0);
    machine.name = @"Machine";
    
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"machine_1"],
                          [SKTexture textureWithImageNamed:@"machine_2"]];
    
    SKAction *machineAnimation = [SKAction animateWithTextures:textures timePerFrame:0.1];
    SKAction *machineRepeat = [SKAction repeatActionForever:machineAnimation];
    [machine runAction:machineRepeat];
    return machine;
}

@end
