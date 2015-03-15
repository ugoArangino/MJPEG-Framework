//
//  MJPEGImage.swift
//  MJPEG
//
//  Created by Ugo Arangino on 15.03.15.
//  Copyright (c) 2015 Ugo Arangino. All rights reserved.
//

import UIKit

/**
    MJPEGImageView is a UIImageView subclass that has a MJPEGConnection and updates the image
*/
public class MJPEGImageView: UIImageView, URLConnectionDelegate {
    
    private var mjpegConnection: MJPEGConnection?

    public func setupMJPEGConnection(#connectionData: ConnectionData) {
        mjpegConnection = MJPEGConnection(connectionData: connectionData, delegate: self)
    }
    
    public func startConnection() {
        mjpegConnection?.startConnection()
    }
    
    public func stopConnection() {
        mjpegConnection?.stopConnection()
    }
    
    public func restartConnection() {
        mjpegConnection?.restartConnection()
    }
    
    
    // MARK: - URLConnectionDelegate
    
    /**
    Override image with data from the MJPEGConnection
    
    :param: data ImageData
    */
    public func responseDidFinisch(#data: NSData) {
        if let mjpegImage = UIImage(data: data) {
            image = mjpegImage
        }
    }
    
}