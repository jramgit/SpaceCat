//
//  SpaceDogNode.h
//  Space_Cat
//
//  Created by Jesus on 2015-06-20.
//  Copyright (c) 2015 Jesus. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef NS_ENUM(NSUInteger, SpaceDogType){
    SpaceDogTypeA = 0,
    SpaceDogTypeB = 1
};


@interface SpaceDogNode : SKSpriteNode

@property (nonatomic, getter = isDamaged) BOOL damaged;
@property (nonatomic) SpaceDogType type;

+ (instancetype) spaceDogOfType:(SpaceDogType)type;


@end
