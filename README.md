# MJPEG Framework

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


A MJPEG Framework for iOS

**MJPEGConnection** is a NSURLConnection subclass that takes an url, username and password. 
It has a responseDidFinisch callback that pass through each received image data

**MJPEGImageView** is a UIImageView subclass that has a MJPEGConnection and updates the image

## Example

You can find an [example project](https://github.com/ugoArangino/MJPEG-Framework-Example) on GitHub: ugoArangino/MJPEG-Framework-Example
I use this Framework for my app [IP-Camera Viewer](https://itunes.apple.com/de/app/ip-camera-viewer/id806365210)

```swift
@IBOutlet weak var mjpegImageView: MJPEGImageView!

let urlString = "http://wmccpinetop.axiscam.net/mjpg/video.mjpg"
if let url = NSURL(string: urlString) {
    let connectionData = ConnectionData(URL: url)
    mjpegImageView.setupMJPEGConnection(connectionData: connectionData)
    mjpegImageView.startConnection()
}
```

Make sure that the class of the `UIImageView` outlet is `MJPEGImageView` and the Module is `MJPEG`.

## Install with Carthage

	github "ugoArangino/MJPEG-Framework" >= 1.0.0
