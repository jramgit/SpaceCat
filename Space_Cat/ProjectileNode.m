
//  ProjectileNode.m
//  Space_Cat
//
//  Created by Jesus on 2015-06-19.
//  Copyright (c) 2015 Jesus. All rights reserved.
//

#import "ProjectileNode.h"
#import "Util.h"

@implementation ProjectileNode

+ (instancetype) projectileAtPosition:(CGPoint)position {
    ProjectileNode *projectile = [self spriteNodeWithImageNamed:@"projectile_1"];
    projectile.position = position;
    projectile.anchorPoint = CGPointMake(0.5,0.5);
    projectile.name = @"Projectile";
    [projectile setupAnimation];
    [projectile setupPhysicsBody];
    return projectile;
}

- (void) setupPhysicsBody{
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.categoryBitMask = CollisionCategoryProjectile;
    self.physicsBody.collisionBitMask = 0;
    self.physicsBody.contactTestBitMask = CollisionCategoryEnemy;
    
}

-(void) setupAnimation {
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"projectile_1"],
                          [SKTexture textureWithImageNamed:@"projectile_2"],
                          [SKTexture textureWithImageNamed:@"projectile_3"]];
    
    SKAction *projectileAnimation = [SKAction animateWithTextures:textures timePerFrame:0.1];
    SKAction *projectileRepeat = [SKAction repeatActionForever:projectileAnimation];
    [self runAction:projectileRepeat];
    
}


-(void) moveTowardsPosition:(CGPoint)position {
    //slope = (Y3 - Y1) / (X3 - x1)
    float slope = (position.y - self.position.y) / (position.x - self.position.x);
    
    //slope = (Y2 - Y1) / (X2 - X1)
    // Y2 - Y1 = slope (X2 - X1)
    // Y2 = slope *X2 - slope * X1 + Y1
    
    
    float offscreenX;
    if (position.x <= self.position.x){
        offscreenX = -10;
    } else {
        offscreenX = self.parent.frame.size.width + 10;
    }
    
    float offscreenY = slope * offscreenX - slope * self.position.x + self.position.y;
    CGPoint pointOffscreen = CGPointMake(offscreenX, offscreenY);
    
    float distanceA = pointOffscreen.y - self.position.y;
    float distanceB = pointOffscreen.x - self.position.x;
    
    float distanceC = sqrtf(powf(distanceA, 2) + powf(distanceB, 2));
    
    // distance = speed * time
    // time = distance / speed
    
    float time = distanceC / CProjectileSpeed;

    float heigth = self.parent.frame.size.height - self.position.y;
    float waitToFade;
    if (pointOffscreen.x >= 0 || pointOffscreen.x <= self.parent.frame.size.width) {
        waitToFade = heigth / CProjectileSpeed * 0.75;
    } else waitToFade = time * 0.75;
    float fadeTime = waitToFade;
    
    
    SKAction *moveProjectile = [SKAction moveTo: pointOffscreen duration:time];
    
    NSArray *sequence = @[[SKAction waitForDuration:waitToFade],
                          [SKAction fadeOutWithDuration:fadeTime],
                          [SKAction removeFromParent]];
    SKAction *group =[SKAction group:@[moveProjectile, sequence]];
    
  
      [self runAction:group];
    
    
}


@end
