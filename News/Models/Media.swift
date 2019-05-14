//
//  Media.swift
//  News
//
//  Created by Alfred POULOSE THEKKAN on 2/24/1941 Saka.
//  Copyright © 1941 Saka Alfred POULOSE THEKKAN. All rights reserved.
//

import Foundation

class Media: Decodable {
    
    var metadata: [MediaInfo]?
    
    enum CodingKeys: String, CodingKey {
        
        case metadata = "media-metadata"
    }
}
