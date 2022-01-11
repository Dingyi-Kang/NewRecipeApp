//
//  SingleMealModel.swift
//  RecipeApp
//
//  Created by DingyiKang on 1/11/22.
//

import Foundation


class SingleMealModel{
    
var delegate:SingleMealModelProtocol?

func getMeal(mealID: String){
 
    let stringUrl = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)"
    
    let url = URL(string: stringUrl)
    
    guard url != nil else{
        print("Couldn't create url object for the meals with ID of \(mealID)")
        return
    }
    
    let session = URLSession.shared
    
    let dataTask = session.dataTask(with: url!) { (data, response, error) in
        
        if error == nil && data != nil{
            
            let decoder = JSONDecoder()
            
            do{
                let singleMealService = try decoder.decode(SingleMealService.self, from: data!)
                let meal = singleMealService.meals!.first
                
                DispatchQueue.main.async {
                    self.delegate?.singleMealRetrieved(meal: meal!)
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


protocol SingleMealModelProtocol{

    func singleMealRetrieved(meal: SingleMeal)
}

