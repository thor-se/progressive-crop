import SwiftUI
import Glur

struct ContentView: View {
    @State var image: NSImage?
    @State var importing: Bool = false
    @State var replicate: Bool = true
    @State var edge: Bool = false
    @State var blur: Bool = false
    @State var exporting: Bool = false
    
    var result: some View {
        GeometryReader { proxy in
            if replicate {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Image("sample")
                            .resizable()
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .frame(width: proxy.size.width * 0.1, height: proxy.size.height * 0.1)
                        Image("sample")
                            .resizable()
                            .frame(width: proxy.size.width * 0.8, height: proxy.size.height * 0.1)
                        Image("sample")
                            .resizable()
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .frame(width: proxy.size.width * 0.1, height: proxy.size.height * 0.1)
                    }
                    HStack(spacing: 0) {
                        Image("sample")
                            .resizable()
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .frame(width: proxy.size.width * 0.1, height: proxy.size.height * 0.8)
                        Image("sample")
                            .resizable()
                            .frame(width: proxy.size.width * 0.8, height: proxy.size.height * 0.8)
                        Image("sample")
                            .resizable()
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .frame(width: proxy.size.width * 0.1, height: proxy.size.height * 0.8)
                    }
                    HStack(spacing: 0) {
                        Image("sample")
                            .resizable()
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .frame(width: proxy.size.width * 0.1, height: proxy.size.height * 0.1)
                        Image("sample")
                            .resizable()
                            .frame(width: proxy.size.width * 0.8, height: proxy.size.height * 0.1)
                        Image("sample")
                            .resizable()
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .frame(width: proxy.size.width * 0.1, height: proxy.size.height * 0.1)
                    }
                }
            } else {
                Image("sample")
                    .resizable()
            }
        }
        .aspectRatio(9/16, contentMode: .fit)
        .glur(radius: 8.0, // The total radius of the blur effect when fully applied.
              offset: 1, // The distance from the view's edge to where the effect begins, relative to the view's size.
              interpolation: 0.4, // The distance from the offset to where the effect is fully applied, relative to the view's size.
              direction: .down // The direction in which the effect is applied.
        )
        .background(Color.black)
        .cornerRadius(0)
        .padding(40)
    }
    
    var importImage: some View {
        VStack(spacing: 0) {
            GeometryReader { proxy in
                ZStack {
                    Checkerboard(rows: Int(proxy.size.height) / 5, columns: Int(proxy.size.width) / 5)
                        .fill(Color.gray)
                        .opacity(0.2)
                    result
                }
            }
            Divider()
            HStack {
                Text("epoasdm12.jpg")
                    .font(.footnote)
                Spacer()
                Text("200 MB")
                    .font(.footnote)
            }
            .foregroundStyle(.secondary)
            .padding(.vertical, 4)
            .padding(.horizontal, 10)
        }
    }
    
    var adjustments: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Style")
                            .font(.footnote)
                        Spacer()
                    }
                    Toggle(isOn: $replicate) {
                        Text("Replicate")
                            .padding(.horizontal, 4)
                    }
                }
                .padding(10)
                Divider()
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Border")
                            .font(.footnote)
                        Spacer()
                    }
                    Toggle(isOn: $edge) {
                        Text("Edge color")
                            .padding(.horizontal, 4)
                    }
                }
                .padding(10)
                Divider()
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Blur")
                            .font(.footnote)
                        Spacer()
                    }
                    Toggle(isOn: $blur) {
                        Text("Blur")
                            .padding(.horizontal, 4)
                    }
                }
                .padding(10)
                Divider()
            }
        }
    }
    
    var body: some View {
        HSplitView {
            importImage
            adjustments
        }
        .frame(minWidth: 400, minHeight: 400)
        .toolbar {
            Toggle(isOn: $importing) {
                Text("Import")
                    .padding(.horizontal, 4)
            }
            Toggle(isOn: $exporting) {
                Text("Export")
                    .padding(.horizontal, 4)
            }
        }
    }
}

#Preview {
    ContentView()
}
