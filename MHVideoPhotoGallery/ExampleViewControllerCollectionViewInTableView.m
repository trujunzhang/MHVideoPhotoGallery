//
//  ExampleViewController.m
//  MHVideoPhotoGallery
//
//  Created by Mario Hahn on 30.09.13.
//  Copyright (c) 2013 Mario Hahn. All rights reserved.
//

#import "ExampleViewControllerCollectionViewInTableView.h"
#import "MHOverviewController.h"
#include "TestCell.h"

@implementation UITabBarController (autoRotate)
- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}

- (NSUInteger)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}


@end


@implementation UINavigationController (autoRotate)

- (UIStatusBarStyle)preferredStatusBarStyle {
    return [self.viewControllers.lastObject preferredStatusBarStyle];
}

- (BOOL)shouldAutorotate {
    return [self.viewControllers.lastObject shouldAutorotate];
}

- (NSUInteger)supportedInterfaceOrientations {
    return [self.viewControllers.lastObject supportedInterfaceOrientations];
}

@end


@interface ExampleViewControllerCollectionViewInTableView ()
@property(nonatomic, strong) NSArray *galleryDataSource;
@end

@implementation ExampleViewControllerCollectionViewInTableView

- (void)viewDidLoad {
    [super viewDidLoad];


    self.title = @"CollectionView";

    MHGalleryItem *localVideo = [MHGalleryItem.alloc initWithURL:[[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Sydney-iPhone" ofType:@"m4v"]] absoluteString]
                                                     galleryType:MHGalleryTypeVideo];

    MHGalleryItem *youtube = [MHGalleryItem.alloc initWithURL:@"http://www.youtube.com/watch?v=YSdJtNen-EA"
                                                  galleryType:MHGalleryTypeVideo];

    MHGalleryItem *vimeo0 = [MHGalleryItem.alloc initWithURL:@"http://vimeo.com/35515926"
                                                 galleryType:MHGalleryTypeVideo];
    MHGalleryItem *vimeo1 = [MHGalleryItem.alloc initWithURL:@"http://vimeo.com/50006726"
                                                 galleryType:MHGalleryTypeVideo];
    MHGalleryItem *vimeo3 = [MHGalleryItem.alloc initWithURL:@"http://vimeo.com/66841007"
                                                 galleryType:MHGalleryTypeVideo];

    MHGalleryItem *landschaft = [[MHGalleryItem alloc] initWithImage:[UIImage imageNamed:@"rest01.jpg"]];
    MHGalleryItem *landschaft1 = [[MHGalleryItem alloc] initWithImage:[UIImage imageNamed:@"rest02.jpeg"]];
    MHGalleryItem *landschaft2 = [[MHGalleryItem alloc] initWithImage:[UIImage imageNamed:@"rest03.jpeg"]];
    MHGalleryItem *landschaft3 = [[MHGalleryItem alloc] initWithImage:[UIImage imageNamed:@"rest04.jpeg"]];


    MHGalleryItem *landschaft4 = [MHGalleryItem.alloc initWithURL:@"http://alles-bilder.de/landschaften/HD%20Landschaftsbilder%20(42).jpg"
                                                      galleryType:MHGalleryTypeImage];

    MHGalleryItem *landschaft5 = [MHGalleryItem.alloc initWithURL:@"http://woxx.de/wp-content/uploads/sites/3/2013/02/8X2cWV3.jpg"
                                                      galleryType:MHGalleryTypeImage];

    MHGalleryItem *landschaft6 = [MHGalleryItem.alloc initWithURL:@"http://kwerfeldein.de/wp-content/uploads/2012/05/Sharpened-version.jpg"
                                                      galleryType:MHGalleryTypeImage];

    MHGalleryItem *landschaft7 = [MHGalleryItem.alloc initWithURL:@"http://eswalls.com/wp-content/uploads/2014/01/sunset-glow-trees-beautiful-scenery.jpg"
                                                      galleryType:MHGalleryTypeImage];

    MHGalleryItem *landschaft8 = [MHGalleryItem.alloc initWithURL:@"http://eswalls.com/wp-content/uploads/2014/01/beautiful_scenery_wallpaper_The_Eiffel_Tower_at_night_.jpg"
                                                      galleryType:MHGalleryTypeImage];

    MHGalleryItem *landschaft9 = [MHGalleryItem.alloc initWithURL:@"http://p1.pichost.me/i/40/1638707.jpg"
                                                      galleryType:MHGalleryTypeImage];

    MHGalleryItem *landschaft10 = [MHGalleryItem.alloc initWithURL:@"http://4.bp.blogspot.com/-8O0ZkAgb6Bo/Ulf_80tUN6I/AAAAAAAAH34/I1L2lKjzE9M/s1600/Beautiful-Scenery-Wallpapers.jpg"
                                                       galleryType:MHGalleryTypeImage];

    MHGalleryItem *landschaft11 = [MHGalleryItem.alloc initWithURL:@"http://www.bestfon.info/images/joomgallery/originals/paisajes_18/paisaje_325_20120501_1124813185.jpg"
                                                       galleryType:MHGalleryTypeImage];
    MHGalleryItem *landschaft12 = [MHGalleryItem.alloc initWithURL:@"http://www.stadt-bad-reichenhall.de/medien/landschaft-winter-1.jpg"
                                                       galleryType:MHGalleryTypeImage];
    MHGalleryItem *landschaft13 = [MHGalleryItem.alloc initWithURL:@"http://www.foto-zumstein.ch/fotogalerie/1195564506_Kopie_vonLandschaft_33.jpg"
                                                       galleryType:MHGalleryTypeImage];
    MHGalleryItem *landschaft14 = [MHGalleryItem.alloc initWithURL:@"http://img.galerie.chip.de/imgserver/communityimages/233900/233952/1280x.jpg"
                                                       galleryType:MHGalleryTypeImage];
    MHGalleryItem *landschaft15 = [MHGalleryItem.alloc initWithURL:@"http://www.spreephoto.de/wp-content/uploads/2011/03/toskana-strohballen-landschaft.jpg"
                                                       galleryType:MHGalleryTypeImage];
    MHGalleryItem *landschaft16 = [MHGalleryItem.alloc initWithURL:@"http://kwerfeldein.de/wp-content/uploads/2012/07/landschaft.jpg"
                                                       galleryType:MHGalleryTypeImage];

    MHGalleryItem *landschaft17 = [MHGalleryItem.alloc initWithURL:@"http://www.picspack.de/blog/wp-content/uploads/2011/11/Liu2.jpg"
                                                       galleryType:MHGalleryTypeImage];

    MHGalleryItem *landschaft18 = [MHGalleryItem.alloc initWithURL:@"http://images.fotocommunity.de/bilder/bach-fluss-see/see-teich-tuempel/symmetrische-landschaft-645f1ee5-f53b-4ae9-ad76-7bf5bde3935d.jpg"
                                                       galleryType:MHGalleryTypeImage];

    MHGalleryItem *landschaft19 = [MHGalleryItem.alloc initWithURL:@"http://www.hd-gbpics.de/gbbilder/landschaften/landschaft10.jpg"
                                                       galleryType:MHGalleryTypeImage];

    MHGalleryItem *landschaft20 = [MHGalleryItem.alloc initWithURL:@"http://www.stadt-bad-reichenhall.de/medien/landschaft-1.jpg"
                                                       galleryType:MHGalleryTypeImage];

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"Awesome!!\nOr isn't it?"];

    [string setAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} range:NSMakeRange(0, string.length)];
    [string setAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:17]} range:NSMakeRange(0, 9)];

    landschaft10.attributedString = string;

    self.galleryDataSource = @[
            @[landschaft,landschaft1,landschaft2,landschaft3],
            @[vimeo3, youtube, vimeo0, vimeo1, landschaft9, landschaft6, landschaft5, landschaft4, landschaft3, landschaft2, landschaft, landschaft1],
            @[landschaft9, landschaft6, localVideo, landschaft5, landschaft4, landschaft3, landschaft2, landschaft, landschaft1]
            ];
