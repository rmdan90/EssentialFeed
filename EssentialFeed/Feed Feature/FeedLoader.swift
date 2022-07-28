//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Ramadan on 26/07/2022.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
