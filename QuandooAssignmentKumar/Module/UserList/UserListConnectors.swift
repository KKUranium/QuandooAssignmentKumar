//
//  UserListConnectors.swift
//  QuandooAssignmentKumar
//
//  Created by Krishna Kumar on 7/31/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

import UIKit

protocol UserListPresenterOutput
{
    func updateUserList(userArray : [UserListModel])
    func didFailToFetchUserList(message  :String)
}

protocol UserListInteractorOutput
{
    func updateUserList(userArray : [UserListModel]);
    func didFailToFetchUserList(message  :String)
}

protocol UserListWireFrameProtocol {
    static func createUserListModule() -> UIViewController
    
    // PRESENTER -> WIREFRAME
    //func pushPostScreen(from view: UserListViewController);
}
