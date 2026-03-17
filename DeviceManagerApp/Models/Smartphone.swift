import Foundation

final class Smartphone: DispositivoEletronico {
    var tamanhoTela: Double
    var temCamera: Bool
    
    init(
        marca: String,
        modelo: String,
        preco: Double,
        tamanhoTela: Double,
        temCamera: Bool
    ) {
        self.tamanhoTela = tamanhoTela
        self.temCamera = temCamera
        super.init(marca: marca, modelo: modelo, preco: preco)
    }
    
    func tirarFoto() -> String {
        guard ligado else {
            return "Não é possível tirar foto. O smartphone está desligado."
        }
        
        guard temCamera else {
            return "Este smartphone não possui câmera."
        }
        
        return "Foto tirada com sucesso no \(modelo)."
    }
    
    override func exibirDetalhes() -> String {
        let detalhesBase = super.exibirDetalhes()
        let camera = temCamera ? "Sim" : "Não"
        
        let descricao = """
        
        Tipo: Smartphone
        Tamanho da Tela: \(tamanhoTela)"
        Tem Câmera: \(camera)
        """
        
        let resultado = detalhesBase + descricao
        print(resultado)
        return resultado
    }
    
    deinit {
        print("Smartphone \(modelo) removido da memória.")
    }
}