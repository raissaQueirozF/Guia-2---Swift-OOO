import Foundation

struct Acessorio: Identifiable {
    let id = UUID()
    let nome: String
    let tipo: String
    let preco: Double
}