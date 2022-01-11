//
//  MealModel.swift
//  RecipeApp
//
//  Created by DingyiKang on 1/10/22.
//

import Foundation

class MealModel{
    
    var delegate:MealModelProtocol?
    
    func getMeals(category: Category){
     
        let stringUrl = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category.strCategory!)"
        
        let url = URL(string: stringUrl)
        
        guard url != nil else{
            print("Couldn't create url object for meals of category \(category.strCategory!)")
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil{
                
                let decoder = JSONDecoder()
                
                do{
                    let mealsService = try decoder.decode(MealService.self, from: data!)
                    let meals = mealsService.meals!
                    
                    DispatchQueue.main.async {
                        self.delegate?.mealsRetrieved(meals, category: category)
                    }
                    
                }
                catch{
                    print("Error paring the Json for meals")
                }
                
                
            }
            
        }
        dataTask.resume()
        
    }
    
}


protocol MealModelProtocol{
    
    func mealsRetrieved(_ meals:[Meal], category:Category)
}
