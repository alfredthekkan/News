//
//  MediaInfo.swift
//  News
//
//  Created by Alfred POULOSE THEKKAN on 2/24/1941 Saka.
//  Copyright © 1941 Saka Alfred POULOSE THEKKAN. All rights reserved.
//

import Foundation

struct MediaInfo: Decodable {
    
    var width: Int?
    var height: Int?
    var url: URL?
    var format: String?
}

