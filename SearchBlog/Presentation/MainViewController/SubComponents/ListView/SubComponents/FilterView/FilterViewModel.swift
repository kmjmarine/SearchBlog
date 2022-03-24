//
//  FilterViewModel.swift
//  SearchBlog
//
//  Created by kmjmarine on 2022/03/24.
//

import RxSwift
import RxCocoa

struct FilterViewModel {
    let sortButtonTapped = PublishRelay<Void>()
}
