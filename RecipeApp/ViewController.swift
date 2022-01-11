//
//  ViewController.swift
//  RecipeApp
//
//  Created by DingyiKang on 1/10/22.
//

import UIKit

class ViewController: UIViewController{
    
    var caregoryModel = CategoryModel()
    var categories = [Category]()
    var mealModel = MealModel()
    var mealsDict:[String:[Meal]] = [:]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        caregoryModel.delegate = self
        mealModel.delegate = self
        caregoryModel.getCategories()
        //MARK: we can begin indicator here
    }
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //MARK:
        if let categoreString = self.categories[section].strCategory{
            
            if self.mealsDict[categoreString] != nil{
                return self.mealsDict[categoreString]!.count
            }else{
                return 0
            }
        } else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let categoreString = self.categories[indexPath.section].strCategory!
        cell.textLabel?.text = self.mealsDict[categoreString]![indexPath.row].strMeal ?? "nil"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = UIColor.gray
        let label = UILabel(frame: CGRect(x: 15, y: -5, width: view.frame.width-15, height: 40))
        label.text = categories[section].strCategory
        view.addSubview(label)
        return view
    }
    
    //to make the selected row is deselected when navigating back
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow
        guard indexPath != nil else{return}
        
        if let categoryString = self.categories[indexPath!.section].strCategory{
            
            if self.mealsDict[categoryString] != nil{
             
                let detailVC = segue.destination as! DetailViewController
                
                detailVC.mealId = self.mealsDict[categoryString]![indexPath!.row].idMeal
                
            }
        }
    }
    
}


extension ViewController: CategoryModelProtocol {
    func catrgoriesRetrieved(_ categories: [Category]) {
        
        self.categories = categories.sorted(by: {$0.strCategory! < $1.strCategory!})
        
        for i in 0..<self.categories.count{
            let category = self.categories[i]
            mealModel.getMeals(category: category)
            
        }
        
        tableView.reloadData()
        
    }
    
}


extension ViewController: MealModelProtocol{
    func mealsRetrieved(_ meals: [Meal], category: Category) {
        self.mealsDict[category.strCategory!] = meals.sorted(by: {$0.strMeal! < $1.strMeal!})
        //MARK: we can end indicator here after all meals are retrieved
        tableView.reloadData()
    }
    
    
}
