//
//  CreatePersonViewController.swift
//  PersonList
//
//  Created by Taof on 5/22/20.
//  Copyright © 2020 taoquynh. All rights reserved.
//

import UIKit
import Photos

class CreatePersonViewController: UIViewController {

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    // khai báo các biến cần thiết
    var passData: ((Person) -> ())?
    // để gọi được UIImagePickerController cần import thư viện Photos
    var imagePicker: UIImagePickerController!
    // ManagerImagePicker là class tự viết, không phải của hệ thống
    var manager: ManagerImagePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Tạo person"
        let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveData))
        navigationItem.leftBarButtonItem = saveButton
        
        // khởi tạo imagePicker
        imagePicker = UIImagePickerController()
        //gán delegate cho ImagePicker
        imagePicker.delegate = self
        // khởi tạo class quản lý việc truy cập vào thiết bị của ImagePicker
        manager = ManagerImagePicker(imagePicker, self)
    }
    
    // thực hiện lưu dữ liệu
    @objc func saveData(){
        // lấy dữ liệu từ textField
        guard let name = nameTextField.text, let phone = phoneTextField.text else {
            return
        }
        
        // lấy dữ liệu từ việc chọn ảnh
        guard let avatar = photoImageView.image else { return }
        let person = Person(name: name, phone: phone, avatarImage: avatar)
        
        // truyền dữ liệu
        passData?(person)
        navigationController?.popViewController(animated: true)
    }

    // khi nhấn nút Select: mở lên một thông báo, yêu cầu người dùng muốn chọn ảnh từ đâu?
    @IBAction func onSelectPhoto(_ sender: Any) {
        let alert = UIAlertController(title: "App", message: "Chọn ảnh từ", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
        let camera = UIAlertAction(title: "Máy ảnh", style: .default, handler: { (_) in
            self.manager.fromCamera()
        })
        let libray = UIAlertAction(title: "Thư viện", style: .default, handler: { (_) in
            self.manager.fromLibrary()
        })
        
        alert.addAction(camera)
        alert.addAction(libray)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}

// để phần này hoạt động cần gán delegate cho imagePicker
extension CreatePersonViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // hàm này để chọn ảnh, sau khi chọn thì sử dụng dismiss để tắt thư viện hoặc camera
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
}
