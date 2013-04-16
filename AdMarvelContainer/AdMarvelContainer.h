//
//  AdMarvelContainer.h
//
//  Created by Kevin Renskers on 10-07-12.
//  Copyright (c) 2012 Gangverk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdMarvelView.h"
#import "AdController.h"

@class AdMarvelContainer;
@protocol AdMarvelContainerDelegate <NSObject>

@optional
- (void)adMarvelContainerOpened:(AdMarvelContainer *)adMarvelContainer adMarvelView:(AdMarvelView *)adMarvelView;
- (void)adMarvelContainerClosed:(AdMarvelContainer *)adMarvelContainer adMarvelView:(AdMarvelView *)adMarvelView;
- (BOOL)adMarvelEnabled;
- (BOOL)hasCloseAdButton;
- (NSString *)adMarvelSiteId;
- (NSString *)adMarvelPartnerId;
- (CGRect)adMarvelViewFrame;
- (NSDictionary *)adMarvelTargetingParameters;

@end


@interface AdMarvelContainer : UIView

@property (weak, nonatomic) IBOutlet id <AdMarvelContainerDelegate> delegate;
@property (readonly, nonatomic) BOOL isLoaded;

- (BOOL)enabled;
- (void)refreshAd;
- (void)refreshAdWithSuccessBlock:(GetAdSuccessBlock)successBlock;
- (void)openAd;
- (void)closeAd;

@end
