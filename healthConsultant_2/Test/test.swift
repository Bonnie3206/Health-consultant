//
//  test.swift
//  healthConsultant_2
//
//  Created by CK on 2021/5/6.
//
/*
import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    var body: some View {
        HStack {
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }.overlay(
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
                if isEditing {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 8)
                    }
                }
            }
        )
    }
}
struct test: View {
    var todoItem = ["a","d","f","g"]
    @State var myCalorie : Float = 0.0
    @State var myWater : Float = 0.0
    @State var myFat : Float = 0.0
    @State var myProtein : Float = 0.0
    @State var mySaturatedFat : Float = 0.0
    @State var myCarbohydrates : Float = 0.0
    @State var myDietaryFiber : Float = 0.0
    @State var nowElement = 0
    @State var addTimes = [[Int]]()
    var starch = Starch.data
    @State var searchText = ""
    
    var body: some View {
        Text("1")
        SearchBar(text: $searchText)
            .padding(.top, -30)
        List(starch.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) }),id:\.name) { item in
            Text(item.name)
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}

*/
