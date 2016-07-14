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

@end
