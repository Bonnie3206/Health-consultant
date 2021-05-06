//
//  FoodClassifiyView.swift
//  healthConsultant_2
//
//  Created by CK on 2021/4/29.
//

import SwiftUI

struct FoodClassifiyView: View {
    var body: some View {
        NavigationView{
            List{
                Group{
                    NavigationLink(destination:StarchSearchView()){
                        Text("澱粉類")
                    }
                    NavigationLink(destination:FruitSearchView()){
                        Text("水果類")
                    }
                    NavigationLink(destination:FruitSearchView()){
                        Text("堅果及種子類")
                    }
                    NavigationLink(destination:FruitSearchView()){
                        Text("蔬菜類")
                    }
                    
                    NavigationLink(destination:FruitSearchView()){
                        Text("菇類")
                    }
                    NavigationLink(destination:FruitSearchView()){
                        Text("豆類")
                    }
                    NavigationLink(destination:FruitSearchView()){
                        Text("肉類")
                    }
                    NavigationLink(destination:FruitSearchView()){
                        Text("魚貝類")
                    }
                    NavigationLink(destination:FruitSearchView()){
                        Text("蛋類")
                    }
                    NavigationLink(destination:FruitSearchView()){
                        Text("乳品類")
                    }
                }
                Group{
                    NavigationLink(destination:FruitSearchView()){
                        Text("油脂類")
                    }
                    NavigationLink(destination:FruitSearchView()){
                        Text("糖類")
                    }
                    NavigationLink(destination:FruitSearchView()){
                        Text("飲料類")
                    }
                    NavigationLink(destination:FruitSearchView()){
                        Text("調味料及香辛料類")
                    }
                    
                    NavigationLink(destination:FruitSearchView()){
                        Text("糕餅點心類")
                    }
                    NavigationLink(destination:FruitSearchView()){
                        Text("加工調理食品及其他類")
                    }
                    
                }
                
            }.contentShape(Rectangle())
            .navigationBarTitle(Text("食材種類"))
            
            
            
            
        }
    }
}
struct FoodClassifiyView_Previews: PreviewProvider {
    static var previews: some View {
        FoodClassifiyView()
    }
}
