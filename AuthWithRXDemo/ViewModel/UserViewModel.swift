//
//  UserViewModel.swift
//  AuthWithRXDemo
//
//  Created by Knoxpo MacBook Pro on 20/01/21.
//

import Foundation
import Combine
import FirebaseFirestore

class UserViewModel: ObservableObject {
    @Published var userlist: User1
    @Published var modified = false
    
    private var cancable = Set<AnyCancellable>()
    
    init(userlist: User1 = User1(name: "", pos: "")) {
      
        self.userlist = userlist
        self.$userlist
            .dropFirst()
            .sink {[weak self] book in
                self?.modified = true
                
                
            }
            .store(in: &self.cancable)
    }
    
  
    
   
    
    //Mark - firebase
    
    private var db = Firestore.firestore()
    
   
    
    ///add book
   private func addBook(_ book: User1){
   do {
    
    let _ = try db.collection("Auth").addDocument(from: book)
        
    }
   catch{
    
    print(error)
   }
    
    }
    //update book
    private func updateBook(_ book: User1)
    {
        if let documentId = book.id{
        
        do {
            try db.collection("Auth").document(documentId).setData(from: book)
            
        }
        catch
        {
           print(error)
        }
        
        
    }
    }
    
    
    // update or delte book
    
    private func updateOrAddBook() {
      if let _ = userlist.id {
        self.updateBook(self.userlist)
      }
      else {
        addBook(userlist)
      }
    }
    
    
    // delete book
//    private func deleteBook()
//    {
//        if let documentId = book.id {
//
//            db.collection("books").document(documentId).delete { error in
//                if let error = error {
//                    print(error.localizedDescription)
//
//                }
//
//            }
//
//
//        }
//
//
//
//    }
    
    
    
    func handelDoneTapped() {
        self.updateOrAddBook()
        
    }
    
    func handelDeleteTapped() {
        
       // self.deleteBook()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


