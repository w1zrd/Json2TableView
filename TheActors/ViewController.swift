//
//  ViewController.swift
//  TheActors
//
//  Created by Михалев Александр on 05/04/2018.
//  Copyright © 2018 RP Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    final let url = URL(string: "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors")
    
    private var actors = [Actor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // download json data
        DownloadJson()
    }

    func DownloadJson() {
        guard let jsonURL = url else {return}
        URLSession.shared.dataTask(with: jsonURL) {data, response, error in
            guard let data = data, error == nil, response != nil else {
                print("something was wrong")
                return}
            print("downloaded")
            do {
                let decoder = JSONDecoder()
                let dowloadedactors = try decoder.decode(Actors.self, from: data)
                self.actors = dowloadedactors.actors
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("actors cann`t be decoded")
            }
        }.resume()
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActorCell") as? TableViewCell else {
            return UITableViewCell()
        }
        cell.CellLbl1.text = actors[indexPath.row].name
        cell.CellLbl2.text = actors[indexPath.row].dob
        if let imageURL = URL(string: actors[indexPath.row].image) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.CellImage.image = image
                    }
                }
            }
        }
        return cell
    }
    
}
