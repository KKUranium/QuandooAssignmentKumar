//
//  UserListPresenter.swift
//  QuandooAssignmentKumar
//
//  Created by Krishna Kumar on 7/31/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

import Foundation

class UserListPresenter: NSObject {
    
    var view: UserListPresenterOutput?
    var interactor : UserListInteractor?
    var wireFrame: UserListWireFrameProtocol?
    
    func viewDidLoad()
    {
        //Ask interactor for user list
        interactor?.getUserList()
    }
    
    func showPostList(view : UserListViewController, withUserID userID : String, andUserName name: String)
    {
        wireFrame?.pushPostScreen(from: view, withUserID: userID, andUserName: name);
    }

}

extension UserListPresenter : UserListInteractorOutput
{
    func updateUserList(userArray: [UserListModel])
    {
        //Update view for the result user array
        self.view?.updateUserList(userArray: userArray);
    }
    
    func didFailToFetchUserList(message: String)
    {
        self.view?.didFailToFetchUserList(message: message);
    }
}
