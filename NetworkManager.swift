//
//  NetworkManager.swift
//  FoodTracker
//
//  Created by Ali Barış Öztekin on 2017-03-13.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {
    
    
    class func signupUserWithCredentials(username:String! , password: String!) {
        
        let credentials = ["username": username, "password": password]
        
        guard let postJSON = try? JSONSerialization.data(withJSONObject: credentials, options: .prettyPrinted) else {
            print("error serializing json")
            return
        }
        
        let url = URL(string: "http://159.203.243.24:8000/signup")!
        let request = NSMutableURLRequest(url: url)
        request.httpBody = postJSON
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            guard let data = data else {
                print("no data returned from server \(error?.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("no response returned from server \(error)")
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String,Dictionary<String,String>> else {
                print("data returned is not json, or not valid")
                return
            }
            for (key, value) in json["user"]! {
                UserDefaults.standard.set(value, forKey: key)
            }
            
            
            guard response.statusCode == 200 else {
                // handle error
                print("an error occurred \(json["error"])")
                return
            }
        }
        dataTask.resume()
        
        
    }
    
    class func post(data: [String: AnyObject], toEndpoint: String, completion: (NSData?, NSError?)-> (Void)){
        
    }
    
    class func saveMeal(meal: Meal, completion: (NSError?)->(Void)){
    
    }
}
