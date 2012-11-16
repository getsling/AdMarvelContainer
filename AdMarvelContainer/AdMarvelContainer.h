//
//  AdMarvelContainer.h
//
//  Created by Kevin Renskers on 10-07-12.
//  Copyright (c) 2012 Gangverk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AdMarvelView, AdMarvelContainer;


@protocol AdMarvelContainerDelegate <NSObject>

@required
- (void)adMarvelContainerOpened:(AdMarvelContainer *)adMarvelContainer adMarvelView:(AdMarvelView *)adMarcelView;
- (void)adMarvelContainerClosed:(AdMarvelContainer *)adMarvelContainer;

@optional
- (BOOL)adMarvelEnabled;
- (NSString *)adMarvelSiteId;

@end


@interface AdMarvelContainer : UIView

@property (strong, nonatomic) IBOutlet id <AdMarvelContainerDelegate> delegate;
@property (nonatomic) NSInteger adHeight;

- (void)refreshAd;
- (void)openAd;
- (void)closeAd;

@end
