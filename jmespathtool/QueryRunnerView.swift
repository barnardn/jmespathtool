import SwiftUI

struct QueryRunnerView: View {
    @State private var model = QueryRunnerViewModel()

    var body: some View {
        Form {
            HStack {
                TextField("Query:", text: $model.queryString)
                Button(
                    "Execute",
                    action: { model.runQuery() }
                )
            }
            HStack {
                GroupBox("JSON Input") {
                    VStack(alignment: .leading) {
                        TextEditor(text: $model.jsonInput)
                        Button(
                            "Clipboard",
                            action: { model.jsonFromClipboard() }
                        )
                    }
                }
                GroupBox("Query Results") {
                    VStack(alignment: .leading) {
                        TextEditor(text: $model.queryResults)
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
    QueryRunnerView()
}