//    self.galleryDataSource = @[@[landschaft, landschaft1, landschaft2, landschaft3, landschaft4, landschaft5, landschaft6, landschaft7, landschaft8, landschaft9, landschaft10, landschaft11, landschaft12, landschaft13, landschaft14, landschaft15, landschaft16, landschaft17, landschaft18, landschaft19, landschaft20],
//            @[vimeo3, youtube, vimeo0, vimeo1, landschaft9, landschaft6, landschaft5, landschaft4, landschaft3, landschaft2, landschaft, landschaft1],
//            @[landschaft9, landschaft6, localVideo, landschaft5, landschaft4, landschaft3, landschaft2, landschaft, landschaft1]
//    ];
    self.tableView.backgroundColor = [UIColor colorWithRed:0.83 green:0.84 blue:0.86 alpha:1];
    [self.tableView reloadData];

    [self setNeedsStatusBarAppearanceUpdate];

}


- (UIStatusBarStyle)preferredStatusBarStyle {
    if ([self.presentedViewController isKindOfClass:[MHGalleryController class]]) {
        MHGalleryController *gallerController = (MHGalleryController *) self.presentedViewController;
        return gallerController.preferredStatusBarStyleMH;
    }
    return UIStatusBarStyleDefault;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.galleryDataSource.count;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 330;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = nil;
    cellIdentifier = @"TestCell";

    TestCell *cell = (TestCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (!cell) {
        cell = [[TestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell configureCell:indexPath.section source: self.galleryDataSource[indexPath.section] forViewController:self];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (NSInteger)numberOfItemsInGallery:(MHGalleryController *)galleryController {
    return 10;
}

- (MHGalleryItem *)itemForIndex:(NSInteger)index {
    // You also have to set the image in the Testcell to get the correct Animation
    //    return [MHGalleryItem.alloc initWithImage:nil];
    return [MHGalleryItem itemWithImage:[UIImage imageNamed:@"twitterMH"]];
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    return YES;
}


@end
