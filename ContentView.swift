import SwiftUI

struct FooterMenuView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "trash")
                        .imageScale(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(Color.red)
                })
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                        .foregroundStyle(Color.red)
                })
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                        .foregroundStyle(Color.red)
                })
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                        .foregroundStyle(Color.red)
                })
                Spacer()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .padding(.vertical, 25)
            .background(Color.black)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

struct trainingmenu: View {
    var body: some View {
        Text("hello")
    }
}

struct RecordTraining {
    var date: Date
    var exercise: String
    var weight: Double
    var repetitions: Int
    var properties: [String]
}

let exerciseOptions = ["Bench Press", "Chest Fly", "Squats", "Deadlift", "Pull-ups"]
let propertyOptions = ["Assisted", "Without Assistance", "Other"]

struct recordtraining: View {
    @State private var selectedExercise = ""
    @State private var weight = ""
    @State private var repetitions = ""
    @State private var selectedProperty = ""
    var body: some View {
            Form {
                DatePicker("Date", selection: .constant(Date()))
                
                Picker("Exercise", selection: $selectedExercise) {
                    ForEach(exerciseOptions, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Weight", text: $weight)
                    .keyboardType(.numberPad)
                
                TextField("Repetitions", text: $repetitions)
                    .keyboardType(.numberPad)
                
                Picker("Property", selection: $selectedProperty) {
                    ForEach(propertyOptions, id: \.self) {
                        Text($0)
                    }
                }
                
                Button("Record Training") {
                    // ここでRecordTrainingを作成してデータを保存するなどの処理を実行します
                    let trainingRecord = RecordTraining(date: Date(), exercise: selectedExercise, weight: Double(weight) ?? 0.0, repetitions: Int(repetitions) ?? 0, properties: [selectedProperty])
                    print(trainingRecord)
                }
            }
        }
}

struct ContentView: View {
    @State private var isTextVisible = true
//    @State private var isTextVisible = false
    @State private var textOpacity: Double = 0.0
    
    var body: some View {
            if isTextVisible {
                Text("Workout Management")
                    .opacity(1.0)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation(
                                Animation
                                    .easeInOut(duration: 1.0)
                            ){
                                isTextVisible = false
                            }
                        }
                    }
            } else {
                ZStack {
                    VStack {
                        MultiDatePicker(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Binding<Set<DateComponents>>@*/.constant([])/*@END_MENU_TOKEN@*/)
                        
                        Spacer()
                            .frame(width: .infinity, height: /*@START_MENU_TOKEN@*/70.0/*@END_MENU_TOKEN@*/)
                        
                    }
                    
                    FooterMenuView()
                }
                .opacity(textOpacity)
                .onAppear {
                    withAnimation(
                        Animation.easeInOut(duration: 1.0)
                    ) {
                        textOpacity = 1.0
                    }
                }
            }
        }
}

#Preview {
//    ContentView()
    recordtraining()
}
