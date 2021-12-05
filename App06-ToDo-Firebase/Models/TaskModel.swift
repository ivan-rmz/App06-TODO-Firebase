//
//  taskModel.swift
//  App06-ToDo-Firebase
//
//  Created by user205865 on 10/7/21.
//

import SwiftUI
import FirebaseFirestore

class TaskModel: ObservableObject{
    @Published var tasks = [Task]()
    @Published var categories = [Category]()
    @Published var priorities = [Priority]()
    private let db = Firestore.firestore()
    
    init(){
        fetchTask()
        fetchCategory()
        fetchPriority()
    }
    
    func fetchTask(){
        db.collection("Tasks").order(by: "due_date").addSnapshotListener{ (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No documents")
                return
            }
            
            print(documents.count)
            
            self.tasks = documents.compactMap { queryDocumentSnapshot -> Task? in
                return try? queryDocumentSnapshot.data(as: Task.self)
                
            }
      	      
        }
    }
    func fetchCategory(){
        db.collection("Cateogry").order(by: "category_id").addSnapshotListener{ (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No documents")
                return
            }
            
            print(documents.count)
            
            self.categories = documents.compactMap { queryDocumentSnapshot -> Category? in
                return try? queryDocumentSnapshot.data(as: Category.self)
                
            }
                
        }
    }
    func fetchPriority(){
        db.collection("Priority").order(by: "priority_id").addSnapshotListener{ (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No documents")
                return
            }
            
            print(documents.count)
            
            self.priorities = documents.compactMap { queryDocumentSnapshot -> Priority? in
                return try? queryDocumentSnapshot.data(as: Priority.self)
                
            }
                
        }
    }
    
    // Función para agregar datos a la base de datos
        func addTask(task: Task) {
            do {
                let _ = try db.collection("Tasks").addDocument(from: task)
            }
            catch {
                print(error)
            }
        }

        // Función para actualizar datos en la base de datos
        func updateTask(task: Task) {
            if let taskID = task.id {
                do {
                    try db.collection("Tasks").document(taskID).setData(from: task)
                }
                catch {
                    print("There was an error while trying to update a task \(error.localizedDescription).")
                }
            }
        }
    
    // Función para borrar datos de la base de datos
    func removeTask(task: Task) {
        if let taskID = task.id {
            db.collection("Tasks").document(taskID).delete { (error) in // (1)
                if let error = error {
                    print("Error removing document: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func addTask(task: Task) {
        do {
            let _ = try db.collection("Tasks").addDocument(from: task)
        }
        catch {
            print(error)
        }
    }

    // Función para actualizar datos en la base de datos
    func updateTask(task: Task) {
        if let taskID = task.id {
            do {
                try db.collection("Tasks").document(taskID).setData(from: task)
            }
            catch {
                print("There was an error while trying to update a task \(error.localizedDescription).")
            }
        }
    }

    // Función para borrar datos de la base de datos
func removeCategory(category: Category) {
        if let categoryID = category.id {
            db.collection("Category").document(categoryID).delete { (error) in // (1)
                if let error = error {
                    print("Error removing document: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func addTask(task: Task) {
        do {
            let _ = try db.collection("Tasks").addDocument(from: task)
        }
        catch {
            print(error)
        }
    }

    // Función para actualizar datos en la base de datos
    func updateTask(task: Task) {
        if let taskID = task.id {
            do {
                try db.collection("Tasks").document(taskID).setData(from: task)
            }
            catch {
                print("There was an error while trying to update a task \(error.localizedDescription).")
            }
        }
    }

    // Función para borrar datos de la base de datos
    func removeTask(task: Task) {
        if let taskID = task.id {
            db.collection("Tasks").document(taskID).delete { (error) in // (1)
                if let error = error {
                    print("Error removing document: \(error.localizedDescription)")
                }
            }
        }
    }

}
