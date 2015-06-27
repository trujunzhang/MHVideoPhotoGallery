//
//  ExampleViewController.h
//  MHVideoPhotoGallery
//
//  Created by Mario Hahn on 30.09.13.
//  Copyright (c) 2013 Mario Hahn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MHGallery.h"

@interface UINavigationController (autoRotate)
@end


@interface UITabBarController (autoRotate)
@end

@interface ExampleViewControllerCollectionViewInTableView : UIViewController<UITableViewDataSource,UITableViewDelegate,UIViewControllerTransitioningDelegate,MHGalleryDataSource,MHGalleryDelegate>
@property (strong,nonatomic) IBOutlet UITableView *tableView;
@end


