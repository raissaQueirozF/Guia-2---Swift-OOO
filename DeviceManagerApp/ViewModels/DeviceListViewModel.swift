import Foundation
import SwiftUI

final class DeviceListViewModel: ObservableObject {
    @Published var dispositivos: [DispositivoEletronico] = []
    @Published var acessorios: [Acessorio] = []
    
    init() {
        carregarDados()
    }
    
    func carregarDados() {
        dispositivos = MockData.dispositivos()
        acessorios = MockData.acessorios()
    }
    
    func detalhesResumo(for dispositivo: DispositivoEletronico) -> String {
        dispositivo.exibirDetalhes()
    }
    
    func aplicarDescontoEmTodos(_ percentual: Double) {
        dispositivos.forEach { $0.aplicarDesconto(percentual: percentual) }
        objectWillChange.send()
    }
}