//
//  SubclassOfPaperCollectionViewCell.m
//  BFPaperCollectionViewCell
//
//  This is an example of how to subclass BFPaperCollectionViewCell.
//  Note that you MUST call [super awakeFromNib] from within awakeFromNib!
//
//  Created by Bence Feher on 11/14/14.
//  Copyright (c) 2014 Bence Feher. All rights reserved.
//
//  Converted from BFPaperTableViewCell by Benjamin Truitt https://github.com/benvolioT
//

#import "SubclassOfPaperCollectionViewCell.h"
#import "UIColor+BFPaperColors.h"

@implementation SubclassOfPaperCollectionViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self customSetup];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    [super awakeFromNib];   // THIS IS NECESSARY!
    [self customSetup];
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    // This is a good place to call your custom setup function.
    [self customSetup];
}

- (void)customSetup
{
    // Even though defaults values are cool, I'm setting all of the customizable options here as an example:
    self.tapCircleColor = [[UIColor paperColorLimeA400] colorWithAlphaComponent:0.6f];
    self.tapCircleDiameter = bfPaperCollectionViewCell_tapCircleDiameterSmall;
    self.rippleFromTapLocation = YES;
    self.backgroundFadeColor = [UIColor colorWithWhite:1 alpha:0.2f];
    self.letBackgroundLinger = YES;
    
//    CGRect maskRect = CGRectMake(5, 5, 10, 10);
//    self.maskPath = [UIBezierPath bezierPathWithRoundedRect:maskRect cornerRadius:5.f];    // Just to show this property exists.

    // Other setup (eg. text labels, image views, etc.):
}

@end
