//
//  CoverFlowLayout.m
//  CoverFlowLayout
//
//  Created by thomas minshull on 2016-07-14.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "CoverFlowLayout.h"

@implementation CoverFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/3, [UIScreen mainScreen].bounds.size.height/1.5);
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
    
    int i = 0;
    for (UICollectionViewLayoutAttributes *attr in attributes) {
        i++;
        if (i == 2) {
            attr.transform3D = CATransform3DScale(attr.transform3D, 1.25, 1.25, 1.0);
        }
    }
    
    return attributes;
}
@end
