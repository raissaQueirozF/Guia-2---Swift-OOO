import Foundation

extension String {
    func formatarParaNumeroSerie(tamanho: Int = 10) -> String {
        if self.count >= tamanho {
            return String(self.suffix(tamanho))
        }
        
        let zeros = String(repeating: "0", count: tamanho - self.count)
        return zeros + self
    }
}