//
//  Util.m
//  Space_Cat
//
//  Created by Jesus on 2015-06-20.
//  Copyright (c) 2015 Jesus. All rights reserved.
//

#import "Util.h"

@implementation Util

+ (NSInteger) randomWithMin:(NSInteger)min max:(NSInteger)max {
    return arc4random()%(max - min) + min;
}

@end
