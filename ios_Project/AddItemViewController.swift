//
//  AddItemViewController.swift
//  ios_Project
//
//  Created by RavzDhanju on 2020-12-03.
//  Copyright © 2020 RavzDhanju. All rights reserved.
//

import UIKit
var myCart = [""]

class AddItemViewController: UIViewController {
    var itemQuantity = 0
    @IBOutlet weak var quantityLabel: UILabel!
    
    var saveShoppingList = SaveShoppingList()
    @IBOutlet weak var itemName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCart = saveShoppingList.getCart("ShoppingList", "shoppingList")
       
    }
    
    
    @IBAction func addItem(_ sender: UIButton) {
        
        if itemName.text != ""{
            let finalItem = ("\(itemName.text!)-\(itemQuantity)")
            myCart.append(finalItem)
            let alert = UIAlertController.init(title: " Yay..", message: "\(finalItem) Added Successfully To Your Cart", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Lets Go", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            itemName.text = ""
            itemQuantity = 0
            quantityLabel.text = "0"
            quanitityStepperValue.value = 0
            saveShoppingList.saveCart(myCart, "ShoppingList", "shoppingList")
                          
        }
        else{
            itemName.placeholder = "Please Enter an item Name"
            let alert = UIAlertController.init(title: " Oops..", message: "Looks Like You Forgot To Add The Name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Lets Go", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBOutlet weak var quanitityStepperValue: UIStepper!
    
    @IBAction func quantityUp(_ sender: UIStepper) {
        
        itemQuantity = Int(sender.value)
        quantityLabel.text = String(itemQuantity)
    }
    
    
}
