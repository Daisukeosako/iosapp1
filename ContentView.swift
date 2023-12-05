import SwiftUI
struct ContentView: View {
    @State private var isTextVisible = true
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
                MultiDatePicker(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Binding<Set<DateComponents>>@*/.constant([])/*@END_MENU_TOKEN@*/)
                    .padding(/*@START_MENU_TOKEN@*/.all, 30.0/*@END_MENU_TOKEN@*/)
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
    ContentView()
}