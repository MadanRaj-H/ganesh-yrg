//
//  ProfileViewController.swift
//  EcoKitcheniOSHackathon
//
//  Created by mh53653 on 11/12/16.
//  Copyright © 2016 madan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController/*,UIPickerViewDataSource,UIPickerViewDelegate*/{

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userAddress: UITextField!
    @IBOutlet weak var userMobileNumber: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userConfirmPassword: UITextField!
//    @IBOutlet weak var datePickerDOB: UIDatePicker!
//    @IBOutlet weak var dobValueLabel: UILabel!
//    @IBOutlet weak var genderValueLabel: UILabel!
//    @IBOutlet weak var genderPicker: UIPickerView!
    
    let genderArray = ["Male","Female","TransGender"];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.dismissKeyboard));
        view.addGestureRecognizer(tap);
        
        userConfirmPassword.text = "neo19@gmail.com"
        userAddress.text = "Malibu Point"
        userMobileNumber.text = "8883729358"
        userPassword.text = "Paypal"
        userName.text = "Paypal"
//        genderPicker.dataSource = self;
//        genderPicker.delegate = self;
//        datePickerDOB.addTarget(self, action: #selector(ProfileViewController.datePickerChanged), for: UIControlEvents.valueChanged);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func dismissKeyboard(){
        self.view.endEditing(true);
    }

    @IBAction func registerBtnPressed(_ sender: AnyObject) {
        let manager = ServiceManager()
        let register  = RegistrationModel()
        register.address = userAddress.text;
        register.email = userConfirmPassword.text
        register.mobileNumber = userMobileNumber.text
        register.name = userName.text
        register.password = userPassword.text
        manager.signUp(register : register) { (userId) in
            if userId != -1 {
                self.performSegue(withIdentifier: "FlowViewController", sender: nil);
            }
        }
    }
//    @IBAction func genderBtnPressed(_ sender: AnyObject) {
//        datePickerDOB.isHidden = true;
//        genderPicker.isHidden = false;
//    }
//    @IBAction func dobBtnPressed(_ sender: AnyObject) {
//        datePickerDOB.isHidden = false;
//        genderPicker.isHidden = true;
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return genderArray.count;
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        genderValueLabel.text = genderArray[row];
//        genderPicker.isHidden = true;
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return genderArray[row];
//    }
//    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1;
//    }
//    
//    func datePickerChanged(datePicker:UIDatePicker) {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = DateFormatter.Style.short;
//        let strDate = dateFormatter.string(from: datePicker.date);
//        dobValueLabel.text = strDate;
//    }
}
