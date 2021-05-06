//
//  test.swift
//  healthConsultant_2
//
//  Created by CK on 2021/5/6.
//

import SwiftUI

struct test: View {
    @State var a = 0
    var body: some View {
        VStack{
            Text("\(a)")
            Button(action: {//decrease
                a += 1
                /*add(addCalorie,addWater,addFat,addProtein,
                    addSaturatedFat,addCarbohydrates,addCdietaryFiber)*/
            }, label: {
                Text("-")
                    .font(.largeTitle)
                    .scaleEffect(1.1)
            })
            Text("10(g)")
            Button(action: {//increase
                a -= 1
                /*add(addCalorie,addWater,addFat,addProtein,
                    addSaturatedFat,addCarbohydrates,addCdietaryFiber)*/
            }, label: {
                Text("+")
                    .font(.largeTitle)
            })
        }
        
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
