//
// Created by djzhang on 7/5/15.
// Copyright (c) 2015 Mario Hahn. All rights reserved.
//


@interface TestCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UIView *backView;

- (void)configureCell;
@end


