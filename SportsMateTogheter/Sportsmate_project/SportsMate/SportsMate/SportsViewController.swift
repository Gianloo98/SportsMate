//
//  SportsViewController.swift
//  SportsMate
//
//  Created by Salvatore Ercolano on 12/10/2018.
//  Copyright © 2018 Salvatore Ercolano. All rights reserved.
//

import UIKit

class SportsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var sportId: [Int] = []
    var sportName: [String] = []
    var sportLabel: [String] = []
    var sportImage: [String] = []
    var sportColour: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true;
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Do any additional setup after loading the view.
        
        getEventTypes()
    }
    
    
    
    
    // JSON FUNCTIONS
    func getEventTypes() {
        let urlFind = URL(string: "https://sportsmate.altervista.org/appJson.php?eventsType")
        var request = URLRequest(url: urlFind!)
        request.httpMethod = "POST"
        request.httpBody = "eventType=2".data(using: .utf8)
     
        URLSession.shared.dataTask(with:request, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else { return }
     
            do {
                // Start Parsing Json
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                    
                    if let eventTypes = json!.value(forKey: "eventTypes") as? NSArray {
                        for eventType in eventTypes {
                            if let eventTypeDict = eventType as? NSDictionary {
                                if let name = eventTypeDict.value(forKey: "id"){
                                    self.sportId.append(name as! Int)
                                }
                                if let name = eventTypeDict.value(forKey: "name"){
                                    self.sportName.append(name as! String)
                                }
                                if let name = eventTypeDict.value(forKey: "label"){
                                    self.sportLabel.append(name as! String)
                                }
                                if let name = eventTypeDict.value(forKey: "image"){
                                    self.sportImage.append(name as! String)
                                }
                                if let name = eventTypeDict.value(forKey: "colour"){
                                    self.sportColour.append(name as! String)
                                }
                            }
                        }
                    }
                }
                
                // End Parsing Json and Reload Collection View
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }).resume()
     }
    // END JSON FUNCTIONS
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sportId.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SportCollectionViewCell
        
        let imgUrl = NSURL(string: sportImage[indexPath.item])
        let data = NSData(contentsOf: (imgUrl as URL?)!)
        
        cell.sportLabel.text = sportName[indexPath.item]
        cell.sportImage.image = UIImage(data: data! as Data)
        cell.backgroundColor = UIColor(hexString: sportColour[indexPath.item])
        
        return cell
    }
    
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "sportId") as! FinderViewController
        let selectedCell = collectionView.cellForItem(at: indexPath) as! SportCollectionViewCell
        vc.titleLabel = selectedCell.sportLabel.text
        vc.titleColor = selectedCell.backgroundColor ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
