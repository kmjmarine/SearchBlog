//
//  SearchBlogNetwork.swift
//  SearchBlog
//
//  Created by kmjmarine on 2022/03/19.
//

import Foundation
import RxSwift

enum SearchNetworkError {
    case invalidJSON
    case networkError
}

final class SearchBlogNetwork {
    private let session: URLSession
    let api = SearchBlogAPI()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func searchBlog(query: String) -> Single<Result<DaumBlog, Swift.Error>>
}
