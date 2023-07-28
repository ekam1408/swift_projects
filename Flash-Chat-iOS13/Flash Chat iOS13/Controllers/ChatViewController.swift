//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    let db = Firestore.firestore();
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var messages: [Message] = [];
    
    var logoutUserManager = HandleUserManager();
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMessages();
        tableView.dataSource = self;
        logoutUserManager.delegate = self;
        title = K.appName;
        navigationItem.hidesBackButton = true;
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let sender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField: sender, K.FStore.bodyField: messageBody, K.FStore.dateField: Date().timeIntervalSince1970], completion: {
                error in
                if error != nil {
                    print("Error saving data on firestore \(error!)")
                } else {
                    print("Successfully saved data on firestore")
                    DispatchQueue.main.async {
                        self.messageTextfield.text = "";
                    }
                }
            })
        }
    }
    
    func loadMessages() {
        db.collection("messages")
            .order(by: K.FStore.dateField)
            .addSnapshotListener({
            querySnapshot, error in
            if let e = error {
                print("Error fetching messages from firestore \(e)");
            } else {
                if let documents = querySnapshot?.documents {
                    self.messages = []
                    for doc in documents {
                        let data = doc.data();
                        if let sender = data[K.FStore.senderField] as? String, let body = data[K.FStore.bodyField] as? String {
                            self.messages.append(Message(sender: sender, body: body, date: Date().timeIntervalSince1970));
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData();
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        })
    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        logoutUserManager.logoutUser();
    }
}

//MARK: - LogoutUserManagerDelegate

extension ChatViewController: HandleUserDelegate {
    func didHandleUserWithSuccess() {
        print("Success")
        navigationController?.popToRootViewController(animated: true)
    }
    
    func didHandleUserWithError(_ err: Error) {
        print(err);
    }
}

//MARK: - UITableViewDataSource
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = messages[indexPath.row].body;

        if messages[indexPath.row].sender == Auth.auth().currentUser?.email! {
            cell.leftImageView.isHidden = true;
            cell.rightImageView.isHidden = false;
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
        } else {
            print("Yo \(messages[indexPath.row].sender)");
            cell.rightImageView.isHidden = true;
            cell.leftImageView.isHidden = false;
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count;
    }
}
