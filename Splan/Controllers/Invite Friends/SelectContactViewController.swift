//
//  SelectContactViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 09/11/21.
//

import UIKit
import ContactsUI

class SelectContactViewController: UIViewController {

    @IBOutlet var contactTableView: UITableView!
    @IBOutlet var bottomView: UIView!
    @IBOutlet var selectAllText: UILabel!
    var bolValue:[Bool] = []
    
    var isSelectAll = false
    //var contacts = [CNContact]()
    let contactStore = CNContactStore()
    var contactList:[[String:Any]] = []
    //let contactStore = CNContactStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.dropShadow()
        
        contactTableView.allowsMultipleSelection = true
        let keys = [
                CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                        CNContactPhoneNumbersKey,
                        CNContactEmailAddressesKey
                ] as [Any]
        let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
        do {
            try contactStore.enumerateContacts(with: request){
                    (contact, stop) in
                // Array containing all unified contacts from everywhere
                //self.contacts.append(contact)
                
                for phoneNumber in contact.phoneNumbers {
                    if let number = phoneNumber.value as? CNPhoneNumber{
                        let dict = ["name":contact.givenName + " " + contact.familyName,"mobile":number.stringValue]
                        self.contactList.append(dict)
                    }
                }
            }
        } catch {
            print("unable to fetch contacts")
        }
        
        //print("Contact List - ",contactList)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        fillingBoolValue(value:false)
    }

    @IBAction func backActionBtn(_ sender: Any) {
        self.backBtn()
    }
    
    @IBAction func searchActionBtn(_ sender: Any) {
    }
    
    @IBAction func selectAllActionbtn(_ sender: Any) {
        if isSelectAll == true{
            fillingBoolValue(value:false)
            selectAllText.text = "Select All"
            isSelectAll = false
        }else{
            fillingBoolValue(value:true)
            selectAllText.text = "Deselect All"
            isSelectAll = true
        }
        contactTableView.reloadData()
    }
    
    func fillingBoolValue(value:Bool)
    {
        bolValue.removeAll()
        for _ in 0..<contactList.count{
            self.bolValue.append(value)
        }
    }
    

}
extension SelectContactViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactTableView.dequeueReusableCell(withIdentifier: "ContactListTableViewCell", for: indexPath) as! ContactListTableViewCell
        let celldata = contactList[indexPath.row]
        cell.contact_name.text = celldata["name"] as? String
        if bolValue[indexPath.row]
        {
            cell.contact_check_btn.setImage(UIImage(named: "check_icon"), for: UIControl.State.normal)
        }else{
            cell.contact_check_btn.setImage(nil, for: UIControl.State.normal)

        }
        return cell
    }
    
}

extension SelectContactViewController: UITableViewDelegate
{
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if bolValue[indexPath.row]{
            bolValue[indexPath.row] = false
        }else{
            bolValue[indexPath.row] = true
        }
        contactTableView.reloadData()
    }
}
