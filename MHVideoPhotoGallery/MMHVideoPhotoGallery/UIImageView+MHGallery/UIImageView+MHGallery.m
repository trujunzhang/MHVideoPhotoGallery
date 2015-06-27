//
//  UIImageView+MHGallery.m
//  MHVideoPhotoGallery
//
//  Created by Mario Hahn on 06.02.14.
//  Copyright (c) 2014 Mario Hahn. All rights reserved.
//

#import "UIImageView+MHGallery.h"
#import "MHGallery.h"


@implementation UIImageView (MHGallery)

- (void)setImageForMHGalleryItem:(MHGalleryItem *)item
                       imageType:(MHImageType)imageType
                    successBlock:(void (^)(UIImage *image, NSError *error))succeedBlock {
    if (item.image) {
        [self setImageForImageView:item.image successBlock:succeedBlock];
    }
}

- (void)setImageForImageView:(UIImage *)image
                successBlock:(void (^)(UIImage *image, NSError *error))succeedBlock {

    self.image = image;
    [self setNeedsLayout];

    if (succeedBlock) {
        succeedBlock(image, nil);
    }
}




@end
