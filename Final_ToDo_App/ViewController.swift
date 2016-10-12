//
//  ViewController.swift
//  Final_ToDo_App
//
//  Created by 渡辺　雄貴 on 2016/05/15.
//  Copyright © 2016年 渡辺　雄貴. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var todolistTable: UITableView!
    
    var textDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate //AppDelegateのインスタンスを取得
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellValue = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cellValue.textLabel?.text = todoItem[(indexPath as NSIndexPath).row]
        return cellValue
    }
    
    
    // cellが選択された場合
    func tableView(_ table: UITableView, didSelectRowAt indexPath:IndexPath) {
        textDelegate.selectedText = todoItem[(indexPath as NSIndexPath).row] //appDelegateの変数を操作
        textDelegate.selectedIndex = (indexPath as NSIndexPath).row
        performSegue(withIdentifier: "toSecondViewController",sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            todoItem.remove(at: (indexPath as NSIndexPath).row)
            UserDefaults.standard.set(todoItem, forKey: "todoList")
            todolistTable.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        todolistTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if UserDefaults.standard.object(forKey: "todoList") != nil {
            todoItem = UserDefaults.standard.object(forKey: "todoList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

