import SwiftUI

struct QueryRunnerView: View {
    @State private var model = QueryRunnerViewModel()

    var body: some View {
        Form {
            queryField
            HStack {
                inputEditor
                outputEditor
            }
        }
        .padding()
    }

    private var queryField: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Query:", text: $model.queryString)
                    .onSubmit {
                        model.runQuery()
                    }
                    .onChange(of: model.queryString) { _, _ in
                        model.clearErrorMessage()
                    }
                Button(
                    "Execute",
                    action: { model.runQuery() }
                )
            }
            HStack {
                Text("Query:")
                    .hidden()
                Text(model.errorMessage)
                    .font(.caption2)
                    .foregroundStyle(Color.red)
            }
        }
    }

    private var inputEditor: some View {
        GroupBox("JSON Input") {
            VStack(alignment: .leading) {
                TextEditor(text: $model.jsonInput)
                Button(
                    "Clipboard",
                    action: { model.jsonFromClipboard() }
                )
            }
        }
    }

    private var outputEditor: some View {
        GroupBox("Query Results") {
            VStack(alignment: .leading) {
                TextEditor(text: $model.queryResults)
                    .disabled(true)
                Button(
                    "Copy",
                    action: { model.addResultsToClipboard() }
                )
            }
        }
    }
}

#Preview {
    QueryRunnerView()
}
