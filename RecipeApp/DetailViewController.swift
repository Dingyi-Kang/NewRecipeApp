//
//  DetailViewController.swift
//  RecipeApp
//
//  Created by DingyiKang on 1/11/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var meanName: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var mealId:String?
    var singleMealModel = SingleMealModel()
    var ingredients = [String]()
    var measuremnts = [String]()
    var instruction:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        singleMealModel.delegate = self
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        if mealId != nil{
            singleMealModel.getMeal(mealID: mealId!)
            //MARK: we can begin indicator here
        }
    }

}


extension DetailViewController:UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return self.ingredients.count}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        
        if indexPath.section == 0{
            cell.textLabel?.text = self.instruction
        }else{
            cell.textLabel?.text = self.ingredients[indexPath.row]+" - "+self.measuremnts[indexPath.row]
        }
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = UIColor.gray
        let label = UILabel(frame: CGRect(x: 15, y: -5, width: view.frame.width-15, height: 40))
        
        if section == 0{
            label.text = "Instructions"
        }else {
            label.text = "Ingredients/measurements"
        }
        view.addSubview(label)
        return view
    }
    
    
}

extension DetailViewController:SingleMealModelProtocol {
    func singleMealRetrieved(meal: SingleMeal) {
        self.meanName.text = meal.strMeal ?? "nil"
        self.instruction = meal.strInstructions ?? "nil"
        
        if meal.strIngredient1 != nil && meal.strMeasure1 != nil{
            if meal.strIngredient1! != "" && meal.strMeasure1! != ""{
                self.ingredients.append(meal.strIngredient1!)
                self.measuremnts.append(meal.strMeasure1!)
            }
        }
        
        if meal.strIngredient2 != nil && meal.strMeasure2 != nil{
            if meal.strIngredient2! != "" && meal.strMeasure2! != ""{
                self.ingredients.append(meal.strIngredient2!)
                self.measuremnts.append(meal.strMeasure2!)
            }
        }
        
        if meal.strIngredient3 != nil && meal.strMeasure3 != nil{
            if meal.strIngredient3! != "" && meal.strMeasure3! != ""{
                self.ingredients.append(meal.strIngredient3!)
                self.measuremnts.append(meal.strMeasure3!)
            }
        }
        
        if meal.strIngredient4 != nil && meal.strMeasure4 != nil{
            if meal.strIngredient4! != "" && meal.strMeasure4! != ""{
                self.ingredients.append(meal.strIngredient4!)
                self.measuremnts.append(meal.strMeasure4!)
            }
        }
        
        if meal.strIngredient5 != nil && meal.strMeasure5 != nil{
            if meal.strIngredient5! != "" && meal.strMeasure5! != ""{
                self.ingredients.append(meal.strIngredient5!)
                self.measuremnts.append(meal.strMeasure5!)
            }
        }
        
        if meal.strIngredient6 != nil && meal.strMeasure6 != nil{
            if meal.strIngredient6! != "" && meal.strMeasure6! != ""{
                self.ingredients.append(meal.strIngredient6!)
                self.measuremnts.append(meal.strMeasure6!)
            }
        }
        
        if meal.strIngredient7 != nil && meal.strMeasure7 != nil{
            if meal.strIngredient7! != "" && meal.strMeasure7! != ""{
                self.ingredients.append(meal.strIngredient7!)
                self.measuremnts.append(meal.strMeasure7!)
            }
        }
        
        if meal.strIngredient8 != nil && meal.strMeasure8 != nil{
            if meal.strIngredient8! != "" && meal.strMeasure8! != ""{
                self.ingredients.append(meal.strIngredient8!)
                self.measuremnts.append(meal.strMeasure8!)
            }
        }
        
        if meal.strIngredient9 != nil && meal.strMeasure9 != nil{
            if meal.strIngredient9! != "" && meal.strMeasure9! != ""{
                self.ingredients.append(meal.strIngredient9!)
                self.measuremnts.append(meal.strMeasure9!)
            }
        }
        
        if meal.strIngredient10 != nil && meal.strMeasure10 != nil{
            if meal.strIngredient10! != "" && meal.strMeasure10! != ""{
                self.ingredients.append(meal.strIngredient10!)
                self.measuremnts.append(meal.strMeasure10!)
            }
        }
        
        
        if meal.strIngredient11 != nil && meal.strMeasure11 != nil{
            if meal.strIngredient11! != "" && meal.strMeasure11! != ""{
                self.ingredients.append(meal.strIngredient1!)
                self.measuremnts.append(meal.strMeasure1!)
            }
        }
        
        if meal.strIngredient12 != nil && meal.strMeasure12 != nil{
            if meal.strIngredient12! != "" && meal.strMeasure12! != ""{
                self.ingredients.append(meal.strIngredient12!)
                self.measuremnts.append(meal.strMeasure12!)
            }
        }
        
        if meal.strIngredient13 != nil && meal.strMeasure13 != nil{
            if meal.strIngredient13! != "" && meal.strMeasure13! != ""{
                self.ingredients.append(meal.strIngredient13!)
                self.measuremnts.append(meal.strMeasure13!)
            }
        }
        
        if meal.strIngredient14 != nil && meal.strMeasure14 != nil{
            if meal.strIngredient14! != "" && meal.strMeasure14! != ""{
                self.ingredients.append(meal.strIngredient14!)
                self.measuremnts.append(meal.strMeasure14!)
            }
        }
        
        if meal.strIngredient15 != nil && meal.strMeasure15 != nil{
            if meal.strIngredient15! != "" && meal.strMeasure15! != ""{
                self.ingredients.append(meal.strIngredient15!)
                self.measuremnts.append(meal.strMeasure15!)
            }
        }
        
        if meal.strIngredient16 != nil && meal.strMeasure16 != nil{
            if meal.strIngredient16! != "" && meal.strMeasure16! != ""{
                self.ingredients.append(meal.strIngredient16!)
                self.measuremnts.append(meal.strMeasure16!)
            }
        }
        
        if meal.strIngredient17 != nil && meal.strMeasure17 != nil{
            if meal.strIngredient17! != "" && meal.strMeasure17! != ""{
                self.ingredients.append(meal.strIngredient17!)
                self.measuremnts.append(meal.strMeasure17!)
            }
        }
        
        if meal.strIngredient18 != nil && meal.strMeasure18 != nil{
            if meal.strIngredient18! != "" && meal.strMeasure18! != ""{
                self.ingredients.append(meal.strIngredient18!)
                self.measuremnts.append(meal.strMeasure18!)
            }
        }
        
        if meal.strIngredient19 != nil && meal.strMeasure19 != nil{
            if meal.strIngredient19! != "" && meal.strMeasure19! != ""{
                self.ingredients.append(meal.strIngredient19!)
                self.measuremnts.append(meal.strMeasure19!)
            }
        }
        
        if meal.strIngredient20 != nil && meal.strMeasure20 != nil{
            if meal.strIngredient20! != "" && meal.strMeasure20! != ""{
                self.ingredients.append(meal.strIngredient20!)
                self.measuremnts.append(meal.strMeasure20!)
            }
        }
        //MARK: we can terminate the indicator here
        tableView.reloadData()
    }
}
