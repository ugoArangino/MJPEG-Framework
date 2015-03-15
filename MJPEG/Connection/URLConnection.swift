//
//  URLConnection.swift
//  ip-camera-viewer
//
//  Created by Ugo Arangino on 19.12.14.
//  Copyright (c) 2014 Ugo Arangino. All rights reserved.
//

import Foundation


public class URLConnection: NSURLConnection {
    
    var delegate: URLConnectionDelegate?
    
}


public protocol URLConnectionDelegate {
    
    /**
        Caled in URLConnectionDataDelegate
    */
    func responseDidFinisch(#data: NSData)
    
}