//
//  CategoryModel.swift
//  RecipeApp
//
//  Created by DingyiKang on 1/10/22.
//

import Foundation

class CategoryModel {
    
    var delegate:CategoryModelProtocol?
    
    func getCategories(){
        
        //create a string url
        let stringUrl = "https://www.themealdb.com/api/json/v1/1/categories.php"
        
        let url = URL(string: stringUrl)
        
        guard url != nil else{
            print("Couldn't create url object for categories")
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil{
                
                let decoder = JSONDecoder()
                
                do{
                    let categoryService = try decoder.decode(CategoryService.self, from: data!)
                    let categories = categoryService.categories!
                    
                    DispatchQueue.main.async {
                        self.delegate?.catrgoriesRetrieved(categories)
                    }
                    
                }
                catch{
                    print("Error paring the Json for category")
                }
                
                
            }
            
        }
        dataTask.resume()
        
    }
    
    
    
}



protocol CategoryModelProtocol{
    
    func catrgoriesRetrieved(_ categories:[Category])
}
