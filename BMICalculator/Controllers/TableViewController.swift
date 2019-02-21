//
//  TableViewController.swift
//  BMICalculator
//
//  Created by 掛川優希 on 2/14/19.
//  Copyright © 2019 Yuki Kakegawa. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController  {
//newDataDelegate
    let realm = try! Realm()
    
    var items : Results<SharedData>?
    
    
    var selectedData : ListOfData? {
        didSet {
            loadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    
    }

    override func viewWillAppear(_ animated: Bool) {
       
        print("History displayed")
        loadData()
        
    }
    
    
   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items?.count ?? 1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
       
    
        if let item = items?[indexPath.row] {
            
            cell.textLabel?.text = item.usersBMI
        
//
//            let formatter = DateFormatter()
//            let myString = formatter.string(from: ListOfData().date!)
//            let yourDate = formatter.date(from: myString)
//            formatter.dateFormat = "dd-MMM-yyyy"
//            let dateInText = formatter.string(from: yourDate!)
//            print(dateInText)
//            cell.textLabel?.text = dateInText
//        }
//
//
        
//        if let cellYouAt = data[indexPath.row] {
//
//
//            let formatter = DateFormatter()
//            let myString = formatter.string(from: cellYouAt.date!)
//            let yourDate = formatter.date(from: myString)
//            formatter.dateFormat = "dd-MMM-yyyy"
//            let dateInText = formatter.string(from: yourDate!)
//            print(dateInText)
//            cell.textLabel?.text = dateInText
    }
    
        return cell
    }
    
    func loadData(){
        items = realm.objects(SharedData.self)
        tableView.reloadData()
    }
  
    

}
