//
//  food.swift
//  healthConsultant_2
//
//  Created by CK on 2021/4/14.
//

import Foundation
import SwiftUI

struct FoodData :Codable{
    var fruit:[Fruit]
    enum CodingKeys: String, CodingKey {
          case fruit = "水果"
          
       }
}
struct MyFoodData {
    
    let calorie: Float
    let water:Float
    let fat:Float
    let protein:Int
    let saturatedFat:Int
    let carbohydrates:Int
    let dietaryFiber:Int
}
struct Fruit :Codable{
    
    let name:String
    let calorie:String
    let water:String
    let fat:String
    let protein:String
    let saturatedFat:String
    let carbohydrates:String
    let dietaryFiber:String
    
    enum CodingKeys: String, CodingKey {
        case name = "樣品名稱"
        case calorie = "熱量(kcal)"
        case water = "水分(g)"
        case fat = "粗脂肪(g)"
        case protein = "粗蛋白(g)"
        case saturatedFat = "飽和脂肪(g)"
        case carbohydrates = "總碳水化合物(g)"
        case dietaryFiber = "膳食纖維(g)"
       }
    static var data: [Self]{//S
        var fruit = [Fruit]()
        if let data = NSDataAsset(name:"food")?.data{
            let decoder = JSONDecoder()
            do{
                let foodData = try decoder.decode(FoodData.self,from:data)
                fruit = foodData.fruit
            }catch{
                print("error")
            }
            
        }
        return fruit
        
    }
}
