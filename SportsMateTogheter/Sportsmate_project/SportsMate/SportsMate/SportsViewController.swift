//
//  HomeViewController.swift
//  SportsMate
//
//  Created by Salvatore Ercolano on 12/10/2018.
//  Copyright © 2018 Salvatore Ercolano. All rights reserved.
//

import UIKit

class SportsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let sports = ["Football","Basket","Volleyball","Tennis","Jogging","Cycling","Trekking","Rugby"]
    let sportsImages :[UIImage] = [
        UIImage(named: "soccer")!,
        UIImage(named: "basket")!,
        UIImage(named: "volleyball")!,
        UIImage(named: "tennis")!,
        UIImage(named: "shoes")!,
        UIImage(named: "cycling")!,
        UIImage(named: "trekking")!,
        UIImage(named: "rugby")!,
    ]
    let sportsColor :[UIColor] = [
        UIColor(cgColor: #colorLiteral(red: 0, green: 0.7137254902, blue: 0.07058823529, alpha: 0.8455693493)),
        UIColor(cgColor: #colorLiteral(red: 0.5176470588, green: 0.3019607843, blue: 0, alpha: 0.8496628852)),
        UIColor(cgColor: #colorLiteral(red: 0.968627451, green: 0.9058823529, blue: 0, alpha: 0.853301584)),
        UIColor(cgColor: #colorLiteral(red: 1, green: 0.3568627451, blue: 0, alpha: 0.847254923)),
        UIColor(cgColor: #colorLiteral(red: 0.5882352941, green: 0.6235294118, blue: 0.6666666667, alpha: 0.8983037244)),
        UIColor(cgColor: #colorLiteral(red: 0.1137254902, green: 0.2392156863, blue: 1, alpha: 0.8)),
        UIColor(cgColor: #colorLiteral(red: 0.1294117647, green: 0.09803921569, blue: 0.0862745098, alpha: 0.8)),
        UIColor(cgColor: #colorLiteral(red: 0.8705882353, green: 0.6274509804, blue: 0.1568627451, alpha: 0.8519905822))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true;
        collectionView.dataSource = self
        collectionView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
//        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
//        self.tabBarController?.tabBar.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SportCollectionViewCell
        cell.sportLabel.text = sports[indexPath.item]
        cell.sportImage.image = sportsImages[indexPath.item]
        cell.backgroundColor = sportsColor[indexPath.item]
        return cell
    }
    
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "sportId") as! FinderViewController
        let selectedCell = collectionView.cellForItem(at: indexPath) as! SportCollectionViewCell
        vc.titleLabel = selectedCell.sportLabel.text
        vc.titleColor = selectedCell.backgroundColor ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
//        performSegue(withIdentifier: "showSport", sender: self)
//        self.navigationController?.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as! FinderViewController
//        vc.testo = collectionView.indexPathsForSelectedItems?
//    }

}
