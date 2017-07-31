//
//  Constants.swift
//  QuandooAssignmentKumar
//
//  Created by Krishna Kumar on 7/31/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

import Foundation

struct Constants {
    struct Url {
        static let GET_USERS = "https://jsonplaceholder.typicode.com/users";
    }
    struct UrlParams
    {
        struct Users
        {
            static let NAME         = "name"
            static let USERNAME     = "username"
            static let EMAIL        = "email"
            static let ADDRESS      = "address"
            static let ZIP          = "zipcode"
            
            struct Address
            {
                static let STREET   = "street"
                static let SUITE    = "suite"
                static let CITY     = "city"
            }
        }
        struct Image
        {
            static let FARM         = "farm"
            static let ID           = "id"
            static let IS_FAMILY    = "isfamily"
            static let IS_FRIEND    = "isfriend"
            static let IS_PUBLIC    = "ispublic"
            static let OWNER        = "owner"
            static let SECRET       = "secret"
            static let SERVER       = "server"
            static let TITLE        = "title"
        }
    }
}
