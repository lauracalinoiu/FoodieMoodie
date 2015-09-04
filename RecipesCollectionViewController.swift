//
//  RecipesCollectionViewController.swift
//  Foodie
//
//  Created by Laura Calinoiu on 31/08/15.
//  Copyright © 2015 3Smurfs. All rights reserved.
//

import UIKit

private let reuseIdentifier = "RecipeCell"
let sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)

class RecipesCollectionViewController: UICollectionViewController,  UICollectionViewDelegateFlowLayout{

    @IBOutlet var recipesCollectionView: UICollectionView!
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    var foods: [Recipe] = [
        Recipe(title: "Roasted Cauliflower Steaks with Olive Vinaigrette & White Bean Tomato Salad", file: "1", ingredients: [
            Ingredient(name: "cannellini (white kidney) beans", quantity: 1, unit: "can (398 ml)"),
            Ingredient(name: "cauliflower", quantity: 1, unit: "medium head"),
            Ingredient(name: "garlic", quantity: 2, unit: "cloves"),
            Ingredient(name: "grape tomatoes", quantity: 1, unit: "small pkg"),
            Ingredient(name: "Kalamata olives, pitted", quantity: 0.5, unit: "cup"),
            Ingredient(name: "lemon", quantity: 1, unit: ""),
            Ingredient(name: "black pepper", quantity: nil, unit: ""),
            Ingredient(name: "extravirgin olive oil", quantity: nil, unit: ""),
            Ingredient(name: "salt", quantity: nil, unit: "")],
            steps: ["Preheat oven to 260°C (500°F). Using a paper towel, lightly coat a sheet pan with oil.",
                "Wash cauliflower, cut off leaves, and trim stem. Slice lengthwise into 2 cm steaks.",
                "Place steaks and loose florets on sheet. Rub with oil on each side and season with salt and pepper.",
                "Place in the oven and roast for 15 minutes. Flip and continue roasting until tender and browned, another 5-6 minutes. Then broil for 2-3 minutes to create a golden crust.",
                "Peel and mince garlic. Finely chop olives.",
                "In a small bowl, mix together garlic, olives, lemon juice, oil, and salt. Set aside.",
            "In a medium bowl, prepare salad dressing by whisking together oil, lemon juice, salt, and pepper.",
            "Drain and rinse beans; place on paper towels and pat dry. Add to bowl with dressing.",
            "Wash, quarter, and add tomatoes to bowl. Toss salad.",
            "To serve, place cauliflower steaks on a plate, drizzle with vinaigrette, and have with salad on side. Enjoy!"])]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! RecipeCollectionViewCell
        
        cell.label.text = foods[indexPath.row].title
        cell.imageView.image = UIImage(named: foods[indexPath.row].file)
        return cell
    }
   
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return sectionInset
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 170, height: 190)
    }
   
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let recipeStepsController = self.storyboard?.instantiateViewControllerWithIdentifier("StepsRecipeController") as! StepsRecipeController
        
        recipeStepsController.recipe = self.foods[indexPath.row]
        self.navigationController?.pushViewController(recipeStepsController, animated: true)
    }
}
