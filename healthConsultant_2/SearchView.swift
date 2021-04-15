//
//  SearchView.swift
//  healthConsultant_2
//
//  Created by CK on 2021/4/8.
//

import SwiftUI

struct SearchView: View {
    
    var fruit = Fruit.data
    var body: some View {
        NavigationView{
            List(fruit, id:\.name){
                element in
                NavigationLink(destination:
                                VStack{
                                    Text("以下為每公克食物計算")
                                        .font(.largeTitle)
                                        .padding(10)
                                    Button(action:{
                                        
                                    },label:{
                                        
                                    })

                                    Text("熱量(kcal):\(element.calorie)")
                                    Text("水分(g):\(element.water)")
                                    Text("脂肪(g):\(element.fat)")
                                    Text("飽和脂肪(g):\(element.saturatedFat)")
                                    Text("蛋白質(g):\(element.protein)")
                            
                                    Text("總碳水化合物(g):\(element.carbohydrates)")
                                    Text("膳食纖維(g):\(element.dietaryFiber)")
                                }
                )
                {
                    Text(element.name)
                }
                
            }.contentShape(Rectangle())
            .navigationBarTitle(Text("營養成分"))
            
        }
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
