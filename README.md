# AdMarvelContainer

## Overview
A more developer-friendly way of working with AdMarvel banners and interstitials. Simply drag an UIView in your nib file (320 x 60 points), change its class to AdMarvelContainer, set its delegate to the File's Owner and you're done.

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
* [RemoteConfig](https://github.com/gangverk/RemoteConfig)
* ARC
* Xcode 4.4