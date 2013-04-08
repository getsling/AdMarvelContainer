# AdMarvelContainer

## Overview
A more developer-friendly way of working with AdMarvel banners and interstitials. Simply drag an UIView in your nib file, change its class to AdMarvelContainer, set its delegate to the File's Owner and you're done.

The banners include a close button and delegate methods so you can be notified when an ad is opened and closed.

The height of the AdMarvelContainer has to be 10 points more then your AdMarvel banner size, so if your banner is 320x50, then the AdMarvelContainer needs to be 320x60. This extra space is used for the close button.


## Example delegate
```objective-c
- (void)adMarvelContainerOpened:(AdMarvelContainer *)adMarvelContainer adMarvelView:(AdMarvelView *)adMarvelView {
	[self.tableView setContentInset:UIEdgeInsetsMake(0, 0, adMarvelView.frame.size.height, 0)];
}

- (void)adMarvelContainerClosed:(AdMarvelContainer *)adMarvelContainer adMarvelView:(AdMarvelView *)adMarvelView {
    [self.tableView setContentInset:UIEdgeInsetsZero];
}
```


## Requirements
* An AdMarvel site id and partner id
* AdMarvelSDK
* [RemoteConfig](https://github.com/gangverk/RemoteConfig) (or edit AdController.m and remove `[Config sharedInstance].adMarvelSiteId` and `[Config sharedInstance].adMarvelPartnerId`)
* ARC
* Xcode 4.4


## Installation
1. Install all frameworks required by AdMarvelSDK via CocoaPods:  
`pod 'AdMarvelContainer/GoogleAdMob_Millennial', :git => 'https://github.com/gangverk/AdMarvelContainer.git'`
(instead of GoogleAdMob_Millennial you can choose one of the other subspecs declared in the [podspec](https://github.com/gangverk/AdMarvelContainer/blob/master/AdMarvelContainer.podspec))
2. Download the AdMarvelSDK from AdMarvel, copy it to your project. Ignore any installation instructions from them, don't include frameworks etc.
3. Copy the files in the AdMarvelContainer folder to your project (git submodule).


## Issues and questions
Have a bug? Please [create an issue on GitHub](https://github.com/gangverk/AdMarvelContainer/issues)!


## Contributing
AdMarvelContainer is an open source project and your contribution is very much appreciated.

1. Check for [open issues](https://github.com/gangverk/AdMarvelContainer/issues) or [open a fresh issue](https://github.com/gangverk/AdMarvelContainer/issues/new) to start a discussion around a feature idea or a bug.
2. Fork the [repository on Github](https://github.com/gangverk/AdMarvelContainer) and make your changes on the **develop** branch (or branch off of it).
3. Make sure to add yourself to AUTHORS and send a pull request.


## Apps using AdMarvelContainer
* Last.fm Scrobbler
* MetroLyrics
* Radio.com
* Tailgate Fan

Are you using AdMarvelContainer in your iOS or Mac OS X app? Send a pull request with an updated README.md file to be included.


## License
AdMarvelContainer is available under the MIT license. See the LICENSE file for more info.
