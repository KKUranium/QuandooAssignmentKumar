//
//  UserPostListWireframe.swift
//  QuandooAssignmentKumar
//
//  Created by Krishna Kumar on 7/31/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

import UIKit

class UserPostListWireFrame: UserPostListWireFrameProtocol {
    
    //Create image list screen and set all connectors
    class func createUserPostListModule(userID : String, name : String) -> UIViewController {
        if let view = mainStoryboard.instantiateViewController(withIdentifier: "userPostList") as? UserPostListViewController
        {
            let presenter = UserPostListPresenter()
            let interactor = UserPostListInteractor()
            
            let wireFrame = UserPostListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.userID = userID;
            presenter.userName = name;
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.output = presenter as UserPostListInteractorOutput
            
            return view;
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
