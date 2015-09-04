//
//  StepsRecipeController.swift
//  Foodie
//
//  Created by Laura Calinoiu on 03/09/15.
//  Copyright © 2015 3Smurfs. All rights reserved.
//

import UIKit

let stepCellIdentifier = "StepCell"

class StepsRecipeController: UITableViewController {
    
    var recipe: Recipe!
    
    override func viewDidLoad() {
        let ingredientsButton = UIBarButtonItem(title: "Ingredients", style: .Plain, target: self, action: "showIngredients:")
        self.navigationItem.rightBarButtonItem = ingredientsButton

    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe.steps.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(stepCellIdentifier, forIndexPath: indexPath) as! StepTableViewCell
        cell.stepNumber!.text = "\(indexPath.row+1)"
        cell.stepDetail!.text = recipe.steps[indexPath.row]
        return cell
    }

    func showIngredients(sender: UIBarButtonItem){
        let ingredientsController = self.storyboard?.instantiateViewControllerWithIdentifier("IngredientsController") as! IngredientsController
        
        ingredientsController.recipe = self.recipe
        self.navigationController?.pushViewController(ingredientsController, animated: true)
    }
}
