//
//  ContentView.swift
//  App06-ToDo-Firebase
//
//  Created by user205865 on 10/7/21.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct TaskListView: View {
     
    @StateObject var  taskModel = TaskModel()
    @AppStorage("titulo", store: UserDefaults(suiteName: "App06-ToDo")) var title: String = "Tarea"
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(taskModel.tasks){ task in
                        NavigationLink(destination: TaskDetailView(taskModel: taskModel, task: task)) {
                            Text(task.task)
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet{
                            deleteTask(task: taskModel.task[index])
                        }
                    }
                }
            }
            VStack{
                Spacer()
                Button{
                    title = "Tasks"
                } label:{
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                }
            }
        }
        .navigationBarTitle(title, displayMode: .inline)
        .listStyle(DefaultListStyle())
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text(title)
                    .font(.title)
                    .foregroundColor(.orange)
            }
            ToolbarItem(placement: .navigationBarTrailing){
                EditButton()
            }
            
        }
        
    }
    
    func addtask(){
        let task = Task(task: "Tarea 03", category_id: "01", priority_id: "01", is_completed: true, date_created: Date(), due_date: Date())
        taskModel.addTask(task: task)
    }
    
    func deleteTask(task: Task){
        taskModel.removeTask(task: task)
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
