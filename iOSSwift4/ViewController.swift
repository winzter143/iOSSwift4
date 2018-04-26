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
    @IBOutlet weak var searchBar: UISearchBar!
    // Create data to hole the array of cell data.
    var data = [CellData]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.data = [CellData.init(cellImage: #imageLiteral(resourceName: "shark"), cellMessage: "Helloword shark"),CellData.init(cellImage: #imageLiteral(resourceName: "octopus"), cellMessage: "Helloword Octopus"),CellData.init(cellImage: #imageLiteral(resourceName: "shark"), cellMessage: "Helloword shark again")]
        let httpUtil = HttpUtil()
        //let result = Result<[User]>?.self
        //DispatchQueue.main.async {
//        httpUtil.getPosts { (result) in
        
        httpUtil.getPosts(searchKey: "", completion: { (result) in
            switch result {
            case .success(let posts):
//                self.posts = posts
                print("Success!!!!")
            
                self.data = []
                for post in posts{
                    self.data.append(CellData.init(cellImage: #imageLiteral(resourceName: "shark"), cellMessage: post.first_name + post.image ))
                }
                self.tableView.reloadData()
            case .failure(let error):
                fatalError("error: \(error.localizedDescription)")
            }
        })
        
        //}
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CellID"
        print("tableView index: \(indexPath.row)")
        // unable to dequeue a cell with identifier CellID - must register a nib or a class for the identifier or connect a prototype cell in a storyboard'
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier:cellIdentifier)
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = data[indexPath.row].cellMessage
        cell.imageView?.image = data[indexPath.row].cellImage
        
        print("tableView index DONE: \(indexPath.row)")
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 8
        return data.count;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    // Set height of the row.
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        // Working
//        return 100;
//    }
    
    // Delete the row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //NSLog("Delete @s", data[indexPath.row].cellMessage)
//            data.remove(at: indexPath.row)
//            tableView.deleteRows(at: indexPath, with: .fade)
        }
    }
}

