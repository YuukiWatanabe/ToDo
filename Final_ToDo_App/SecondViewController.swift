//
//  SecondViewController.swift
//  Final_ToDo_App
//
//  Created by 渡辺　雄貴 on 2016/05/15.
//  Copyright © 2016年 渡辺　雄貴. All rights reserved.
//

import Foundation

import UIKit

class SecondViewController: UIViewController{
    
    var textDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate //AppDelegateのインスタンスを取得
    
    @IBOutlet weak var text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.text = textDelegate.selectedText
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        //textDelegate.selectedText = text.text
        //ユーザーデフォルトに保存されているものの該当番号のものを書き換え
        let index = textDelegate.selectedIndex
        todoItem[index!] = text.text!
        UserDefaults.standard.set(todoItem, forKey: "todoList")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
