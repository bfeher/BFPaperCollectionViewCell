BFPaperCollectionViewCell
====================
[![CocoaPods](https://img.shields.io/cocoapods/v/BFPaperCollectionViewCell.svg?style=flat)](https://github.com/bfeher/BFPaperCollectionViewCell)

> A subclass of UICollectionViewCell inspired by Google's Material Design: Paper Elements. Based on [BFPaperTableViewCell](https://github.com/bfeher/BFPaperTableViewCell), written by [Benjamin Truitt](https://github.com/benvolioT)

About
---------
### Now with smoother animations and more public properties for even easier customization!

_BFPaperCollectionViewCell_ is a subclass of UICollectionViewCell that behaves much like the new paper cells from Google's Material Design Labs.
All animation are asynchronous and are performed on sublayers.
_BFPaperCollectionViewCells_ work right away with pleasing default behaviors, however they can be easily customized! The tap-circle color, background fade color, background fade alpha, background highlight (linger or fade away), tap-circle ripple locaiton, and tap-circle diameter are all readily customizable via public properties.

## Properties
`CGFloat touchDownAnimationDuration` <br />
A CGFLoat representing the duration of the animations which take place on touch DOWN! Default is `0.25f` seconds. (Go Steelers)

`CGFloat touchUpAnimationDuration` <br />
A CGFLoat representing the duration of the animations which take place on touch UP! Default is `2 * touchDownAnimationDuration` seconds.

`CGFloat tapCircleDiameterStartValue` <br />
A CGFLoat representing the diameter of the tap-circle as soon as it spawns, before it grows. Default is `5.f`.

`CGFloat tapCircleDiameter` <br />
The CGFloat value representing the Diameter of the tap-circle. By default it will be the result of `MAX(self.frame.width, self.frame.height)`. `tapCircleDiameterFull` will calculate a circle that always fills the entire view. Any value less than or equal to `tapCircleDiameterFull` will result in default being used. The constants: `tapCircleDiameterLarge`, `tapCircleDiameterMedium`, and `tapCircleDiameterSmall` are also available for use. */

`CGFloat tapCircleBurstAmount` <br />
The CGFloat value representing how much we should increase the diameter of the tap-circle by when we burst it. Default is `40.f`.

`UIColor *tapCircleColor` <br />
The UIColor to use for the circle which appears where you tap. NOTE: Setting this defeats the "Smart Color" ability of the tap circle. Alpha values less than `1` are recommended.

`UIColor *backgroundFadeColor` <br />
The UIColor to fade clear backgrounds to. NOTE: Setting this defeats the "Smart Color" ability of the background fade. Alpha values less than `1` are recommended.

`BOOL rippleFromTapLocation` <br />
A flag to set to `YES` to have the tap-circle ripple from point of touch. If this is set to `NO`, the tap-circle will always ripple from the center of the view. Default is `YES`.

`BOOL letBackgroundLinger`<br />
A BOOL flag that determines whether or not to keep the background around after a tap, essentially "highlighting/selecting" the cell. Note that this does not trigger `setSelected:`! It is purely aesthetic. Also this kinda clashes with `cell.selectionStyle`, so by defualt the constructor sets that to `UITableViewCellSelectionStyleNone`. Default is YES.

`BOOL alwaysCompleteFullAnimation` <br />
A BOOL flag indicating whether or not to always complete a full animation cycle (bg fade in, tap-circle grow and burst, bg fade out) before starting another one. NO will behave just like the other BFPaper controls, tapping rapidly spawns many circles which all fade out in turn. Default is `YES`.

`CGFloat tapDelay` <br />
A CGFLoat to set the amount of time in seconds to delay the tap event / trigger to spawn circles. For example, if the tapDelay is set to `1.f`, you need to press and hold the cell for 1 second to trigger spawning a circle. Default is `0.1f`.

`UIBezierPath *maskPath`<br />
A UIBezierPath you can set to override the mask path of the ripples and background fade. Set this if you have a custom path for your cell. If this is `nil`, BFPaperTableViewCell will try its best to provide a correct mask. Default is `nil`.


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


CocoaPods
-------

CocoaPods are the best way to manage library dependencies in Objective-C projects.
Learn more at http://cocoapods.org

Add this to your podfile to add _BFPaperCollectionViewCell_ to your project.
```ruby
platform :ios, '7.1'
pod 'BFPaperCollectionViewCell'
```


License
--------
_BFPaperCollectionViewCell_ uses the MIT License:

> Please see included LICENSE file.
