//
//  ViewController.swift
//  webService
//
//  Created by Andrew Seeley on 15/10/17.
//  Copyright © 2017 Seemu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct Class: Codable {
        let name: String
        let room: String
        let teacher: String
        enum CodingKeys : String, CodingKey {
            case name = "Name"
            case room = "Room"
            case teacher = "Teacher Name"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://seemuapps.com/getClasses.php")
        
        // Load the URL
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            // If there are any errors don't try to parse it, show the error
            guard let data = data, error == nil else { print(error!); return }
            
            let decoder = JSONDecoder()
            let classes = try! decoder.decode([Class].self, from: data)
            
            // Print out the classes to the console - try sticking this in a table view :)
            for myClass in classes {
                print(myClass.name)
                print(myClass.room)
                print(myClass.teacher)
            }
        }).resume()
        
    }

}

