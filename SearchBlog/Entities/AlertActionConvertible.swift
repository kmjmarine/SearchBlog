//
//  AlertActionConvertible.swift
//  SearchBlog
//
//  Created by kmjmarine on 2022/03/19.
//

import UIKit

protocol AlertActionConvertible {
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
