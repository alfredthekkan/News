//
//  Article.swift
//  News
//
//  Created by Alfred POULOSE THEKKAN on 2/23/1941 Saka.
//  Copyright © 1941 Saka Alfred POULOSE THEKKAN. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

final class Article {
    
    var abstract: String?
    var adxKeywords: String?
    var assetId: Double?
    var byLine: String?
    var column: String?
    var desFacet: [String]?
    var geoFacet: String?
    var id: Double?
    var orgFacet: [String]?
    var perFacet: [String]?
    var media: [Media]?
    var publishedDate: String?
    var section: String?
    var source: String?
    var title: String?
    var articleType: ArticleType?
    var url: URL?
    var views: Int?
    
    var thumnail: URL? {
        guard (media?.first?.metadata?.count ?? 0) > 2 else {
            return nil
        }
        return media?.first?.metadata?[1].url
    }
    
    enum CodingKeys: String, CodingKey {
        case abstract = "abstract"

        case adxKeywords = "adx_keywords"
        case assetId = "asset_id"
        case byline = "byline"
        case column = "column"
        case desFacet = "des_facet"
        case geoFacet = "geo_facet"
        case id = "id"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case media = "media"
        case publishedDate = "published_date"
        case section = "section"
        case source = "source"
        case title = "title"
        case articleType = "type"
        case url = "url"
        case views = "views"
    }
    
   
}



extension Article {
    enum ArticleType: String, Decodable {
        case interactive = "Interactive"
    }
}

extension Article: Decodable {
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        abstract = try values.decode(String.self, forKey: .abstract)
        adxKeywords = try values.decode(String.self, forKey: .adxKeywords)
        assetId = try values.decode(Double.self, forKey: .assetId)
        byLine = try values.decode(String.self, forKey: .byline)
        
        column = try? values.decode(String.self, forKey: .column)
        desFacet = try? values.decode(Array<String>.self, forKey: .desFacet)
        geoFacet = try? values.decode(String.self, forKey: .geoFacet)
        id = try? values.decode(Double.self, forKey: .id)
        
        orgFacet = try? values.decode(Array<String>.self, forKey: .orgFacet)
        perFacet = try? values.decode(Array<String>.self, forKey: .perFacet)
        media = try? values.decode(Array<Media>.self, forKey: .media)
        publishedDate = try? values.decode(String.self, forKey: .publishedDate)
        section = try? values.decode(String.self, forKey: .section)
        source = try? values.decode(String.self, forKey: .source)
        title = try? values.decode(String.self, forKey: .title)
        articleType = try? values.decode(ArticleType.self, forKey: .articleType)
        url = try? values.decode(URL.self, forKey: .url)
        views = try? values.decode(Int.self, forKey: .views)
 
    }
}
