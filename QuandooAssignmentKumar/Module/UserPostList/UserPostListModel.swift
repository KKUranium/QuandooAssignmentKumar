//
//  UserPostListModel.swift
//  QuandooAssignmentKumar
//
//  Created by Krishna Kumar on 7/31/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

import Foundation

class UserPostListModel {
    var title : String?
    var body: String?
    
    init(userPostObject : [String: AnyObject]?)
    {
        if let title = userPostObject?[Constants.UrlParams.UserPost.TITLE] as? String
        {
            self.title = title
        }
        if let body = userPostObject?[Constants.UrlParams.UserPost.BODY] as? String
        {
            self.body = body
        }
    }
}
