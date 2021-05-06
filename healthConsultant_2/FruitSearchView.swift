//
//  FruitSearchView.swift
//  healthConsultant_2
//
//  Created by CK on 2021/4/29.
//

import SwiftUI
import SwiftUI


struct MyFoodData {
    
    static var calorie = 0
    var water:Float
    var fat:Float
    var protein:Float
    var saturatedFat:Float
    var carbohydrates:Float
    var dietaryFiber:Float
}

struct FruitSearchView: View {
    
    @State var myCalorie : Float = 0.0
    @State var myWater : Float = 0.0
    @State var myFat : Float = 0.0
    @State var myProtein : Float = 0.0
    @State var mySaturatedFat : Float = 0.0
    @State var myCarbohydrates : Float = 0.0
    @State var myDietaryFiber : Float = 0.0
    @State var nowElement = 0
    @State var addTimes = [[Int]]()
    
    let suggestCalorie : Float = 2250
    let suggestWater : Float = 1800.0
    let suggestFat : Float = 55.0
    let suggestProtein : Float = 55.0
    let suggestSaturatedFat : Float = 18.0
    let suggestCarbohydrates : Float = 130.0
    let suggestDietaryFiber : Float = 32.0
/*
    func add(calorie:Float,water:Float,fat:Float,protein:Float
             ,saturatedFat:Float,carbohydrates:Float,dietaryFiber:Float)
    -> (Float, Float,Float,Float,Float,Float,Float){
        myCalorie += calorie
        myWater += water
        myFat += fat
        myProtein += protein
        mySaturatedFat += saturatedFat
        myCarbohydrates += carbohydrates
        myDietaryFiber += dietaryFiber
        
        return(myCalorie,myWater,myFat,myProtein,mySaturatedFat,myCarbohydrates,myDietaryFiber)
    }
 */
    var fruit = Fruit.data
    @State var searchText = ""
    var body: some View {
        NavigationView{
            VStack{
                SearchBar(text: $searchText)
        
                List(fruit.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) }),id:\.name) { element in

                    let addCalorie = Float(element.calorie) ?? 0
                    let addWater = Float(element.water) ?? 0
                    let addFat = Float(element.fat) ?? 0
                    let addProtein = Float(element.protein) ?? 0
                    let addSaturatedFat = Float(element.saturatedFat) ?? 0
                    let addCarbohydrates = Float(element.carbohydrates) ?? 0
                    let addDietaryFiber = Float(element.dietaryFiber) ?? 0
                    
                    //let nowElement = element
                    
                    NavigationLink(destination:
                                    
                                    VStack{
                                        Image("\(element.name)")
                                            .resizable()
                                            .scaleEffect(0.8)
                                            .padding(1)
                                        HStack{
                                            VStack(alignment: .leading){
                                                Group{
                                                
                                                    Text("以下為每100g計算")
                                                        .scaleEffect(1.2)
                                                        .padding(5)
                                                    
                                                    Text("熱量(kcal):\(element.calorie)")
                                                    Text("水分(g):\(element.water)")
                                                    Text("脂肪(g):\(element.fat)")
                                                    Text("蛋白質(g):\(element.protein)")
                                                    Text("飽和脂肪(g):\(element.saturatedFat)")
                                                    Text("總碳水化合物(g):\(element.carbohydrates)")
                                                    Text("膳食纖維(g):\(element.dietaryFiber)")
                                                    
                                                }
                                            }.padding(10)
                                            VStack(alignment: .leading){
                                                
                                                Group{
                                                    
                                                    Text("目前累積營養成分")
                                                        .scaleEffect(1.2)
                                                        .padding(5)
                                                   
                                                    if myCalorie<0.1*suggestCalorie{
                                                         Text("熱量(kcal):\(myCalorie,specifier: "%.2f")")
                                                             
                                                     }else{
                                                         Text("熱量(kcal):\(myCalorie,specifier: "%.2f")")
                                                            .foregroundColor(.red)
                                                     }
                                                    if myWater<0.1*suggestWater{
                                                        Text("水分(g):\(myWater,specifier: "%.2f")")
                                                    }else{
                                                        Text("水分(g):\(myWater,specifier: "%.2f")")
                                                            .foregroundColor(.red)
                                                    }
                                                    if myFat<0.1*suggestFat{
                                                        Text("脂肪(g):\(myFat,specifier: "%.2f")")
                                                    }else{
                                                        Text("脂肪(g):\(myFat,specifier: "%.2f")")
                                                            .foregroundColor(.red)
                                                    }
                                                    if myProtein<0.1*suggestProtein{
                                                        Text("蛋白質(g):\(myProtein,specifier: "%.2f")")
                                                    }else{
                                                        Text("蛋白質(g):\(myProtein,specifier: "%.2f")")
                                                            .foregroundColor(.red)
                                                    }
                                                    if mySaturatedFat<0.1*suggestSaturatedFat{
                                                        Text("飽和脂肪(g):\(mySaturatedFat,specifier: "%.2f")")
                                                    }else{
                                                        Text("飽和脂肪(g):\(mySaturatedFat,specifier: "%.2f")")
                                                            .foregroundColor(.red)
                                                    }
                                                    if myCarbohydrates<0.1*suggestCarbohydrates{
                                                        Text("總碳水化合物(g):\(myCarbohydrates,specifier: "%.2f")")
                                                    }else{
                                                        Text("總碳水化合物(g):\(myCarbohydrates,specifier: "%.2f")")
                                                            .foregroundColor(.red)
                                                    }
                                                    if myDietaryFiber<0.1*suggestDietaryFiber{
                                                        Text("膳食纖維(g):\(myDietaryFiber,specifier: "%.2f")")
                                                            .foregroundColor(.red)
                                                    }else{
                                                        Text("膳食纖維(g):\(myDietaryFiber,specifier: "%.2f")")
                                                            .foregroundColor(.blue)
                                                    }
     
                                                }
                                                
                                            }
                                        }
                                        HStack{
                                            Button(action: {//decrease
                                                myCalorie -= addCalorie
                                                myWater -= addWater
                                                myFat -= addFat
                                                myProtein -= addProtein
                                                mySaturatedFat -= addSaturatedFat
                                                myCarbohydrates -= addCarbohydrates
                                                myDietaryFiber -= addDietaryFiber
                                                /*add(addCalorie,addWater,addFat,addProtein,
                                                    addSaturatedFat,addCarbohydrates,addCdietaryFiber)*/
                                            }, label: {
                                                Text("-")
                                                    .font(.largeTitle)
                                                    .scaleEffect(1.1)
                                            })
                                            Text("10(g)")
                                            Button(action: {//increase
                                                myCalorie += 0.1*addCalorie
                                                myWater += 0.1*addWater
                                                myFat += 0.1*addFat
                                                myProtein += 0.1*addProtein
                                                mySaturatedFat += 0.1*addSaturatedFat
                                                myCarbohydrates += 0.1*addCarbohydrates
                                                myDietaryFiber += 0.1*addDietaryFiber
                                                /*add(addCalorie,addWater,addFat,addProtein,
                                                    addSaturatedFat,addCarbohydrates,addCdietaryFiber)*/
                                            }, label: {
                                                Text("+")
                                                    .font(.largeTitle)
                                            })
                                            
                                        }
                                    }.padding(.leading, 30.0)
                    )
                    {
                        Text(element.name)
                        
                    }
                    
                }.contentShape(Rectangle())
                .navigationBarTitle(Text("營養成分"))
            }
        }
    }
    
}


struct FruitSearchView_Previews: PreviewProvider {
    static var previews: some View {
        FruitSearchView()
    }
}
