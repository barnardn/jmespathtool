import FoundationTools
import SwiftUI

struct SavedQueriesView: View {
    @State var queries: [Query]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Queries")
                .font(.title)
                .padding(.bottom, 8)
                .padding(.leading, 8)
            VStack(spacing: 0) {
                queriesList
                listToolbar
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(EdgeInsets(top: 12, leading: 12, bottom: 24, trailing: 12))
    }

    var queriesList: some View {
        List(queries, id: \.id) { query in
            VStack(alignment: .leading) {
                Text(query.summary ?? query.query)
                    .font(.headline)
                if query.summary.isNotNilAndNotEmpty {
                    Text(query.query)
                        .font(.monospaced(.body)())
                        .foregroundStyle(.secondary)
                        .alignmentGuide(
                            .leading,
                            computeValue: { dimension in
                                dimension[.leading] - 8
                            }
                        )
                }
            }
        }
    }

    var listToolbar: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Button(
                    action: { },
                    label: { GradientButton(glyph: "plus") }
                )
                Divider()
                Button(
                    action: { },
                    label: { GradientButton(glyph: "minus") }
                )
                Spacer()
            }
            .frame(height: 24)
            .buttonStyle(.borderless)
        }
        .background(Rectangle().opacity(0.04))
    }
}

struct GradientButton: View {
    var glyph: String
    var body: some View {
        Image(systemName: glyph)
            .fontWeight(.medium)
            .frame(width: 24, height: 24)
    }
}

#Preview {
    SavedQueriesView(queries: Query.previews)
}
