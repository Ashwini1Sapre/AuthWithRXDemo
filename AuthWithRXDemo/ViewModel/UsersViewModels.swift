//
//  UsersViewModels.swift
//  AuthWithRXDemo
//
//  Created by Knoxpo MacBook Pro on 20/01/21.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class UsersViewModels: ObservableObject
{
    @Published var userlists = [User1]()
    private var db = Firestore.firestore()
    private var listenerRegistration: ListenerRegistration?
    
    deinit {
        unsubribe()
    }
    
    
    func unsubribe()
    {
        if listenerRegistration != nil
        {
            listenerRegistration?.remove()
            listenerRegistration = nil
            
        }
        
    
    }
    
    
//    if listenerRegistration == nil{
//
//        listenerRegistration = db.collection("books").addSnapshotListener { (querySnapshot, error) in
//
//            guard let documents = querySnapshot?.documents else{
//
//              print("no document")
//                return
//
//            }
//            self.books = documents.compactMap { queryDocumentSnapShot in
//                try? queryDocumentSnapShot.data(as: Book.self)
//
//
//
//
//
//            }
//
//
//        }
//
//    }
//
    
    func subscribe()
    {
        
        if listenerRegistration == nil{
            listenerRegistration = db.collection("Auth").addSnapshotListener { (querySnapshot,error) in
                
                guard let documents = querySnapshot?.documents else {
                    
                    print("no documet")
                    return
                }
                self.userlists = documents.compactMap { queryDocumentSnapshot in
                    try? queryDocumentSnapshot.data(as: User1.self)
                    
                    
                    
                    
                    
                    
                }
                
                
                
                
                
                
            }
        }
        
        
        
        
        
        
        
        
    }
    
}
