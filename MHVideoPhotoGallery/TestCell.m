//
// Created by djzhang on 6/27/15.
// Copyright (c) 2015 Mario Hahn. All rights reserved.
//

#import "ExampleViewControllerCollectionViewInTableView.h"
#include "TestCell.h"

@implementation TestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)configureCell:(NSInteger)section withCellDataSource:(NSArray*)cellDataSource {
    
    self.cellDataSource = cellDataSource;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 25, 0, 25);
    layout.itemSize = CGSizeMake(270, 225);
    layout.minimumLineSpacing = 15;
    layout.minimumInteritemSpacing = 15;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.collectionViewLayout = layout;

    [self.collectionView registerClass:[MHMediaPreviewCollectionViewCell class] forCellWithReuseIdentifier:@"MHMediaPreviewCollectionViewCell"];

    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;

    [self.collectionView setShowsHorizontalScrollIndicator:NO];
    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];
    [self.collectionView setTag:section];
    [self.collectionView reloadData];
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = nil;
    NSString *cellIdentifier = @"MHMediaPreviewCollectionViewCell";
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    NSIndexPath *indexPathNew = [NSIndexPath indexPathForRow:indexPath.row inSection:collectionView.tag];
    [self makeOverViewDetailCell:(MHMediaPreviewCollectionViewCell *) cell atIndexPath:indexPathNew];

    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    UIImageView *imageView = [(MHMediaPreviewCollectionViewCell *) [collectionView cellForItemAtIndexPath:indexPath] thumbnail];

    NSArray *galleryData = self.galleryDataSource[collectionView.tag];

    MHGalleryController *gallery = [MHGalleryController galleryWithPresentationStyle:MHGalleryViewModeImageViewerNavigationBarShown];
    gallery.galleryItems = galleryData;
    gallery.presentingFromImageView = imageView;
    gallery.presentationIndex = indexPath.row;
    // gallery.UICustomization.hideShare = YES;
    //  gallery.galleryDelegate = self;
    //  gallery.dataSource = self;
    __weak MHGalleryController *blockGallery = gallery;

    gallery.finishedCallback = ^(NSInteger currentIndex, UIImage *image, MHTransitionDismissMHGallery *interactiveTransition, MHGalleryViewMode viewMode) {
        if (viewMode == MHGalleryViewModeOverView) {
            [blockGallery dismissViewControllerAnimated:YES completion:^{
                [self setNeedsStatusBarAppearanceUpdate];
            }];
        } else {
            NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:currentIndex inSection:0];
            CGRect cellFrame = [[collectionView collectionViewLayout] layoutAttributesForItemAtIndexPath:newIndexPath].frame;
            [collectionView scrollRectToVisible:cellFrame
                                       animated:NO];

            dispatch_async(dispatch_get_main_queue(), ^{
                [collectionView reloadItemsAtIndexPaths:@[newIndexPath]];
                [collectionView scrollToItemAtIndexPath:newIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];

                MHMediaPreviewCollectionViewCell *cell = (MHMediaPreviewCollectionViewCell *) [collectionView cellForItemAtIndexPath:newIndexPath];

                [blockGallery dismissViewControllerAnimated:YES dismissImageView:cell.thumbnail completion:^{

                    [self setNeedsStatusBarAppearanceUpdate];

                    MPMoviePlayerController *player = interactiveTransition.moviePlayer;

                    player.controlStyle = MPMovieControlStyleEmbedded;
                    player.view.frame = cell.bounds;
                    player.scalingMode = MPMovieScalingModeAspectFill;
                    [cell.contentView addSubview:player.view];
                }];
            });
        }
    };
    [self presentMHGalleryController:gallery animated:YES completion:nil];
}


- (void)makeOverViewDetailCell:(MHMediaPreviewCollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    MHGalleryItem *item = self.galleryDataSource[indexPath.section][indexPath.row];
    cell.thumbnail.contentMode = UIViewContentModeScaleAspectFill;

    cell.thumbnail.layer.shadowOffset = CGSizeMake(0, 0);
    cell.thumbnail.layer.shadowRadius = 1.0;
    cell.thumbnail.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.thumbnail.layer.shadowOpacity = 0.5;
    cell.thumbnail.layer.shadowPath = [UIBezierPath bezierPathWithRect:cell.thumbnail.bounds].CGPath;
    cell.thumbnail.layer.cornerRadius = 2.0;

//    cell.thumbnail.image = nil;
    cell.thumbnail.image = item.image;
//    cell.galleryItem = item;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.galleryDataSource[collectionView.tag] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSArray *)getCellGallaryDataSource{
    
    return @[@""];
}

@end