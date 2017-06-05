#import "../WaterWave.h"

static NSString *waterWaveImage = @"/Library/Application Support/WaterWave/WaterWaveScreenshot.png";

@implementation WaterWaveListController
+ (NSString *)hb_specifierPlist {
    return @"WaterWave";
    
}

-(void)loadView {
    [super loadView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(shareTapped)];
    
    
}

+ (UIColor *)hb_tintColor {
    return [UIColor colorWithRed:0.0/255.0 green:119.0/255.0 blue:190.0/255.0 alpha:1.0];
}

- (void)shareTapped {
    NSString *text = [NSString stringWithFormat:@"Fishy why are you sleeping? Add a cool charging effect to your device with WaterCharge by @iKilledAppl3! http://toxicappl3inc.github.io/repo/"];
    
    UIImage *image = [UIImage imageWithContentsOfFile:waterWaveImage];
    NSArray * itemsToShare = @[text, image];
    
    if ([UIActivityViewController alloc]) {
        UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
        [(UINavigationController *)[super navigationController] presentViewController:activityViewController animated:YES completion:NULL];
    }else {
        //awesomeness
    }
}

-(void)respring {
    if ([NSProcessInfo.processInfo isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){10,0}]){
        system ("killall -9 SpringBoard");
    }
    
    if ([NSProcessInfo.processInfo isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){10,0,1}]){
        system ("killall -9 SpringBoard");
    }
    
    if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){.majorVersion = 10, .minorVersion = 1, .patchVersion = 0}]) {
        system ("killall -9 SpringBoard");
    }
    
    if ([NSProcessInfo.processInfo isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){10,1,1}]){
        system ("killall -9 SpringBoard");
    }
    
    else {
        system ("killall -9 backboardd");	
    }
    
}

@end

// vim:ft=objc
