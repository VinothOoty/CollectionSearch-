//
//  HomeViewController.h
//  CollectionSearch
//
//  Created by SYZYGY01 on 19/11/15.
//  Copyright (c) 2015 Syzygy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Search.h"
#import "CollectionCell.h"

@interface HomeViewController : UIViewController
{
    NSMutableArray *StatusArr;
    NSMutableArray *BrandArray;
    NSMutableArray *ExtraArray;
    NSMutableArray *allArray;
    
    BOOL isFiltered;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchObj;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionObj;


@end
