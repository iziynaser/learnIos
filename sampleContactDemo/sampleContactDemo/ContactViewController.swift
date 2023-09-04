//
//  ViewController.swift
//  sampleContactDemo
//
//  Created by IZIY on 9/3/23.
//

import UIKit
import Contacts


class ContactCell: UITableViewCell{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactImageView: UIImageView!
}

class ContactViewController: UIViewController {
    
    var contacts = [CNContact]()
    
    @IBOutlet weak var tableView: UITableView!
    
    func retreiveContacts(from store:CNContactStore) {
        let containerId = store.defaultContainerIdentifier()
        let predicate = CNContact.predicateForContactsInContainer(withIdentifier: containerId)
        let keysToFetch = [CNContactGivenNameKey as CNKeyDescriptor,CNContactFamilyNameKey as CNKeyDescriptor,CNContactImageDataAvailableKey as CNKeyDescriptor,CNContactImageDataKey as CNKeyDescriptor]
        contacts = try! store.unifiedContacts(matching: predicate, keysToFetch: keysToFetch)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func requesrContacts(){
        let store = CNContactStore()
        let authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)
        if authorizationStatus == .notDetermined {
            store.requestAccess(for: .contacts){ didAuthorized,error in
                if didAuthorized {
                    self.retreiveContacts(from: store)
                }
            }
            print ("not authorized")
        }else if authorizationStatus == .authorized {
            self.retreiveContacts(from: store)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        requesrContacts()
    }
    
    
}

extension ContactViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contacts[indexPath.row]
        
        //let cell = UITableViewCell()
        //cell.textLabel?.text = contact.familyName
        //
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as? ContactCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = contact.givenName
        
        //        if let imageData = contact.imageData {
        //            cell.contactImageView.image = UIImage(data: imageData)
        //        }else {
        //            cell.contactImageView.image = UIImage(systemName: "person.circle")
        //        }
        
        if contact.imageDataAvailable == true , let imageDate = contact.imageData {
            cell.contactImageView.image = UIImage(data: imageDate)
        }else {
            cell.contactImageView.image = UIImage(systemName: "person.circle")
        }
        
        
        return cell
    }
}
