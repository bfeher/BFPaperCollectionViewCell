BFPaperCollectionViewCell
====================
[![CocoaPods](https://img.shields.io/cocoapods/v/BFPaperCollectionViewCell.svg?style=flat)](https://github.com/bfeher/BFPaperCollectionViewCell)

> Note that this changelog was started very late, at roughly the time between version 2.1.17 and 2.2.2. Non consecutive jumps in changelog mean that there were incremental builds that weren't released as a pod, typically while solving a problem.



2.3.4
---------
+ Migrated to Cocoapods 1.0.


2.3.3
---------
+ ^ Updated pods.


2.3.2
---------
+ + Added new property, UIBezierPath *maskPath.


2.2.2
---------
+ Added a changelog!
+ Added public property `tapDelay` to allow control over whether or not to spawn a tap circle. If the touch ends or is cancelled before the tap-delay is complete, no circles will be spawned. Default is `0.1f`.
+ Applied changes from BFPaperTableViewCell thanks to user @eithanshavit, bringing back support for a tapDelay of 0.
- Removed vestigial private property `letGo`.
- Removed vestigial private property `beganHighlight`.
- Removed vestigial private property `beganSelection`.
- Removed vestigial private property `bAlreadyFadedBackgroundIn`.
- Removed vestigial private property `bAlreadyFadedBackgroundOut`.