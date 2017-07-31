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
        static let GET_USERS_POSTS = "https://jsonplaceholder.typicode.com/posts";
    }
    struct UrlParams
    {
        struct Users
        {
            static let ID           = "id"
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
        struct UserPost
        {
            static let TITLE         = "title"
            static let BODY          = "body"
            static let ID            = "userId"
        }
    }
}
