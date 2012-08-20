# AdMarvelContainer

## Overview
A more developer-friendly way of working with AdMarvel banners and interstitials. Simply drag an UIView in your nib file, change its class to AdMarvelContainer, set its delegate to the File's Owner and you're done.

The banners include a close button and delegate methods so you can be notified when an ad is opened and closed.

The height of the AdMarvelContainer has to be 10 points more then your AdMarvel banner size, so if your banner is 320x50, then the AdMarvelContainer needs to be 320x60. This extra space is used for the close button.

## Example delegate
```objective-c
- (void)adMarvelContainerOpened {
	[self.tableView setContentInset:UIEdgeInsetsMake(0, 0, self.adMarvelContainer.adHeight, 0)];
}

- (void)adMarvelContainerClosed {
    [self.tableView setContentInset:UIEdgeInsetsZero];
}
```

## Requirements
* An AdMarvel site id and partner id
* [RemoteConfig](https://github.com/gangverk/RemoteConfig) (or edit AdController.m and remove `[Config config].adMarvelSiteId` and `[Config config].adMarvelPartnerId`)
* ARC
* Xcode 4.4