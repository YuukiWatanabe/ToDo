//
//  ViewController.swift
//  Final_ToDo_App
//
//  Created by 渡辺　雄貴 on 2016/05/15.
//  Copyright © 2016年 渡辺　雄貴. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //var cellArray = ["りんご","みかん","ばなな","ぶどう","もも"]
    
    @IBOutlet weak var todolistTable: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return cellArray.count
        return todoItem.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellValue = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        //cellValue.textLabel?.text = cellArray[indexPath.row]
        cellValue.textLabel?.text = todoItem[indexPath.row]
        return cellValue
    }
    
    
    // cellが選択された場合
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        performSegueWithIdentifier("toSecondViewController",sender: nil)
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete{
            todoItem.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(todoItem, forKey: "todoList")
            todolistTable.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        todolistTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if NSUserDefaults.standardUserDefaults().objectForKey("todoList") != nil {
            todoItem = NSUserDefaults.standardUserDefaults().objectForKey("todoList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

