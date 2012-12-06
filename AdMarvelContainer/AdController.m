//
//  AdController.m
//
//  Created by Kevin Renskers on 10-07-12.
//  Copyright (c) 2012 Gangverk. All rights reserved.
//

#import "AdController.h"
#import "AppDelegate.h"
#import "Config.h"

@interface AdController ()
@property (copy, nonatomic) GetAdSuccessBlock successBlock;
@property (copy, nonatomic) InterstitialClosedBlock closedBlock;
@property (strong, nonatomic) AdMarvelView *adMarvelView;
@end


@implementation AdController

- (AdMarvelView *)adMarvelView {
    if (!_adMarvelView) _adMarvelView = [AdMarvelView createAdMarvelViewWithDelegate:self];
    return _adMarvelView;
}

- (void)getAdWithSuccessBlock:(GetAdSuccessBlock)successBlock {
    self.successBlock = successBlock;
    if (!self.siteId) {
        self.siteId = [Config config].adMarvelSiteId;
    }
    NSLog(@"Getting ad for site id %@", self.siteId);
    [self.adMarvelView getAdWithNotification];
}

- (void)openInterstitialWithClosedBlock:(InterstitialClosedBlock)closedBlock {
    self.closedBlock = closedBlock;
    if (!self.siteId) {
        self.siteId = [Config config].adMarvelSiteId;
    }
    NSLog(@"Getting intersitial for site id %@", self.siteId);
    [self.adMarvelView getInterstitialAd];
}

- (void)refreshAd {
    [self.adMarvelView getAd];
}

#pragma mark - AdMarvelDelegate

- (NSString *)partnerId {
    return [Config config].adMarvelPartnerId;
}

- (UIViewController *)applicationUIViewController {
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    return delegate.window.rootViewController;
}

- (BOOL)testingEnabled {
#if defined (ADMARVEL_TEST_ADS)
    return YES;
#endif
    return NO;
}

- (BOOL)locationServicesEnabled {
    return NO;
}

- (BOOL)animationsEnabled {
    return NO;
}

#pragma mark Callback methods

- (void)fullScreenWebViewActivated {
    NSLog(@"fullScreenWebViewActivated!");
}

- (void)fullScreenWebViewClosed {
    NSLog(@"fullScreenWebViewClosed!");
}

- (void)getAdSucceeded {
    self.successBlock(self.adMarvelView);
}

- (void)getAdFailed {
    NSLog(@"getAdFailed");
}

- (void)getInterstitialAdFailed {
    NSLog(@"getInterstitialAdFailed");
    if (self.closedBlock) {
        self.closedBlock();
    }
}

- (void)interstitialClosed {
    self.adMarvelView = nil;
    if (self.closedBlock) {
        self.closedBlock();
    }
}

- (void)getInterstitialAdSucceeded {
    BOOL success = [self.adMarvelView displayInterstitial];
    NSLog(@"getInterstitialAdSucceeded, displayed: %i", success);
    if (!success && self.closedBlock) {
        self.closedBlock();
    }
}

- (void)handleAdMarvelSDKClick:(NSString*)urlString {
    NSLog(@"handleAdMarvelSDKClick called with urlString = %@", urlString);
}

- (void)adDidExpand {
    NSLog(@"adDidExpand!");
}

- (void)adDidCollapse {
    NSLog(@"adDidCollapse!");
}

@end
