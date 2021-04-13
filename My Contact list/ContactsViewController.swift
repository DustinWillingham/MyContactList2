//
//  ContactsViewController.swift
//  My Contact list
//
//  Created by Gillian Davis on 4/6/21.
//

import UIKit

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var sgmtEditMode: UISegmentedControl!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtZip: UITextField!
    @IBOutlet weak var txtCell: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblBirthdate: UILabel!
    @IBOutlet weak var btnChange: UIButton!
    @IBOutlet weak var ScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeEditMode( sender: Any) {
        let textFields: [UITextField] = [txtName, txtAddress,txtCity, txtState, txtZip, txtPhone, txtCell, txtEmail]
        if sgmtEditMode.selectedSegmentIndex == 0 {
            for textField in textFields {
                textField.isEnabled = false
                textField.borderStyle = UITextField.BorderStyle.none
            }
            btnChange.isHidden = true
        }
        else if sgmtEditMode.selectedSegmentIndex == 1 {
            for textField in textFields {
                textField.isEnabled = true
                textField.borderStyle = UITextField.BorderStyle.roundedRect
            }
            btnChange.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardNotifications()
    }
    
    func registerKeyboardNotifications() {
        //NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(notification:)), name: //NSNotification.Name.UIResponder.keyboardWillShowNotification, object: nil)
        //NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(notification:)), name: //NSNotification.Name.UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    func unregisterKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardDidShow(notification: NSNotification) {
        let userInfo: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardInfo = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue
        let keyboardSize  = keyboardInfo.cgRectValue.size
        
        //Get the existing contentInset for the scrollView and set the bottom property to
        //be the height of the keyboard
        
        var contentInset = self.ScrollView.contentInset
        contentInset.bottom = keyboardSize.height
        
        self.ScrollView.contentInset = contentInset
        self.ScrollView.scrollIndicatorInsets = contentInset
    }
    
    func keyboardWillHide(notification: NSNotification) {
        var contentInset = self.ScrollView.contentInset
        contentInset.bottom = 0
        
        self.ScrollView.contentInset = contentInset
        self.ScrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
   
    @IBAction func changeEditMode(_ sender: Any) {
    }
    
}
