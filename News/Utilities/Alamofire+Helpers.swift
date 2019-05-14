//
//  Alamofire+Helpers.swift
//  News
//
//  Created by Alfred POULOSE THEKKAN on 2/23/1941 Saka.
//  Copyright © 1941 Saka Alfred POULOSE THEKKAN. All rights reserved.
//

import Foundation
import Alamofire

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint(self)
        #endif
        return self
    }
}
