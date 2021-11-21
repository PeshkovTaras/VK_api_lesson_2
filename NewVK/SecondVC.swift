//
//  SecondVC.swift
//  NewVK
//
//  Created by Тарас Пешков on 21.11.2021.
//

import UIKit
import Alamofire

class SecondVC: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var inputGroupTextField: UITextField!
    
    let parameters = [
        "access_token": Session.instance.token,
        "v": "5.131"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func getFriendsButtonTapped(_ sender: Any) {
        AF.request("https://api.vk.com/method/friends.get", method: .get, parameters: parameters).responseJSON { data in
            self.textView.text = data.description
        }
    }
    
    @IBAction func getFotosButtonTapped(_ sender: Any) {
        AF.request("https://api.vk.com/method/photos.getAll", method: .get, parameters: parameters).responseJSON { data in
            self.textView.text = data.description
        }
    }
    
    @IBAction func getGroupsButtonTapped(_ sender: UIButton) {
        AF.request("https://api.vk.com/method/groups.get", method: .get, parameters: parameters).responseJSON { data in
            self.textView.text = data.description
        }
    }
    
    @IBAction func findGroupsButtonTapped(_ sender: UIButton) {
        
        guard let groupToFind = self.inputGroupTextField.text else { return }
        
        let findGroupParameters = [
            "access_token": Session.instance.token,
            "v": "5.131",
            "q": groupToFind
        ]
        
        AF.request("https://api.vk.com/method/groups.search", method: .get, parameters: findGroupParameters).responseJSON { data in
            self.textView.text = data.description
        }
    }
}
