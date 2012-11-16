//
//  AdMarvelContainer.m
//
//  Created by Kevin Renskers on 10-07-12.
//  Copyright (c) 2012 Gangverk. All rights reserved.
//

#import "AdMarvelContainer.h"
#import "AdController.h"

#define PADDING_TOP 10

@interface AdMarvelContainer ()
@property (strong, nonatomic) AdController *adController;
@property (strong, nonatomic) AdMarvelView *adMarvelView;
@end

@implementation AdMarvelContainer

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self sharedInit];
    }
    return self;
}

- (void)setDelegate:(id<AdMarvelContainerDelegate>)delegate {
    _delegate = delegate;

    if ([_delegate respondsToSelector:@selector(adMarvelEnabled)]) {
        BOOL enabled = [_delegate adMarvelEnabled];
        if (!enabled) {
            return;
        }
    }

    if ([_delegate respondsToSelector:@selector(adMarvelSiteId)]) {
        self.adController.siteId = [_delegate adMarvelSiteId];
    }

    [self.adController getAdWithSuccessBlock:^(AdMarvelView *adMarvelView) {
        self.adMarvelView = adMarvelView;
        self.adHeight = adMarvelView.height;
        self.height = self.adHeight + PADDING_TOP;

        adMarvelView.y = PADDING_TOP;
        [self addSubview:adMarvelView];

        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        closeButton.frame = CGRectMake(self.frame.size.width-40, 0, 40, 40);
        [closeButton setImage:[UIImage imageNamed:@"b_ad_close"] forState:UIControlStateNormal];
        [closeButton setContentEdgeInsets:UIEdgeInsetsMake(0, 12, 12, 0)];
        [closeButton addTarget:self action:@selector(closeAd) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closeButton];

        [self openAd];
    }];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self sharedInit];
    }
    return self;
}

- (void)sharedInit {
    self.hidden = YES;
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"black50"]];
    self.adController = [[AdController alloc] init];
}

- (void)refreshAd {
    [self.adController refreshAd];
}

- (void)openAd {
    self.hidden = NO;
    if ([self.delegate respondsToSelector:@selector(adMarvelContainerOpened:adMarvelView:)]) {
        [self.delegate adMarvelContainerOpened:self adMarvelView:self.adMarvelView];
    }
}

- (void)closeAd {
    self.hidden = YES;
    if ([self.delegate respondsToSelector:@selector(adMarvelContainerClosed:)]) {
        [self.delegate adMarvelContainerClosed:self adMarvelView:self.adMarvelView];
    }
}

@end
