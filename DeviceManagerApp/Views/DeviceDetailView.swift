import SwiftUI

struct DeviceDetailView: View {
    let dispositivo: DispositivoEletronico
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Group {
                    detalhe("Marca", dispositivo.marca)
                    detalhe("Modelo", dispositivo.modelo)
                    detalhe("Número de Série", dispositivo.numeroSerie)
                    detalhe("Preço", "R$ \(String(format: "%.2f", dispositivo.preco))")
                    detalhe("Preço com desconto", "R$ \(String(format: "%.2f", dispositivo.precoComDesconto))")
                    detalhe("Status", dispositivo.ligado ? "Ligado" : "Desligado")
                }
                
                if let smartphone = dispositivo as? Smartphone {
                    Divider()
                    detalhe("Tipo", "Smartphone")
                    detalhe("Tela", "\(smartphone.tamanhoTela)\"")
                    detalhe("Tem câmera", smartphone.temCamera ? "Sim" : "Não")
                    Text(smartphone.tirarFoto())
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                
                if let notebook = dispositivo as? Notebook {
                    Divider()
                    detalhe("Tipo", "Notebook")
                    detalhe("Tela", "\(notebook.tamanhoTela)\"")
                    detalhe("Armazenamento", "\(notebook.capacidadeArmazenamento) GB")
                }
            }
            .padding()
        }
        .navigationTitle(dispositivo.modelo)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private func detalhe(_ titulo: String, _ valor: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(titulo)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(valor)
                .font(.body)
        }
    }
}