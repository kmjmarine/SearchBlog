//
//  DaumBlog.swift
//  SearchBlog
//
//  Created by kmjmarine on 2022/03/19.
//

import Foundation

struct DaumBlog: Decodable {
    let documents: [DaumDocument]
}

struct DaumDocument: Decodable {
    let title: String?
    let name: String?
    let thumbnail: String?
    let datetime: Date?
    
    enum Coningkeys: String, CodingKey {
        case title, thumbnail, datetime
        case name = "blogname"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Coningkeys.self)
        
        self.title =  try? values.decode(String?.self, forKey: .title)?
            .replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            .replacingOccurrences(of: "&[^;]+;", with: "", options: .regularExpression, range: nil)
        self.name = try? values.decode(String?.self, forKey: .name)
        self.thumbnail = try? values.decode(String?.self, forKey: .thumbnail)
        self.datetime = Date.parse(values, key: .datetime)
    }
}

extension Date {
    static func parse<K: CodingKey>(_ values: KeyedDecodingContainer<K>, key: K) -> Date? {
        guard let dateString = try? values.decode(String.self, forKey: key),
            let date = from(dateString: dateString) else {
            return nil
        }
        
        return date
    }
    
    static func from(dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        dateFormatter.locale = Locale(identifier: "ko_kr")
        if let date = dateFormatter.date(from: dateString) {
            return date
        }

        return nil
    }
}
