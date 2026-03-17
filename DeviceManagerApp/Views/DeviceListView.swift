import SwiftUI

struct DeviceListView: View {
    @StateObject var viewModel: DeviceListViewModel
    
    var body: some View {
        List {
            Section("Dispositivos") {
                ForEach(viewModel.dispositivos) { dispositivo in
                    NavigationLink {
                        DeviceDetailView(dispositivo: dispositivo)
                    } label: {
                        DeviceRowView(dispositivo: dispositivo)
                    }
                }
            }
            
            Section("Acessórios") {
                ForEach(viewModel.acessorios) { acessorio in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(acessorio.nome)
                            .font(.headline)
                        Text("\(acessorio.tipo) • R$ \(String(format: "%.2f", acessorio.preco))")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .navigationTitle("Device Manager")
        .toolbar {
            Button("Desconto 5%") {
                viewModel.aplicarDescontoEmTodos(5)
            }
        }
    }
}

#Preview {
    NavigationStack {
        DeviceListView(viewModel: DeviceListViewModel())
    }
}