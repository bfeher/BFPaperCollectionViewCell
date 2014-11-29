BFPaperCollectionViewCell
====================
> A subclass of UICollectionViewCell inspired by Google's Material Design: Paper Elements. Based on [BFPaperTableViewCell](https://github.com/bfeher/BFPaperTableViewCell)

About
---------
_BFPaperCollectionViewCell_ is a subclass of UICollectionViewCell that behaves much like the new paper cells from Google's Material Design Labs.
All animation are asynchronous and are performed on sublayers.
_BFPaperCollectionViewCells_ work right away with pleasing default behaviors, however they can be easily customized! The tap-circle color, background fade color, background fade alpha, background highlight (linger or fade away), tap-circle ripple locaiton, and tap-circle diameter are all readily customizable via public properties.

## Properties
`UIColor *tapCircleColor` <br />
The UIColor to use for the circle which appears where you tap. NOTE: Setting this defeats the "Smart Color" ability of the tap circle. Alpha values less than 1 are recommended.

`UIColor *backgroundFadeColor` <br />
The UIColor to fade the background to. NOTE: Setting this defeats the "Smart Color" ability of the background fade. An alpha value of 1 is recommended, as the fade is a constant (`bfPaperCell_fadeConstant`) defined in the BFPaperCollectionViewCell.m. This bothers me too.

`CGFloat backgroundFadeAlpha` <br />
A CGFloat value between 0 and 1 to which the background will fade into upon selection. Default is `bfPaperCell_fadeConstant` which is defined in BFPaperCollectionViewCell.m.

`BOOL letBackgroundLinger`<br />
A BOOL flag that determines whether or not to keep the background around after a tap, essentially "highlighting/selecting" the cell. Purely aesthetic. Default is YES.

`CGFloat tapCircleDiameter` <br />
The CGFloat value representing the Diameter of the tap-circle. By default it will be calculated to almost be big enough to cover up the whole background. Any value less than zero will result in default being used. Three pleasing sizes, `bfPaperCollectionViewCell_tapCircleDiameterSmall`, `bfPaperCollectionViewCell_tapCircleDiameterMedium`, and `bfPaperCollectionViewCell_tapCircleDiameterLarge` are also available for use.

`BOOL rippleFromTapLocation`<br />
A flag to set to YES to have the tap-circle ripple from point of touch. If this is set to NO, the tap-circle will always ripple from the center of the button. Default is YES.


Usage
---------
Add the _BFPaperCollectionViewCell_ header and implementation file to your project. (.h & .m)

After that, you can use it just like any other `UICollectionViewCell`. 

If you use storyboards with prototype cells, be sure to change the prototype cell's class to _BFPaperCollectionViewCell_, and be sure to set the reuse identifier to that with which you register in the below code snippet!

###Example
```objective-c
// Register BFPaperCollectionViewCell for our collectionView in viewDidLoad:
- (void)viewDidLoad
{
  ...
  [self.collectionView registerClass:[BFPaperCollectionViewCell class] forCellWithReuseIdentifier:@"BFPaperCell"];
  ...
}


- (UICollectionViewCell *)tableView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  BFPaperCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BFPaperCell" forIndexPath:indexPath];

  cell.rippleFromTapLocation = NO; // Will always ripple from center if NO.
  cell.tapCircleColor = [[UIColor paperColorDeepPurple] colorWithAlphaComponent:0.3f];
  cell.backgroundFadeColor = [UIColor paperColorBlue];
  cell.backgroundFadeAlpha = 0.7f;
  cell.letBackgroundLinger = NO;
  cell.tapCircleDiameter = bfPaperCollectionViewCell_tapCircleDiameterSmall;
  return cell;
}
```


Cocoapods
-------

CocoaPods are the best way to manage library dependencies in Objective-C projects.
Learn more at http://cocoapods.org

Add this to your podfile to add _BFPaperCollectionViewCell_ to your project.
```ruby
platform :ios, '7.0'
pod 'BFPaperCollectionViewCell', '~> 1.0.0'
```


License
--------
_BFPaperCollectionViewCell_ uses the MIT License:

> Please see included LICENSE file.
