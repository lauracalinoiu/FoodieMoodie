//
//  IngredientsController.swift
//  Foodie
//
//  Created by Laura Calinoiu on 03/09/15.
//  Copyright © 2015 3Smurfs. All rights reserved.
//

import UIKit

class IngredientsController: UITableViewController {

    var recipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recipe.ingredients.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ingredientsCell", forIndexPath: indexPath) as! IngredientCell
        
        var compoundQuantityAndUnitForIngredient = ""
        
        if let quantity = recipe.ingredients[indexPath.row].quantity{
            compoundQuantityAndUnitForIngredient += "\(quantity)"
        }
        
        if let unit = recipe.ingredients[indexPath.row].unit{
            compoundQuantityAndUnitForIngredient += " \(unit)"
        }
        cell.quantity.text = "\(compoundQuantityAndUnitForIngredient)"
        cell.ingredient.text = "\(recipe.ingredients[indexPath.row].name)"
        return cell
    }

}
