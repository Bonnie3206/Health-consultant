//
//  foodStarch.swift
//  healthConsultant_2
//
//  Created by CK on 2021/4/29.
//

import Foundation
import SwiftUI

struct FoodDataStarch :Codable{
    var starch:[Starch]
    enum CodingKeys: String, CodingKey {
          case starch = "starch"
          
       }
}

struct Starch :Codable{
    
    let name:String
    let calorie:String
    let water:String
    let fat:String
    let protein:String
    let saturatedFat:String
    let carbohydrates:String
    let dietaryFiber:String
    var addNum :Int = 0
    
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
        var starch = [Starch]()
        if let data = NSDataAsset(name:"food")?.data{
            let decoder = JSONDecoder()
            do{
                let foodData = try decoder.decode(FoodDataStarch.self,from:data)
                starch = foodData.starch
            }catch{
                print("error")
            }
            
        }
        return starch
        
    }
}

