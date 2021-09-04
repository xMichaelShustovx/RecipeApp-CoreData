//
//  ImagePicker.swift
//  RecipeApp
//
//  Created by Michael Shustov on 03.09.2021.
//

import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    
    var selectedSource: UIImagePickerController.SourceType
    
    @Binding var recipeImage: UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        
        // Create image picker controller
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = context.coordinator
        
        // Check that this source is available
        if UIImagePickerController.isSourceTypeAvailable(selectedSource) {
            
            imagePickerController.sourceType = selectedSource
            
        }
        
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        
        // Create a coordinator
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            // Check if we can get the image
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                
                parent.recipeImage = image
            }
            
            // Dismiss this view
            parent.presentationMode.wrappedValue.dismiss()
            
        }
        
    }
}
