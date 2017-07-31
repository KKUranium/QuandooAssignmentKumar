//
//  NetworkService.swift
//  QuandooAssignmentKumar
//
//  Created by Krishna Kumar on 7/31/17.
//  Copyright © 2017 Krishna Kumar. All rights reserved.
//

import Foundation

class NetworkService{
    
    static let sharedInstance = NetworkService()
    
    func getData(_ url:String, params : NSDictionary?, onSuccess:((_ data: AnyObject) -> Void)?, onFail:((_ message:AnyObject) -> Void)?)
    {
        var urlString = url;
        if(params != nil)
        {
            urlString = self.prepareUrlWithQueryParams(urlString : url, params: params!);
        }
        
        let stringWithoutSpaces = urlString.replacingOccurrences(of: " ", with: "+")
        var request = URLRequest(url: URL.init(string: stringWithoutSpaces)!);
        request.httpMethod = "GET"
        
        requestData(request, onSuccess: onSuccess, onFail: onFail)
    }
    
    func prepareUrlWithQueryParams(urlString : String, params : NSDictionary) -> String
    {
        var tempString = urlString;
        var index = 0;
        for (key, value) in params
        {
            if(index == 0)
            {
                tempString += "?\(key)=\(value)"
            }
            else
            {
                tempString += "&\(key)=\(value)"
            }
            index = index + 1;
        }
        
        return tempString;
    }
    
    func requestData(_ request:URLRequest,onSuccess:((_ data:AnyObject)->Void)?,onFail:((_ message:AnyObject)->Void)?){
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if error == nil{
                let res = response as! HTTPURLResponse!
                
                switch res!.statusCode{
                case 200 :
                    fallthrough
                    
                case 201 :
                    fallthrough
                case 204 :
                    if (data != nil)
                    {
                        do{
                            let jsonResult = try JSONSerialization.jsonObject(with: data!, options: [.mutableContainers]) as AnyObject
                            if jsonResult != nil
                            {
                                onSuccess!(jsonResult)
                                return
                            }
                        }
                        catch{
                            onSuccess!(data! as AnyObject)
                            return
                        }
                    }
                    
                    onFail!(data! as AnyObject)
                    return
                    
                default:
                    onFail!("Internal Server error" as AnyObject)
                    return
                }
            }
            else{
                onFail!(error! as AnyObject)
                
            }
        })
        task.resume()
    }
}
