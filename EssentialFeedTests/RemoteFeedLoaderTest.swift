//
//  RemoteFeedLoaderTest.swift
//  EssentialFeedTests
//
//  Created by Ramadan on 28/07/2022.
//

import XCTest
import EssentialFeed

class RemoteFeedLoaderTest: XCTestCase {

    func test_init_doesNotRequestDataFromUrl() {
        let (_, client) = makeSut()
        
        XCTAssertNil(client.requestedUrl)
    }
    
    func test_init_requestDataFromURL() {
        
        let (sut, client) = makeSut(url: URL(string: "http://a-some-url.com")!)
        sut.load()
        
        XCTAssertEqual(client.requestedUrl, URL(string: "http://a-some-url.com")!)
    }
    
    // MARK: Helpers
    
    private func makeSut(url: URL = URL(string: "http://a-url.com")!) -> (RemoteFeedLoader, HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        func get(from url: URL) {
            requestedUrl = url
        }
        
        var requestedUrl: URL?
    }
}
