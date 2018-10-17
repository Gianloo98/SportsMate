//
//  FavouritesViewController.swift
//  SportsMate
//
//  Created by Salvatore Ercolano on 15/10/2018.
//  Copyright © 2018 Salvatore Ercolano. All rights reserved.
//

import UIKit

class FavouritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var favouritesList: UITableView!
    
    let name = ["Ciro Cefalo","Gianluca Sorrentino"]
    let eventCreated = ["3 events created", "2 events created"]
    let images :[UIImage] = [
        UIImage(named: "imageTest")!,
        UIImage(named: "imageTest")!
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.navigationBar.prefersLargeTitles = true;
        favouritesList.dataSource = self
        favouritesList.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
//        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
//        self.tabBarController?.tabBar.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favouritesList.dequeueReusableCell(withIdentifier: "favouriteCell", for: indexPath) as! FavouritesTableViewCell
        cell.nameLabel.text = name[indexPath.row]
        cell.eventLabel.text = eventCreated[indexPath.row]
        cell.favouritesImage.image = images[indexPath.row]
        cell.favouritesImage.layer.cornerRadius = cell.favouritesImage.frame.size.width / 2
        cell.favouritesImage.clipsToBounds = true
        return cell
    }
    
        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
