//
//  CartTableViewController.swift
//  ios_Project
//
//  Created by RavzDhanju on 2020-12-03.
//  Copyright © 2020 RavzDhanju. All rights reserved.
//

import UIKit

class CartTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var saveShoppingList = SaveShoppingList()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Int(myCart.count)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = myCart[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            myCart.remove(at: indexPath.row)
            saveShoppingList.saveCart(myCart, "ShoppingList", "shoppingList")
            tableView.reloadData()
        }
    }

    
    
    @IBAction func buttonBack(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "tocart", sender: "nil")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
   

   
}
