import SwiftUI

struct ContentView: View {
    @State private var query = ""
    @State private var jsonInput = ""
    @State private var queryOutput = ""

    var body: some View {
        Form {
            HStack {
                TextField("Query:", text: $query)
                Button(
                    "Execute",
                    action: { }
                )
            }
            HStack {
                GroupBox("JSON Input") {
                    VStack(alignment: .leading) {
                        TextEditor(text: $jsonInput)
                        Button(
                            "Clipboard",
                            action: { }
                        )
                    }
                }
                GroupBox("Query Results") {
                    VStack(alignment: .leading) {
                        TextEditor(text: $queryOutput)
                            .disabled(true)
                        Button(
                            "Copy",
                            action: { }
                        )
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
