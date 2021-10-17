//
//  CameraView.swift
//  healthConsultant_2
//
//  Created by CK on 2021/5/20.
//

import SwiftUI

import FirebaseAuth
import FirebaseStorage
import FirebaseStorageSwift//要有swift的,才有result
import Kingfisher
import FirebaseFirestoreSwift
import Firebase

extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

struct CameraView: View {
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @State private var uiImage: UIImage?
    @State var Go_IdentificationView = false
    
    var body: some View {
        NavigationView {
            VStack {
                /*if let uiImage = uiImage {
                    Image(uiImage: uiImage)
                }*/
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 300, height: 300)
                } else {
                    Image("蔬菜")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 300, height: 300)
                }
                HStack{
                    Button("Camera") {
                        self.sourceType = .camera
                        self.isImagePickerDisplay.toggle()
                        //uiImage = selectedImage!
                    }.padding()
                    
                    Button("photo") {
                        self.sourceType = .photoLibrary
                        self.isImagePickerDisplay.toggle()
                        
                    }.padding()
                }
                
                Button(action:{
                    
                    uiImage = selectedImage!
                    UIImageWriteToSavedPhotosAlbum(uiImage!, nil, nil, nil)
                    
                    uploadPhoto(image: uiImage!) { result in
                        switch result {
                        case .success(let url):
                            setUserPhoto(url: url)
                            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                            
                            //changeRequest?.displayName = "\(characterName)"
                            changeRequest?.commitChanges(completion: { error in
                                guard error == nil else {
                                    print(error?.localizedDescription)
                                    return
                                }
                                Go_IdentificationView = true
                                
                            })
                            print("success")
                            
                        case .failure(let error):
                            print(error)
                        }
                    }
                    
                } , label: {
                    
                    Text("前往辨識")
                        .font(.largeTitle)
                        //.foregroundColor(.purple)
                }).sheet(isPresented:$Go_IdentificationView) {
                    IdentificationView()
                }
            }
            .navigationBarTitle("想要辨識什麼蔬菜呢？")
            .sheet(isPresented: self.$isImagePickerDisplay) {
                ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
            }
            
            
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
