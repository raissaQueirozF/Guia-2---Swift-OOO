import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            DeviceListView(viewModel: DeviceListViewModel())
        }
    }
}

#Preview {
    ContentView()
}