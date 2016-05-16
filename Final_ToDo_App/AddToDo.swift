//
//  AddToDo.swift
//  Final_ToDo_App
//
//  Created by 渡辺　雄貴 on 2016/05/15.
//  Copyright © 2016年 渡辺　雄貴. All rights reserved.
//

import Foundation

import UIKit

var todoItem = [String]()


class AddToDo: UIViewController{
    
    @IBOutlet weak var itemText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addItem(sender: AnyObject) {
        todoItem.append(itemText.text!)
        itemText.text = ""
        NSUserDefaults.standardUserDefaults().setObject(todoItem, forKey: "todoList")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        itemText.resignFirstResponder()
        return true
    }
    
}
