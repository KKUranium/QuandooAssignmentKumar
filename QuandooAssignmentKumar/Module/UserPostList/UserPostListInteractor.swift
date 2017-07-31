//
//  UserPostListInteractor.swift
//  QuandooAssignmentKumar
//
//  Created by Krishna Kumar on 7/31/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

import Foundation

class UserPostListInteractor: NSObject
{
    var output : UserPostListInteractorOutput?;
    
    func getUserPostList(userID : String)
    {
        self.getUserPostListFromServer(userID: userID);
    }
    
    fileprivate func parseUserPostListIntoArray(list : [[String : AnyObject]]) -> [UserPostListModel]?
    {
        var userPostArray = [UserPostListModel]();
        for user in list
        {
            let userPostListModelObj = UserPostListModel.init(userPostObject: user)
            userPostArray.append(userPostListModelObj);
        }
        
        return userPostArray;
    }
    
    fileprivate func updateUserPostList(array : [UserPostListModel])
    {
        output?.updateUserPostList(userPostsArray: array);
    }
    
    fileprivate func didFailToFetch(message : String)
    {
        output?.didFailToFetchUserPostList(message: message);
    }
    
}

extension UserPostListInteractor
{
    fileprivate func getUserPostListFromServer(userID : String)
    {
        //Create params for search api
        let params = NSMutableDictionary()
        params.setValue(userID, forKey: Constants.UrlParams.UserPost.ID);
        
        let urlString = Constants.Url.GET_USERS_POSTS;
        
        //Api call to fetch users json
        NetworkService.sharedInstance.getData(urlString, params: params, onSuccess: { (response) in
            
            let userPostArray = self.parseUserPostListIntoArray(list: response as! [[String : AnyObject]]);
            self.updateUserPostList(array: userPostArray!);
            
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
