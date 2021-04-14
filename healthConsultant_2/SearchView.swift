//
//  SearchView.swift
//  healthConsultant_2
//
//  Created by CK on 2021/4/8.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack{
            VStack{
                Text("樣品名稱: 木瓜平均值")
                Text("熱量(kcal): 38")
                Text("熱量(kcal): 38")
                Text("水分(g): 89.1")
                Text("粗蛋白(g): 0.6")
                Text("粗脂肪(g): 0.1")
                Text("飽和脂肪(g):")
                Text("總碳水化合物(g): 9.9")
                Text("膳食纖維(g): 1.4")
            }.opacity(10)
            .scaleEffect(1.5)
            
         
            Image("背景1")
                .opacity(0.2)
                .scaleEffect(1.5)
        }
       
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
