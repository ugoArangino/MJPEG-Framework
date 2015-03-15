//
//  ConnectionData.swift
//  ip-camera-viewer
//
//  Created by Ugo Arangino on 12.03.15.
//  Copyright (c) 2015 Ugo Arangino. All rights reserved.
//

import Foundation

/**
    A connection data store that has the url, username and password for Basic Authentication
*/
public struct ConnectionData {
    
    var URL: NSURL
    var user: String?
    var password: String?
    
    
    public init(URL: NSURL, user: String?, password: String?) {
        self.URL = URL
        self.user = user
        self.password = password
    }
    
    public init(URL: NSURL) {
        self.URL = URL
    }
    
}