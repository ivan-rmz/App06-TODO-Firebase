//
//  TaskDetailView.swift
//  App06-ToDo-Firebase
//
//  Created by user205865 on 10/11/21.
//

import SwiftUI

struct TaskDetailView: View {
    @State var taskModel = TaskModel()
    @State var task: Task
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(taskModel: TaskModel(), task: Task(id: "01", task: "Tarea 01", category_id: "01", priority_id: "01", is_completed: false, date_created: Date(), due_date: Date()))
    }
}
