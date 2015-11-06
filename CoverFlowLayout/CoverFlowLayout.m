//
//  CoverFlowLayout.m
//  CoverFlowLayout
//
//  Created by Steele on 2015-11-05.
//  Copyright © 2015 Steele. All rights reserved.
//

#import "CoverFlowLayout.h"

@interface CoverFlowLayout ()


@end


@implementation CoverFlowLayout

- (void)prepareLayout {
    
    self.itemSize = CGSizeMake(300, 300);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray * original   = [super layoutAttributesForElementsInRect:rect];
    NSArray * attributes = [[NSArray alloc] initWithArray:original copyItems:YES];
    
    CGRect visibleRegion;
    visibleRegion.origin = self.collectionView.contentOffset;
    visibleRegion.size   = self.collectionView.bounds.size;
    
    CGPoint visibleCenter = CGPointMake(visibleRegion.origin.x+(visibleRegion.size.width/2), visibleRegion.size.height/2);
    
    for (UICollectionViewLayoutAttributes *item in attributes)
    {
        CGFloat distanceFromCenter = fabs(item.center.x - visibleCenter.x);
        CGFloat scaleFactor = 1 - (distanceFromCenter / (visibleRegion.size.width/2));
        
       item.transform3D = CATransform3DMakeScale(scaleFactor, scaleFactor, 1.0);
        item.transform3D = CATransform3DRotate(item.transform3D, (1-scaleFactor) * M_PI_4, 0, 1, 0);
//        
//        item.transform3D = CATransform3DScale(CATransform3DMakeRotation( 4 * (1-scaleFactor) * M_1_PI, 0, 1, 0),scaleFactor, scaleFactor, scaleFactor);
 
        item.alpha = scaleFactor;
    }
    return attributes;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    
    return YES;
}



@end
