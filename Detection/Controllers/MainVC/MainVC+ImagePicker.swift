//
//  MainVC+ImagePicker.swift
//  RoadSignDetection
//
//  Created by e1ernal on 19.06.2023.
//

import Foundation
import UIKit

extension MainVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showImagePickerControllerActionSheet() {
        let photoLibrarvAction = UIAlertAction(title: "Open Gallery",
                                               style: .default) { _ in
            self.showImagePickerController(sourceType: .photoLibrary)
        }
        let cameraAction = UIAlertAction(title: "Take a photo",
                                         style: .default) { _ in
            self.showImagePickerController(sourceType: .camera)
        }
        let clearAction = UIAlertAction(title: "Clear current photo",
                                        style: .destructive) { _ in
            self.isImage = false
            self.signImage = UIImage()
            self.signsCount = 0
            self.signTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)

        let alert = UIAlertController()
        alert.addAction(photoLibrarvAction)
        alert.addAction(cameraAction)
        alert.addAction(cancelAction)
        if isImage { alert.addAction(clearAction) }

        self.present(alert, animated: true, completion: nil)
    }

    func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        present(imagePickerController, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            isImage = true
            signImage = editedImage
            originalImage = editedImage
            showActivityIndicator()
            updateDetections(for: editedImage)
        }

        dismiss(animated: true, completion: nil)
    }
}
