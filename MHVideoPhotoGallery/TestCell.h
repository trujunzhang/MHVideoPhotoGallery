//
// Created by djzhang on 6/27/15.
// Copyright (c) 2015 Mario Hahn. All rights reserved.
//


#import "MHGallery.h"

@interface TestCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UIView *backView;

@property(nonatomic, strong) NSArray *cellDataSource;

@property(nonatomic, strong) UIViewController *viewController;

- (void)configureCell:(NSInteger)section withCellDataSource:(NSArray *)cellDataSource forViewController:(UIViewController *)viewController;
@end

