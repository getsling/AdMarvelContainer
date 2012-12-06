//
//  AdController.h
//
//  Created by Kevin Renskers on 10-07-12.
//  Copyright (c) 2012 Gangverk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdMarvelDelegate.h"
#import "AdMarvelView.h"

typedef void (^GetAdSuccessBlock)(AdMarvelView *adMarvelView);
typedef void (^InterstitialClosedBlock)();

@class AdMarvelView;

@interface AdController : NSObject <AdMarvelDelegate>

@property (strong, nonatomic) NSString *siteId;
@property (nonatomic) CGRect frame;

- (void)getAdWithSuccessBlock:(GetAdSuccessBlock)successBlock;
- (void)openInterstitialWithClosedBlock:(InterstitialClosedBlock)closedBlock;
- (void)refreshAd;

@end
