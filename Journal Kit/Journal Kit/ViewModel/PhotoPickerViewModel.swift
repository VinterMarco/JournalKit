//
//  PhotoPickerViewModel.swift
//  Journal Kit
//
//  Created by Vinter Marco on 27.01.2024.
//

import Foundation
import UIKit
import _PhotosUI_SwiftUI


@MainActor
final class PhotoPickerViewModel : ObservableObject {
    @Published private(set) var selectedImage : UIImage? = nil
    @Published  var imageSelection : PhotosPickerItem? = nil {
        didSet {
            setImage(from : imageSelection)
        }
    }
    
    @Published private(set) var selectedImages : [UIImage] = []
    @Published  var imagesSelection : [PhotosPickerItem] = [] {
        didSet {
            setImages(from : imagesSelection)
        }
    }
    
    
    
    private func setImage(from selection :  PhotosPickerItem?) {
        guard let selection else {return}
        
        Task {
            if let data = try? await selection.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                    return
                }
            }
        }
        
        
        
    }
    
    
    // add photos
    
    private func setImages(from selections :  [PhotosPickerItem]) {
        Task {
            var images : [UIImage] = []
            for selection in selections {
                if let data = try? await selection.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        images.append(uiImage)
                    }
                }
            }
            self.selectedImages = images
        }
    }
    
    
    
    // delete a specific selected image
       func deleteImage(_ image: UIImage) {
           if let index = selectedImages.firstIndex(of: image) {
               selectedImages.remove(at: index)

               // Update imagesSelection accordingly if needed
               if index < imagesSelection.count {
                   imagesSelection.remove(at: index)
               }
           }
       }
  
    
}



