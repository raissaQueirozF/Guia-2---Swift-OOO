import Foundation

class Notebook: DispositivoEletronico {
    var tamanhoTela: Double
    var capacidadeArmazenamento: Int
    
    init(
        marca: String,
        modelo: String,
        preco: Double,
        tamanhoTela: Double,
        capacidadeArmazenamento: Int
    ) {
        self.tamanhoTela = tamanhoTela
        self.capacidadeArmazenamento = capacidadeArmazenamento
        super.init(marca: marca, modelo: modelo, preco: preco)
    }
    
    override func exibirDetalhes() -> String {
        let detalhesBase = super.exibirDetalhes()
        
        let descricao = """
        
        Tipo: Notebook
        Tamanho da Tela: \(tamanhoTela)"
        Armazenamento: \(capacidadeArmazenamento) GB
        """
        
        let resultado = detalhesBase + descricao
        print(resultado)
        return resultado
    }
    
    deinit {
        print("Notebook \(modelo) removido da memória.")
    }
}