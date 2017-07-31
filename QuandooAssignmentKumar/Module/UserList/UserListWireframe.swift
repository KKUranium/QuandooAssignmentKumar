//
//  UserListWireframe.swift
//  QuandooAssignmentKumar
//
//  Created by Krishna Kumar on 7/31/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

import UIKit

class UserListWireFrame: UserListWireFrameProtocol {
    
    class func createUserListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "Navigation")
        if let view = navController.childViewControllers.first as? UserListViewController
        {
            let presenter = UserListPresenter()
            let interactor = UserListInteractor()
            let wireFrame = UserListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.output = presenter as UserListInteractorOutput
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func pushPostScreen(from view: UserListViewController, withUserID userID: String, andUserName name: String)
    {
        let userPostListView : UserPostListViewController = UserPostListWireFrame.createUserPostListModule(userID: userID, name: name) as! UserPostListViewController
        view.navigationController?.pushViewController(userPostListView, animated: true)
    }
    
}

