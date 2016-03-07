//
//  ViewController.swift
//  tableviewdemo_project
//
//  Created by Michelle Harvey on 3/6/16.
//  Copyright © 2016 Michelle Venetucci Harvey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var names = ["Michelle", "Emma", "Vicki", "Madelyn", "Ariel", "Patrick", "Frank", "Monal", "Karina"]
    
    var hometowns = ["Plano, TX", "Ft Wayne, ID", "Alden, NY", "Menlo Park, CA", "Wuhan, China", "Palo Alto, CA", "Andover, MA", "Port Au Prince, Haiti", "Charlotte, NC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let url = NSURL(string: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=dagqdghwaq3e3mxyrp7kmmj5&limit=20&country=us")!
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) {
            (data, response, error) in
            print(NSString(data: data!, encoding: NSUTF8StringEncoding))
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        print("Row: \(indexPath.row)")
        
        let cell = tableView.dequeueReusableCellWithIdentifier("UserCell") as! UserCell
        
        cell.nameLabel.text = names[indexPath.row]
        cell.hometownLabel.text = hometowns[indexPath.row]
        
        return cell
    }


}

