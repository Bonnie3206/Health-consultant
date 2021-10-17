//
//  StarchSearchView.swift
//  healthConsultant_2
//
//  Created by CK on 2021/4/29.
//
import SwiftUI

/*
struct MyFoodData {
    
    static var calorie = 0
    var water:Float
    var fat:Float
    var protein:Float
    var saturatedFat:Float
    var carbohydrates:Float
    var dietaryFiber:Float
}*/

struct StarchSearchView: View {
    
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

    var starch = Starch.data
    @State var searchText = ""
    var wordSize = 10
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    
                    SearchBar(text: $searchText)
                    
                    List(starch.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) }),id:\.name) { element in
                        
                        let addCalorie = Float(element.calorie) ?? 0
                        let addWater = Float(element.water) ?? 0
                        let addFat = Float(element.fat) ?? 0
                        let addProtein = Float(element.protein) ?? 0
                        let addSaturatedFat = Float(element.saturatedFat) ?? 0
                        let addCarbohydrates = Float(element.carbohydrates) ?? 0
                        let addDietaryFiber = Float(element.dietaryFiber) ?? 0
                        
                        //let nowElement = element
                        
                        NavigationLink(destination:
                                        ZStack{
                                            Image("大背景")
                                                .resizable()
                                                .scaledToFit()
                                                .scaleEffect(1.3)
                                                .offset(x:0, y: 0)
                                            
                                            VStack{
                                                Image("\(element.name)")
                                                    .resizable()
                                                    .scaleEffect(0.8)
                                                    .padding(1)
                                                    .frame(width: 250, height: 250)
                                                    .cornerRadius(250)
                                                ZStack{
                                                    Rectangle()
                                                        .foregroundColor(.white)
                                                        .opacity(0.99)
                                                        .cornerRadius(30)
                                                        .frame(width: 380, height: 270, alignment: .center)
                                                        .offset(x:0,y:0)
                                                    HStack{
                                                        VStack(alignment: .leading){
                                                            Group{
                                                            
                                                                Text("以每100g計算    ")
                                                                    .scaleEffect(1.2)
                                                                    .padding(5)
                                                                    .font(.system(size: 18, weight: .regular, design: .monospaced))
                                                                
                                                                Text("熱量(kcal):\(element.calorie)")
                                                                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                Text("水分(g):\(element.water)")
                                                                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                Text("脂肪(g):\(element.fat)")
                                                                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                Text("蛋白質(g):\(element.protein)")
                                                                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                Text("飽和脂肪(g):\(element.saturatedFat)")
                                                                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                Text("總碳水化合物(g):\(element.carbohydrates)")
                                                                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                Text("膳食纖維(g):\(element.dietaryFiber)")
                                                                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                
                                                            }
                                                        }.padding(10)
                                                        VStack(alignment: .leading){
                                                            
                                                            Group{
                                                                
                                                                Text("目前累積營養成分")
                                                                    .scaleEffect(1.2)
                                                                    .padding(5)
                                                                    .font(.system(size: 18, weight: .regular, design: .monospaced))
                                                               
                                                                if myCalorie<0.1*suggestCalorie{
                                                                     Text("熱量(kcal):\(myCalorie,specifier: "%.2f")")
                                                                        .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                         
                                                                 }else{
                                                                     Text("熱量(kcal):\(myCalorie,specifier: "%.2f")")
                                                                        .foregroundColor(.red)
                                                                        .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                 }
                                                                if myWater<0.1*suggestWater{
                                                                    Text("水分(g):\(myWater,specifier: "%.2f")")
                                                                        .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                }else{
                                                                    Text("水分(g):\(myWater,specifier: "%.2f")")
                                                                        .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                        .foregroundColor(.red)
                                                                }
                                                                if myFat<0.1*suggestFat{
                                                                    Text("脂肪(g):\(myFat,specifier: "%.2f")")
                                                                        .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                }else{
                                                                    Text("脂肪(g):\(myFat,specifier: "%.2f")")
                                                                        .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                        .foregroundColor(.red)
                                                                }
                                                                if myProtein<0.1*suggestProtein{
                                                                    Text("蛋白質(g):\(myProtein,specifier: "%.2f")")
                                                                        .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                }else{
                                                                    Text("蛋白質(g):\(myProtein,specifier: "%.2f")")
                                                                        .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                        .foregroundColor(.red)
                                                                }
                                                                if mySaturatedFat<0.1*suggestSaturatedFat{
                                                                    Text("飽和脂肪(g):\(mySaturatedFat,specifier: "%.2f")")
                                                                        .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                }else{
                                                                    Text("飽和脂肪(g):\(mySaturatedFat,specifier: "%.2f")")
                                                                        .foregroundColor(.red)
                                                                        .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                }
                                                                if myCarbohydrates<0.1*suggestCarbohydrates{
                                                                    Text("總碳水化合物(g):\(myCarbohydrates,specifier: "%.2f")")
                                                                        .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                }else{
                                                                    Text("總碳水化合物(g):\(myCarbohydrates,specifier: "%.2f")")
                                                                        .foregroundColor(.red)
                                                                        .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                }
                                                                if myDietaryFiber<0.1*suggestDietaryFiber{
                                                                    Text("膳食纖維(g):\(myDietaryFiber,specifier: "%.2f")")
                                                                        .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                        .foregroundColor(.red)
                                                                }else{
                                                                    Text("膳食纖維(g):\(myDietaryFiber,specifier: "%.2f")")
                                                                        .foregroundColor(.blue)
                                                                        .font(.system(size: 15, weight: .regular, design: .monospaced))
                                                                }
                 
                                                            }
                                                            
                                                        }
                                                    }
                                                    
                                                }
                                                
                                                
                                                HStack{
                                                    Button(action: {//decrease
                                                        myCalorie -= 0.1*addCalorie
                                                        myWater -= 0.1*addWater
                                                        myFat -= 0.1*addFat
                                                        myProtein -= 0.1*addProtein
                                                        mySaturatedFat -= 0.1*addSaturatedFat
                                                        myCarbohydrates -= 0.1*addCarbohydrates
                                                        myDietaryFiber -= 0.1*addDietaryFiber
                                                        
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
                                                Button(action: {
                                                    var urlString = "https://icook.tw"
                                                    var url = NSURL(string: urlString)
                                                    UIApplication.shared.openURL(url! as URL)
                                                }, label: {
                                                    Text("查詢食譜")
                                                        .padding(7)
                                                        .padding(.horizontal, 25)
                                                        .background(Color(.systemGray6))
                                                        .cornerRadius(8)
                                                        .padding(.horizontal, 10)
                                                        .frame(width: 160, height:10)
                                                })
                                                
                                            }//.padding(.leading, 30.0)
                                        }
                                        
                        )
                        {
                            Text(element.name)
                            
                        }
                        
                    }.contentShape(Rectangle())
                    .navigationBarTitle(Text("營養成分"))
                    Button(action: {
                        var urlString = "https://icook.tw"
                        var url = NSURL(string: urlString)
                        UIApplication.shared.openURL(url! as URL)
                    }, label: {
                        Text("食譜查詢")
                    })
                }

            }
                        
            
        }
    }
    
}

struct StarchSearchView_Previews: PreviewProvider {
    static var previews: some View {
        StarchSearchView()
    }
}
