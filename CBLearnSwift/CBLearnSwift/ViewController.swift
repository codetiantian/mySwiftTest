//
//  ViewController.swift
//  CBLearnSwift
//
//  Created by Elaine on 15--5.
//  Copyright © 2015年 yinuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CBChageNameDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    var arrayData : NSMutableArray = ["01", "02", "03", "04", "05"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "11"
        
        arrayData.addObject("06")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.arrayData.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return  0.00001
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let cell : CBTableViewCell = tableView.dequeueReusableCellWithIdentifier("CBTableViewCellIndex") as! CBTableViewCell
        
//        cell.setCellItemWithName(String(stringInterpolationSegment: indexPath.section).stringByAppendingString(String(stringInterpolationSegment: indexPath.row)))
        
//        cell.setCellItemWithName(String().stringByAppendingFormat("%i,%i", indexPath.section, indexPath.row))
        cell.setCellItemWithName(self.arrayData[indexPath.row] as! String)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let cbFirstVC : CBFirstViewController = self.storyboard?.instantiateViewControllerWithIdentifier("CBFirstVC") as! CBFirstViewController
    
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        
        cbFirstVC.indexPath = indexPath
        cbFirstVC.delegate = self
        
        cbFirstVC.block = {
            (strName : String, index : NSIndexPath) in
            
            self.arrayData[index.row] = strName;
            
            self.myTableView.reloadData()
        }
        
        self.navigationController?.pushViewController(cbFirstVC, animated: true)
    }
    
    func changeNameWithStr(strName: String, index: NSIndexPath) {
        self.arrayData[index.row] = strName;
        
        self.myTableView.reloadData()
    }
}

