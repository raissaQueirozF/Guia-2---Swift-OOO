import Foundation

enum MockData {
    static func dispositivos() -> [DispositivoEletronico] {
        let smartphone = Smartphone(
            marca: "Apple",
            modelo: "iPhone 15",
            preco: 7999.90,
            tamanhoTela: 6.1,
            temCamera: true
        )
        
        let notebook = Notebook(
            marca: "Dell",
            modelo: "Inspiron 15",
            preco: 4599.90,
            tamanhoTela: 15.6,
            capacidadeArmazenamento: 512
        )
        
        return [smartphone, notebook]
    }
    
    static func acessorios() -> [Acessorio] {
        [
            Acessorio(nome: "Carregador Turbo", tipo: "Energia", preco: 199.90),
            Acessorio(nome: "Capa Protetora", tipo: "Proteção", preco: 89.90)
        ]
    }
}