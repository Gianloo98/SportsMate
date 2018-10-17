//
//  FinderViewController.swift
//  SportsMate
//
//  Created by Salvatore Ercolano on 12/10/2018.
//  Copyright © 2018 Salvatore Ercolano. All rights reserved.
//

import UIKit
import MapKit

class FinderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var eventMap: MKMapView!
    @IBOutlet weak var eventList: UITableView!
    @IBOutlet weak var switcher: UISegmentedControl!
    
    public var titleLabel : String!
    
    let labels1 = ["Partita Salvatore","Partita Gianluca"]
    let labels2 = ["2 km da te","5 km da te"]
    let labels3 = ["23/15/4036","25/12/0000"]
    let labels4 = ["1 vs 1","20 vs 20"]
    var testo = String()
    var titleColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    var showMap = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkScreen()
        
        self.title = titleLabel
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
//        self.navigationController?.navigationBar.tintColor = titleColor
//        self.switcher.tintColor = titleColor
//        self.tabBarController?.tabBar.tintColor = titleColor
        
        eventList.dataSource = self
        eventList.delegate = self
    }
    
    @IBAction func swwitcherPressed(_ sender: Any) {
       viewDidLoad()
    }
    
    func checkScreen (){
        currentState()
        if showMap {
            eventList.isHidden = true
            eventMap.isHidden = false
        } else {
            eventList.isHidden = false
            eventMap.isHidden = true
        }
    }
        
    func currentState (){
        if switcher.selectedSegmentIndex == 0 {
            showMap=true
        } else if switcher.selectedSegmentIndex == 1 {
            showMap=false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labels1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventList.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventTableViewCell
        cell.label1.text = labels1[indexPath.item]
        cell.label2.text = labels2[indexPath.item]
        cell.label3.text = labels3[indexPath.item]
        cell.label4.text = labels4[indexPath.item]

        return cell
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
