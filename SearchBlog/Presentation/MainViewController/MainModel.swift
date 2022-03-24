//
//  MainModel.swift
//  SearchBlog
//
//  Created by kmjmarine on 2022/03/25.
//

import Foundation
import RxSwift

struct MainModel {
    let network = SearchBlogNetwork()
    
    func searchBlog(_ query: String) -> Single<Result<DaumBlog, SearchNetworkError>> {
        return network.searchBlog(query: query)
    }
    
    func getBlogValue(_ result: Result<DaumBlog, SearchNetworkError>) -> DaumBlog? {
        guard case .success(let value) = result else {
            return nil
        }
        return value
    }
    
    func getBlogError(_ result: Result<DaumBlog, SearchNetworkError>) -> String? {
        guard case .failure(let error) = result else {
            return nil
        }
        return error.localizedDescription
    }

    func getBlogListCellData(_ value: DaumBlog) -> [BlogListCellData] {
        return value.documents
            .map {
                let thumbnailURL = URL(string: $0.thumbnail ?? "")
                return BlogListCellData(
                    thumbnailURL: thumbnailURL,
                    name: $0.name,
                    title: $0.title,
                    datetime: $0.datetime
                )
            }
    }
    
    func sort(by type: MainViewController.AlertAction, of data: [BlogListCellData]) -> [BlogListCellData] {
        switch type {
        case .title:
            return data.sorted { $0.title ?? "" < $1.title ?? "" }
        case .datetime:
            return data.sorted { $0.datetime ?? Date() > $1.datetime ?? Date() }
        default:
            return data
        }
    }
}
