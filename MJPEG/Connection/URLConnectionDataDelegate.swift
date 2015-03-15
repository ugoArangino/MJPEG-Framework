//
//  URLConnectionDataDelegate.swift
//  ip-camera-viewer
//
//  Created by Ugo Arangino on 19.12.14.
//  Copyright (c) 2014 Ugo Arangino. All rights reserved.
//

import Foundation

/**
*  A NSURLConnectionDataDelegate implementation
*/
public class URLConnectionDataDelegate: NSObject, NSURLConnectionDataDelegate {
    
    weak var connection: URLConnection?
    
    private var connectionData: ConnectionData
    private var data = NSMutableData()
    
    
    public init(connectionData: ConnectionData) {
        self.connectionData = connectionData
    }
    
    
    // MARK: - NSURLConnectionDelegate
    // ServerTrust and HTTPBasic
    
    public func connection(connection: NSURLConnection, willSendRequestForAuthenticationChallenge challenge: NSURLAuthenticationChallenge) {
        
        // NSURLAuthenticationMethod - ServerTrust
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            let credential = NSURLCredential(forTrust: challenge.protectionSpace.serverTrust)
            challenge.sender.useCredential(credential , forAuthenticationChallenge: challenge)
        }
        
        // NSURLAuthenticationMethod - HTTPBasic
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodHTTPBasic {
            if self.connectionData.user != nil && self.connectionData.password != nil {
                let credential = NSURLCredential(user: connectionData.user!, password: connectionData.password!, persistence: NSURLCredentialPersistence.Synchronizable)
                challenge.sender.useCredential(credential, forAuthenticationChallenge: challenge)
            }
        }
    }
    
    
    // MARK: - NSURLConnectionDataDelegate
    
    public func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        // put through data
        self.connection?.delegate?.responseDidFinisch(data: self.data)
        
        // reset data
        self.data.length = 0
    }
    
    public func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        self.data.appendData(data)
    }
    
}