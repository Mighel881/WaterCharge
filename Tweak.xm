/* WaterWave Tweak file

Created for iOS 10 in mind and for novelity purposes because I was bored :P

Copyright 2017 iKilledAppl3, ToxicAppl3 Inc, and J.K. Hayslip

Based on JRMBubbleTutorial from Caroline Harrison on GitHub
URL: https://github.com/carleihar/JRMBubbleTutorial
Thanks much appreciated :) 

And many thanks to Bryan Antigua for BAFluidView :)

*/

//Headers we need to import 
#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>
#import "WaterWave.h"
#import <CoreMotion/CoreMotion.h>
#import "BAFluidView/BAFluidView.h"
#import "BAFluidView/UIColor+ColorWithHex.h"
#import <AudioToolbox/AudioToolbox.h>

//Bubble and Fish image path on the file system 
static NSString *fishImage = @"/Library/Application Support/WaterWave/fish.png";
//static NSString *bubbleImage = @"/Library/Application Support/WaterWave/bubble.png";

//BOOL values for tweak to enable or disable certain things :P	

//BOOL value to see if tweak is enabled;	
static BOOL kEnabled;


//Methods to hook and modify
%hook _SBLockScreenSingleBatteryChargingView
-(void)setBatteryVisible:(BOOL)arg1 {
	if (kEnabled == YES) {
		NO;
	}
	
	else {
		%orig;
	}
}

- (double)desiredVisibilityDuration {
	if (kEnabled == YES) {
		return 0.8;
	}
	
	else {
		return %orig;
	}
}

%end
	
%hook SBUIController
-(void)playConnectedToPowerSoundIfNecessary {
	if (kEnabled == YES) {
		nil;
	
	
	}
	
	else {
		%orig;
	}
}
%end

%hook SBDashBoardChargingViewController
-(void)viewDidLoad {
	if (kEnabled == YES) {
		%orig;
		SystemSoundID soundID;
	AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:bubbleSoundOff],&soundID);
	AudioServicesPlaySystemSound(soundID);
		windowVC = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
		windowVC.backgroundColor = [UIColor clearColor];
		[self.view addSubview:windowVC];
		blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];


UIVisualEffectView *visualEffectView;
visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

visualEffectView.frame = windowVC.bounds;
[windowVC addSubview:visualEffectView];

fishImageView = [[UIImageView alloc] initWithFrame:CGRectMake(windowVC.center.x - 100, windowVC.center.y - 100, 200, 200)];
fishImageView.image = [UIImage imageWithContentsOfFile:fishImage];
[windowVC addSubview:fishImageView];

	
//Water Effect for view :)	
BAFluidView *fluidView = [[BAFluidView alloc] initWithFrame:windowVC.frame startElevation:@0.3];
fluidView.strokeColor = [UIColor whiteColor];
fluidView.fillColor = [UIColor colorWithHex:0x397ebe];
//[fluidView keepStationary]; //optional
[fluidView startAnimation];
[fluidView startTiltAnimation];
[windowVC addSubview:fluidView];
	
}
 }
%end

//Prefs new 
//Using libcephei instead of the old crappy way
//ws.hbang.common is your friend 

HBPreferences *preferences;
extern NSString *const HBPreferencesDidChangeNotification;

//our constructor 
%ctor {

//write to a plist file to save data from user when they toggle on or off a feature 

    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.ikilledappl3.waterwave"];

      //check the bool value from the plist
	[preferences registerBool:&kEnabled default:NO forKey:@"kEnabled"];
}
