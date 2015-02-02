//
//  BFPaperViewController.m
//  BFPaperCollectionViewCell
//
//  Created by Bence Feher on 7/17/14.
//  Copyright (c) 2014 Bence Feher. All rights reserved.
//
//  Converted from BFPaperTableViewCell by Benjamin Truitt https://github.com/benvolioT
//
// The MIT License (MIT)
//
// Copyright (c) 2014 Bence Feher
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.


/****************************************************/
/*                  !!! NOTE !!!                    */
/* This file is basically copypasta of              */
/* BFPaperTableViewCell's BFPaperViewController.m.  */
/* There is a lot of code here that isn't used for  */
/* this demo but is used in the                     */
/* BFPaperTableViewCell version. Sorry and enjoy.   */
/****************************************************/


#import "BFPaperViewController.h"
// Classes:
#import "SubclassOfPaperCollectionViewCell.h"
// Pods:
#import "UIColor+BFPaperColors.h"



@interface BFPaperViewController ()
@property NSArray *colors;
@end

@implementation BFPaperViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"BFPaperCollectionViewCell";
    
    // Register BFPaperCollectionViewCell for our tableView:
    [self.collectionView registerClass:[SubclassOfPaperCollectionViewCell class] forCellWithReuseIdentifier:@"BFPaperCell"];
    
    // Fill up an array with all the basic BFPaperColors:
    self.colors = @[[UIColor paperColorRed], [UIColor paperColorPink], [UIColor paperColorPurple], [UIColor paperColorDeepPurple], [UIColor paperColorIndigo], [UIColor paperColorBlue], [UIColor paperColorLightBlue], [UIColor paperColorCyan], [UIColor paperColorTeal], [UIColor paperColorGreen], [UIColor paperColorLightGreen], [UIColor paperColorLime], [UIColor paperColorYellow], [UIColor paperColorAmber], [UIColor  paperColorDeepOrange], [UIColor paperColorBrown], [UIColor paperColorGray], [UIColor paperColorBlueGray], [UIColor paperColorGray700], [UIColor paperColorGray700]];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.7 green:0.98 blue:0.7 alpha:1];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIImageView *bgIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg-blue-white-arrow"]];
    bgIV.contentMode = UIViewContentModeScaleAspectFill;
    bgIV.frame = self.collectionView.frame;
    self.collectionView.backgroundView = bgIV;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - collection view delegate
//- (void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Every 5th cell gets to push:
//    if (indexPath.row % 5 == 0) {
//        [self performSegueWithIdentifier:@"push" sender:self];
//    }
//}


#pragma mark - collection view data source
    
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.colors.count * 2; // We will have one set of cells with a white background and colored text, and one set with a colored background and white text.
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SubclassOfPaperCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BFPaperCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    // This is a whole bunch of really BAD ways to customize cells that I'm, just doing for the demo.
    // I hope you won't attempt to customize your cells in such a way and would rather sub-class BFPaperCollectionViewCell and do your customizations in said subclass.
    // Or at least just don't do it like this ;p
    
    // TODO: we should subclass and add a label in the subclass so that we can label the example cells. Commenting out the
    //       label setup for now.
    
    // Even indexed cells will ripple from the center while odd ones will ripple from tap location:
    if (indexPath.row % 2 == 0) {
        cell.rippleFromTapLocation = NO;
        //cell.textLabel.text = @"Ripple from Center";
    }
    else {
        cell.rippleFromTapLocation = YES;
        //cell.textLabel.text = @"Ripple from tap location";
    }

    // Demo clear cell:
    if (indexPath.row == 0) {
        cell.backgroundColor = [UIColor clearColor];
        //cell.textLabel.textColor = [UIColor paperColorLimeA400];
        //cell.textLabel.text = @"Clear";
        cell.tapCircleDiameter = bfPaperCollectionViewCell_tapCircleDiameterFull;
    }
    // The rest of the first half should be white with colored text:
    else if (indexPath.row < self.colors.count){
        cell.backgroundColor = [UIColor whiteColor];
        //cell.textLabel.textColor = [self.colors objectAtIndex:indexPath.row];
        cell.tapCircleDiameter = bfPaperCollectionViewCell_tapCircleDiameterFull;
    }
    // After that, just color their background and give them white text:
    else if (!(indexPath.row > (self.colors.count * 2) - 3)) {
        cell.backgroundColor = [self.colors objectAtIndex:indexPath.row % self.colors.count];
        //cell.textLabel.textColor = [UIColor whiteColor];
        cell.tapCircleDiameter = bfPaperCollectionViewCell_tapCircleDiameterFull;
    }
    // Customize last two cells:
    else {//if (indexPath.row > (self.colors.count * 2) - 3) {
        //cell.textLabel.text = @"Customized!";
        cell.backgroundColor = [UIColor paperColorDeepPurple];
        //cell.textLabel.textColor = [UIColor paperColorLightBlue];
        cell.tapCircleDiameter = bfPaperCollectionViewCell_tapCircleDiameterSmall;
        cell.tapCircleColor = [[UIColor paperColorLimeA400] colorWithAlphaComponent:0.7];
        cell.backgroundFadeColor = [UIColor whiteColor];
        cell.letBackgroundLinger = NO;
    }
    
    //cell.textLabel.backgroundColor = [UIColor clearColor];  // If it's not clear, the tap circles and fade layers are occluded by this label's background.
    
    return cell;
}

@end
