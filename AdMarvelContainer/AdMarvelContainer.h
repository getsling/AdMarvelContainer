//
//  AdMarvelContainer.h
//
//  Created by Kevin Renskers on 10-07-12.
//  Copyright (c) 2012 Gangverk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdMarvelView.h"

@class AdMarvelContainer;
@protocol AdMarvelContainerDelegate <NSObject>

@required
- (void)adMarvelContainerOpened:(AdMarvelContainer *)adMarvelContainer adMarvelView:(AdMarvelView *)adMarvelView;
- (void)adMarvelContainerClosed:(AdMarvelContainer *)adMarvelContainer adMarvelView:(AdMarvelView *)adMarvelView;

@optional
- (BOOL)adMarvelEnabled;
- (NSString *)adMarvelSiteId;
- (CGRect)adMarvelViewFrame;

@end


@interface AdMarvelContainer : UIView

@property (strong, nonatomic) IBOutlet id <AdMarvelContainerDelegate> delegate;

- (BOOL)enabled;
- (void)refreshAd;
- (void)openAd;
- (void)closeAd;

@end
