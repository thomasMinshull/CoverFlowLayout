//
//  CoverFlowLayout.m
//  CoverFlowLayout
//
//  Created by thomas minshull on 2016-07-14.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "CoverFlowLayout.h"

#define ZOOM_FACTOR 2

@implementation CoverFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(self.collectionView.bounds.size.height/4, self.collectionView.bounds.size.height/4);
    self.collectionView.contentInset = UIEdgeInsetsMake(self.collectionView.bounds.size.height/4, 0.0,
                                                        self.collectionView.bounds.size.height/4, 0.0);
//
//    NSMutableArray *array = [@[] mutableCopy];
//    
//    for (int sec = 0; sec < [self.collectionView numberOfSections]; sec++) {
//        for (int itm = 0; itm < [self.collectionView numberOfItemsInSection:sec]; itm++) {
//            NSIndexPath *ip = [NSIndexPath indexPathForRow:itm inSection:sec];
//            UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:ip];
//            
//        }
//    }

//    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    self.itemSize = CGSizeMake(100.0, 2.0);
}




- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *supersAttributes = [super layoutAttributesForElementsInRect:rect];
    NSArray *attributes = [[NSArray alloc] initWithArray:supersAttributes copyItems:YES];
    
    CGRect layoutRegion;
    layoutRegion.origin = self.collectionView.contentOffset;
    layoutRegion.size = self.collectionView.bounds.size;
    
    float screenCenter = CGRectGetMidX(layoutRegion);
    
    for (UICollectionViewLayoutAttributes *attr in attributes) {
        
        float distFromCenterRaw = ABS(screenCenter - attr.center.x);
        float normDistFromCenter = distFromCenterRaw / (layoutRegion.size.width / 2); // 0 is center, 1 is edge or screen

        
        attr.transform3D = CATransform3DScale(attr.transform3D, ZOOM_FACTOR * (1 - normDistFromCenter), ZOOM_FACTOR * (1 - normDistFromCenter), 50 * (1 -normDistFromCenter));
        
        
        // (M_PI_2) is pi/2 AKA 90 degrees At center no rotation, at edge fully rotatied
        attr.transform3D = CATransform3DRotate(attr.transform3D, (M_PI_2) * normDistFromCenter, 0.0, 1.0, 0.0);
        
    
    }
    
    return attributes;
}

//
//// shareen's conde
//-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
//    //    NSLog(@"Returning attributes for elements in {(%f, %f),(%f, %f)}",
//    //          rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
//    NSArray* supersAttributes = [super layoutAttributesForElementsInRect:rect];
//    NSArray *attributes = [[NSArray alloc] initWithArray:supersAttributes copyItems:YES];
//    
//    CGRect visibleRect;
//    visibleRect.origin = self.collectionView.contentOffset;
//    visibleRect.size = self.collectionView.bounds.size;
//    
//    float collectionViewHalfFrame = self.collectionView.frame.size.width/2.0;
//    
//    for (UICollectionViewLayoutAttributes* layoutAttributes in attributes) {
//        if (CGRectIntersectsRect(layoutAttributes.frame, rect)) {
//            CGFloat distance = CGRectGetMidX(visibleRect) - layoutAttributes.center.x;
//            CGFloat normalizedDistance= distance / collectionViewHalfFrame;
//            
//            if (ABS(distance) < collectionViewHalfFrame) {
//                CGFloat zoom = 1 + ZOOM_FACTOR*(1- ABS(normalizedDistance));
//                CATransform3D rotationTransform = CATransform3DIdentity;
//                rotationTransform = CATransform3DMakeRotation(normalizedDistance * M_PI_2 *0.8, 0.0f, 1.0f, 0.0f);
//                CATransform3D zoomTransform = CATransform3DMakeScale(zoom, zoom, 1.0);
//                layoutAttributes.transform3D = CATransform3DConcat(zoomTransform, rotationTransform);
//                layoutAttributes.zIndex = ABS(normalizedDistance) * 10.0f;
//                CGFloat alpha = (1  - ABS(normalizedDistance)) + 0.1;
//                if (alpha > 1.0f) alpha = 1.0f;
//                layoutAttributes.alpha = alpha;
//            }
//            else
//            {
//                layoutAttributes.alpha = 0.0f;
//            }
//        }
//    }
//    
//    return attributes;
//}



- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
