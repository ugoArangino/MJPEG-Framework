//
//  MjepgConnection.swift
//  ip-camera-viewer
//
//  Created by Ugo Arangino on 12.03.15.
//  Copyright (c) 2015 Ugo Arangino. All rights reserved.
//

import Foundation

/**
    MJPEG Connection is a NSURLConnection subclass that takes an url, username and password
*/
public class MJPEGConnection {
    
    private var connection: URLConnection
    private var connectionData: ConnectionData
    private var request: NSURLRequest
    private var connectionDataDelegate: URLConnectionDataDelegate
    private var connectionDelegate: URLConnectionDelegate
    private var isConnectionSetup = false
    
    
    public init(connectionData: ConnectionData, delegate: URLConnectionDelegate) {
        self.connectionData = connectionData
        self.connectionDelegate = delegate
        
        self.request = NSURLRequest(URL: connectionData.URL)
        self.connectionDataDelegate = URLConnectionDataDelegate(connectionData: connectionData)
        self.connection = URLConnection()
    }
    
    private func createURLConnection() -> URLConnection? {
        return URLConnection(request: self.request, delegate: self.connectionDataDelegate)
    }
    
    private func setupConnection() {
        if let connection = createURLConnection() {
            self.connection = connection
            self.connection.delegate = connectionDelegate
            connectionDataDelegate.connection = self.connection
            
            isConnectionSetup = true
        } else {
            println("cant create connection")
        }
    }
    
    public func startConnection() {
        // setupConnection if needed
        if !isConnectionSetup {
            setupConnection()
        }
        connection.start()
    }
    
    public func stopConnection() {
        connection.cancel()
        // reset isConnectionSetup status
        isConnectionSetup = false
    }
    
    public func restartConnection() {
        stopConnection()
        startConnection()
    }
    
}