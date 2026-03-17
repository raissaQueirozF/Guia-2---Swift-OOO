import Foundation

class DispositivoEletronico: Identifiable {
    let id = UUID()
    let marca: String
    var modelo: String
    
    var preco: Double {
        willSet {
            print("Preço de \(modelo) será alterado de \(preco) para \(newValue)")
        }
        didSet {
            print("Preço de \(modelo) foi alterado de \(oldValue) para \(preco)")
        }
    }
    
    private(set) var numeroSerie: String
    var ligado: Bool
    
    var precoComDesconto: Double {
        preco * 0.9
    }
    
    init(marca: String, modelo: String, preco: Double) {
        self.marca = marca
        self.modelo = modelo
        self.preco = preco
        self.ligado = false
        self.numeroSerie = DispositivoEletronico.gerarNumeroSerie()
    }
    
    convenience init(marca: String, modelo: String) {
        self.init(marca: marca, modelo: modelo, preco: 99.99)
    }
    
    private static func gerarNumeroSerie() -> String {
        let numeroAleatorio = Int.random(in: 1...999999)
        return String(numeroAleatorio).formatarParaNumeroSerie(tamanho: 10)
    }
    
    func ligar() {
        guard !ligado else {
            print("\(modelo) já está ligado.")
            return
        }
        
        ligado = true
        print("\(modelo) foi ligado.")
    }
    
    func desligar() {
        guard ligado else {
            print("\(modelo) já está desligado.")
            return
        }
        
        ligado = false
        print("\(modelo) foi desligado.")
    }
    
    func aplicarDesconto(percentual: Double) {
        guard percentual > 0 else { return }
        preco -= preco * (percentual / 100)
    }
    
    @discardableResult
    func exibirDetalhes() -> String {
        let status = ligado ? "Ligado" : "Desligado"
        let descricao = """
        Marca: \(marca)
        Modelo: \(modelo)
        Número de Série: \(numeroSerie)
        Preço: R$ \(String(format: "%.2f", preco))
        Preço com 10%% de desconto: R$ \(String(format: "%.2f", precoComDesconto))
        Status: \(status)
        """
        print(descricao)
        return descricao
    }
    
    deinit {
        print("Dispositivo \(modelo) removido da memória.")
    }
}