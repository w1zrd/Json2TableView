//
//  ViewController.swift
//  TheActors
//
//  Created by Михалев Александр on 05/04/2018.
//  Copyright © 2018 RP Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    final let url = URL(string: "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // download json data
        DownloadJson()
    }

    func DownloadJson() {
        guard let jsonURL = url else {return}
        URLSession.shared.dataTask(with: jsonURL) {(data, response, error) in
            print("downloaded")
        }.resume()
    }
}

