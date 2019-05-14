//
//  NewsList.swift
//  News
//
//  Created by Alfred POULOSE THEKKAN on 2/23/1941 Saka.
//  Copyright © 1941 Saka Alfred POULOSE THEKKAN. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

final class NewsList: Decodable {
    
    var articles: [Article]?
    var copyright: String?
    var count: Int?
    var status: String?
    
    class func index() -> Promise<[Article]> {
        let (promise, resolver) = Promise<[Article]>.pending()
        
        let url = API.url
        
        Alamofire.request(url).debugLog().responseData { (response) in
            if let error = response.error {
                resolver.reject(error)
            }
            var results: NewsList?
            if let data = response.result.value {
                do {
                    results = try JSONDecoder().decode(NewsList.self, from: data)
                }
                catch {
                    debugPrint("Could not decode")
                }
            }
            resolver.fulfill(results?.articles ?? [])
       }
        return promise
    }
}

extension NewsList {
    
    enum CodingKeys: String, CodingKey {
        case articles = "results"
        case copyright = "copyright"
        case count = "num_results"
        case status = "status"
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decode(Int.self, forKey: .count)
        status = try values.decode(String.self, forKey: .status)
        copyright = try values.decode(String.self, forKey: .copyright)
        articles = try values.decode(Array<Article>.self, forKey: .articles)
    }
}
