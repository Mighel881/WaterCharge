/* WaterWave Header file
Contains classes and possible methods that we may need for the tweak.

Created for iOS 10 in mind and for novelity purposes because I was bored :P

Copyright 2017 iKilledAppl3, ToxicAppl3 Inc, and J.K. Hayslip

Based on JRMBubbleTutorial from Caroline Harrison on GitHub
URL: https://github.com/carleihar/JRMBubbleTutorial
Thanks much appreciated :) 


*/

//Headers we need 
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <CepheiPrefs/HBListController.h>
#import <CepheiPrefs/HBTintedTableCell.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBTwitterCell.h>
#import <CepheiPrefs/HBImageTableCell.h>
#import <CepheiPrefs/HBPackageNameHeaderCell.h>

//Preferences Interface
@interface WaterWaveListController : HBListController {
	
}
@end


//Charging View interface
@interface SBDashBoardChargingViewController :  UIViewController {
	UIView* _chargingView;
}
@end

//Charging sound
NSString *bubbleSoundOff = [[NSBundle bundleWithPath:@"/Library/Application Support/WaterWave/"] pathForResource:@"bubble" ofType:@"caf"];


UIView *windowVC;
UIImageView *fishImageView;
UIImageView *bubbleImageView;
UIBlurEffect *blurEffect;

