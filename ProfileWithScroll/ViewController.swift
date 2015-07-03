//
//  ViewController.swift
//  ProfileWithScroll
//
//  Created by Efrén Reyes on 6/29/15.
//
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    
    let TABLE_HEADER_HEIGHT: CGFloat = 90.0
    
    var tableItems = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for index in 1...100 {
            tableItems.append(index)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableItems.count
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerIdentifier = "HeaderCell"
        let headerView: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(headerIdentifier) as! UITableViewCell
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TABLE_HEADER_HEIGHT
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        cell.textLabel?.text = "\(tableItems[indexPath.row])"
        return cell
    }
    
    // MARK: - UITableViewDelegate -
    
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var scrollViewHeight = scrollView.frame.size.height
        var scrollContentSizeHeight = scrollView.contentSize.height
        var scrollOffset = scrollView.contentOffset.y
        
        if scrollOffset == 0 {
            if scrollView == tableView {
                tableView.scrollEnabled = false
                mainScrollView.scrollEnabled = true
            }
            println("On Top")
            
        } else if scrollOffset + scrollViewHeight == scrollContentSizeHeight {
            println("On Bottom")
            tableView.scrollEnabled = true
            mainScrollView.scrollEnabled = false
        }
    }
    // MARK: -
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

