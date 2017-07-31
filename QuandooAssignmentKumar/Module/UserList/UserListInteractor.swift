//
//  UserListInteractor.swift
//  QuandooAssignmentKumar
//
//  Created by Krishna Kumar on 7/31/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

import Foundation

class UserListInteractor: NSObject
{
    var output : UserListInteractorOutput?;
    
    func getUserList()
    {
        self.getUserListFromServer()
    }
    
    fileprivate func parseUserListIntoArray(list : [[String : AnyObject]]) -> [UserListModel]?
    {
        var userArray = [UserListModel]();
        for user in list
        {
            let userListModelObj = UserListModel.init(userObject: user)
                userArray.append(userListModelObj);
        }
        
        return userArray;
    }
    
    fileprivate func updateUserList(array : [UserListModel])
    {
        output?.updateUserList(userArray: array);
    }
    
    fileprivate func didFailToFetch(message : String)
    {
        output?.didFailToFetchUserList(message: message);
    }
    
}

extension UserListInteractor
{
    fileprivate func getUserListFromServer()
    {
        let urlString = Constants.Url.GET_USERS;
        
        //Api call to fetch users json
        NetworkService.sharedInstance.getData(urlString, params: nil, onSuccess: { (response) in
            
            let userArray = self.parseUserListIntoArray(list: response as! [[String : AnyObject]]);
            self.updateUserList(array: userArray!);

        }) { (message) in
            if let msg = message as? String
            {
                self.didFailToFetch(message: msg);
            }
            else if let msg = (message as? Error)?.localizedDescription
            {
                self.didFailToFetch(message: msg);
            }
        }

    }
}
