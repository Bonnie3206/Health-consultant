//
//  ContentView.swift
//  healthConsultant_2
//
//  Created by CK on 2021/4/8.
//

import SwiftUI


func loadData(){
    let url = Bundle.main.url(forResource: "data", withExtension: "json")
        let content = try! String(contentsOf: url!)
        print(content)
    }
struct ContentView: View {
    @State var SearchPage = false
    /*var fruit = Fruit.data
    var body: some View {
        List(fruit, id:\.name){
            element in
            Text(element.name)
        }*/
        
    var body: some View {
        ZStack{
            Image("背景3")
                .opacity(0.8)
                .scaleEffect(1.5)
            VStack{
                Text("健康飲食諮詢家")
                    .padding(.top)
                    .frame(width: 500, height:700)
                    .offset(x:0, y: -300)
                    .font(.largeTitle)
                HStack{
                    Button( action: {
                        SearchPage = true
                        let url = Bundle.main.url(forResource: "data", withExtension: "txt")
                        let content = try! String(contentsOf: url!)
                                print(content)}, label: {
                        Text("食材查詢")
                    }).frame(width: 160, height:10)
                        .font(.largeTitle)
                        .sheet(isPresented: $SearchPage, content:{
                        SearchView()
                    })
                    Button( action: {
                        let url = Bundle.main.url(forResource: "data", withExtension: "txt")
                        let content = try! String(contentsOf: url!)
                                print(content)}, label: {
                        Text("蔬菜辨識")
                    }).frame(width: 160, height:10)
                        .font(.largeTitle)
                }
        }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
