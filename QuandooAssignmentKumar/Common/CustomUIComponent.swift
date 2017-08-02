//
//  CustomUIComponent.swift
//  QuandooAssignmentKumar
//
//  Created by Krishna Kumar on 7/31/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

import UIKit
class CustomUIComponent : NSObject
{
    class func showAlert(_ title:String,message:String) {
        
        (UIApplication.shared.delegate as! AppDelegate).window?.endEditing(true)
        UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: "OK").show()
        
    }
}
