//
//  ViewController.swift
//  iOSSwift4
//
//  Created by Xurpas Enterprise on 16/04/2018.
//  Copyright © 2018 Xurpas Enterprise. All rights reserved.
//

import UIKit

// Structure of the table view
struct CellData {
    let cellImage : UIImage?
    let cellMessage : String?
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    // Create data to hole the array of cell data.
    var data = [CellData]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        data = [CellData.init(cellImage: #imageLiteral(resourceName: "shark"), cellMessage: "Helloword shark"),CellData.init(cellImage: #imageLiteral(resourceName: "octopus"), cellMessage: "Helloword Octopus"),CellData.init(cellImage: #imageLiteral(resourceName: "shark"), cellMessage: "Helloword shark again")]
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CellID"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = data[indexPath.row].cellMessage
        cell.imageView?.image = data[indexPath.row].cellImage
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 8
        return data.count;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
}

