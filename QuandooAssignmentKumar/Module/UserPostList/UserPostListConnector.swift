//
//  UserPostListConnector.swift
//  QuandooAssignmentKumar
//
//  Created by Krishna Kumar on 7/31/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

import UIKit

protocol UserPostListPresenterOutput
{
    func updateUserPostList(userPostsArray : [UserPostListModel])
    func didFailToFetchUserPostList(message  :String)
    func updateTitle(name : String)
}

protocol UserPostListInteractorOutput
{
    func updateUserPostList(userPostsArray : [UserPostListModel]);
    func didFailToFetchUserPostList(message  :String)
}

protocol UserPostListWireFrameProtocol {
    static func createUserPostListModule(userID : String, name : String) -> UIViewController
}
