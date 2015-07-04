//
// Created by djzhang on 7/5/15.
// Copyright (c) 2015 Mario Hahn. All rights reserved.
//

#import "ExampleViewControllerCollectionViewInTableView.h"
#include "TestCell.h"

@implementation TestCell


- (void)configureCell {
//    [self setupEffect];
}

- (void)setupEffect {
    self.backView.layer.masksToBounds = NO;
    self.backView.layer.shadowOffset = CGSizeMake(0, 0);
    self.backView.layer.shadowRadius = 1.0;
    self.backView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.backView.layer.shadowOpacity = 0.5;
    self.backView.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.backView.bounds].CGPath;
    self.backView.layer.cornerRadius = 2.0;
}


@end