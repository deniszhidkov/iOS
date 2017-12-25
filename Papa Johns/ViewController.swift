//
//  ViewController.swift
//  Папа Джонс
//
//  Created by home on 25.12.2017.
//  Copyright © 2017 home. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var countButtonPlus: UIButton!
    @IBOutlet var countButtonMinus: UIButton!
    
    
    override func viewDidLoad() {
        let url = URL(string: "https://www.papajohns.ru/api/city/list")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            print(data)
            print("----------")
            print(response)
            print("----------")
            print(error)
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
        }
        
        task.resume()
        

        
        super.viewDidLoad()
        
        
        countButtonPlus.layer.borderWidth = 1
        countButtonPlus.layer.borderColor = UIColor.gray.cgColor
        countButtonPlus.layer.cornerRadius = 22
        
        countButtonMinus.layer.borderWidth = 1
        countButtonMinus.layer.borderColor = UIColor.gray.cgColor
        countButtonMinus.layer.cornerRadius = 22
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

