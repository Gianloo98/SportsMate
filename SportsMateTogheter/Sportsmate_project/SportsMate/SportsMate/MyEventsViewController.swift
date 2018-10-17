//
//  ViewController.swift
//  SportsMate
//
//  Created by Salvatore Ercolano on 11/10/2018.
//  Copyright © 2018 Salvatore Ercolano. All rights reserved.
//

import UIKit

class MyEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var myEventControl: UISegmentedControl!
    @IBOutlet weak var myEventList: UITableView!
    
    var name = ["Partita Salvatore","Partita Gianluca"]
    var distance = ["2 km da te","5 km da te"]
    var date = ["23/15/4036","25/12/0000"]
    var type = ["1 vs 1","20 vs 20"]
    
    var showEventsCreated = true
    
    func currentState(){
        if myEventControl.selectedSegmentIndex == 0 {
            showEventsCreated = true
        }
        else if myEventControl.selectedSegmentIndex == 1 {
            showEventsCreated = false
        }
    }
    
    func checkScreen (){
        currentState()
        if showEventsCreated{
                 name = ["Partita Salvatore","Partita Gianluca","1","2","3","4"]
                 distance = ["2 km da te","5 km da te","1","2","3","4"]
                 date = ["23/15/4036","25/12/0000","1","2","3","4"]
                 type = ["1 vs 1","20 vs 20","1","2","3","4"]
        }
        else {
                name = ["Partita Gigi","Partita Peppe"]
                distance = ["2 km da te","5 km da te"]
                date = ["23/15/4036","25/12/0000"]
                type = ["1 vs 1","20 vs 20"]
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checkScreen()
        myEventList.dataSource = self
        myEventList.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    // to see if sharing works
    
    @IBAction func eventControlPressed(_ sender: Any) {
        checkScreen()
        myEventList.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myEventList.dequeueReusableCell(withIdentifier: "MyEventCell", for: indexPath) as! EventTableViewCell
        cell.label1.text = name[indexPath.item]
        cell.label2.text = distance[indexPath.item]
        cell.label3.text = date[indexPath.item]
        cell.label4.text = type[indexPath.item]
        
        return cell
    }
    

}

