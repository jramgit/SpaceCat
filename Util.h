//
//  Util.h
//  Space_Cat
//
//  Created by Jesus on 2015-06-20.
//  Copyright (c) 2015 Jesus. All rights reserved.
//

#import <Foundation/Foundation.h>

static const int CProjectileSpeed = 400;
static const int spaceDogMinSpeed = -100;
static const int spaceDogMaxSpeed = -50;
static const int spaceDogMinScale = 85;
static const int spaceDogMaxScale = 100;
static const int MaxLives = 4;
static const int PointsPerHit = 100;


typedef NS_OPTIONS(uint32_t, CollisionCategory) {
    CollisionCategoryEnemy          = 1 << 0,     //0000
    CollisionCategoryProjectile     = 1 << 1,     //0010
    CollisionCategoryDebris         = 1 << 2,     //0100
    CollisionCategoryGround         = 1 << 3      //1000
};

@interface Util : NSObject

+ (NSInteger) randomWithMin:(NSInteger)min max:(NSInteger)max;

@end
