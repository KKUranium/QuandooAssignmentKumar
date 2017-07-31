//
//  UserPostListPresenter.swift
//  QuandooAssignmentKumar
//
//  Created by Krishna Kumar on 7/31/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

import Foundation

class UserPostListPresenter: NSObject {
    
    var view: UserPostListPresenterOutput?
    var interactor : UserPostListInteractor?
    var wireFrame: UserPostListWireFrameProtocol?
    var userID : String?
    var userName : String?
    
    func viewDidLoad()
    {
        if let name = userName
        {
            self.view?.updateTitle(name: name);
        }
        
        //Ask interactor for user list
        if let id = userID
        {
            interactor?.getUserPostList(userID : id);
        }
        else
        {
            self.didFailToFetchUserPostList(message: "Invalid user");
        }
    }
    
}

extension UserPostListPresenter : UserPostListInteractorOutput
{
    func updateUserPostList(userPostsArray: [UserPostListModel])
    {
        //Update view for the result user array
        self.view?.updateUserPostList(userPostsArray: userPostsArray);
    }
    
    func didFailToFetchUserPostList(message: String)
    {
        self.view?.didFailToFetchUserPostList(message: message);
    }
}
