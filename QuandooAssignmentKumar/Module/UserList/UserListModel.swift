//
//  UserListModel.swift
//  QuandooAssignmentKumar
//
//  Created by Krishna Kumar on 7/31/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

import Foundation

class UserListModel {
    var name : String?
    var username: String?
    var email : String?
    var address : String?
    
    init(userObject : [String: AnyObject]?)
    {
        if let name = userObject?[Constants.UrlParams.Users.NAME] as? String
        {
            self.name = name
        }
        if let username = userObject?[Constants.UrlParams.Users.USERNAME] as? String
        {
            self.username = username
        }
        if let email = userObject?[Constants.UrlParams.Users.EMAIL] as? String
        {
            self.email = email
        }
        var addressTempString = "";
        if let address = userObject?[Constants.UrlParams.Users.ADDRESS] as? [String : AnyObject]
        {
            if let suite = address[Constants.UrlParams.Users.Address.SUITE] as? String
            {
                addressTempString += suite
            }
            if let street = address[Constants.UrlParams.Users.Address.STREET] as? String
            {
                if (addressTempString.isEmpty)
                {
                   addressTempString += street
                }
                else
                {
                    addressTempString += " \(street)"
                }
            }
            if let city = address[Constants.UrlParams.Users.Address.CITY] as? String
            {
                if (addressTempString.isEmpty)
                {
                    addressTempString += city
                }
                else
                {
                    addressTempString += " \(city)"
                }
            }
            if let zip = address[Constants.UrlParams.Users.ZIP] as? String
            {
                if (addressTempString.isEmpty)
                {
                    addressTempString += zip
                }
                else
                {
                    addressTempString += " \(zip)"
                }
            }
            
            self.address = addressTempString;
        }
    }
}
