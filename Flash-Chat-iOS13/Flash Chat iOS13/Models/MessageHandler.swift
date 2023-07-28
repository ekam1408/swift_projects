//
//  MessageHandler.swift
//  Flash Chat iOS13
//
//  Created by Ekambeer Singh on 29/07/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol MessageHandlerDelegate {
    func didFetchMessagesWithSuccess(_ messages: [Message]);
    func didFetchMessagesWithError();
}

struct MessageHandler {
    var delegate: MessageHandlerDelegate?
    let db = Firestore.firestore();
    var messages: [Message] = [];
//    mutating func fetchMessages(){
//        db.collection("messages").getDocuments(completion: {
//            querySnapshot, error in
//            if let e = error {
//                print("Error fetching messages from firestore \(e)");
//            } else {
//                if let documents = querySnapshot?.documents {
//                    for doc in documents {
//                        let data = doc.data();
//                        if let sender = data[K.FStore.senderField] as? String, let body = data[K.FStore.bodyField] as? String {
//                            self.messages.append(Message(sender: sender, body: body));
//                        }
//                    }
//                    delegate?.didFetchMessagesWithSuccess(messages);
//                }
//            }
//        })
//    }
}
