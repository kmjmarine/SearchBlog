//
//  BlogListCell.swift
//  SearchBlog
//
//  Created by kmjmarine on 2022/03/19.
//

import UIKit
import SnapKit
import Kingfisher

final class BlogListCell: UITableViewCell {
    let thumbnailIamgeView = UIImageView()
    let nameLabel = UILabel()
    let titleLabel = UILabel()
    let datetimeLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        thumbnailIamgeView.contentMode = .scaleAspectFit
        
        nameLabel.font = .systemFont(ofSize: 18.0, weight: .bold)
        
        titleLabel.font = .systemFont(ofSize: 14.0)
        titleLabel.numberOfLines = 2
        
        datetimeLabel.font = .systemFont(ofSize: 12.0, weight: .light)
        
        [thumbnailIamgeView, nameLabel, titleLabel, datetimeLabel]
            .forEach {
                addSubview($0)
            }
        
        nameLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(8.0)
            $0.trailing.lessThanOrEqualTo(thumbnailIamgeView.snp.leading).offset(-8.0)
        }
        
        thumbnailIamgeView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.top.trailing.bottom.equalToSuperview().inset(8.0)
            $0.width.height.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8.0)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalTo(thumbnailIamgeView.snp.leading).offset(-8.0)
        }
        
        datetimeLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8.0)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalTo(titleLabel)
            $0.bottom.equalTo(thumbnailIamgeView)
        }
    }
    
    func setData(_ data: BlogListCellData) {
        thumbnailIamgeView.kf.setImage(with: data.thumbnailURL, placeholder: UIImage(systemName: "photo"))
        nameLabel.text = data.name
        titleLabel.text = data.title
        
        var datetime : String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy년 MM월 dd일"
            let contentDate = data.datetime ?? Date()
            
            return dateFormatter.string(from: contentDate)
        }
        
        datetimeLabel.text = datetime
    }
}

