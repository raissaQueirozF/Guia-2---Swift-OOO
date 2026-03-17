import SwiftUI

struct DeviceRowView: View {
    let dispositivo: DispositivoEletronico
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(dispositivo.modelo)
                .font(.headline)
            
            Text(dispositivo.marca)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Text("R$ \(String(format: "%.2f", dispositivo.preco))")
                .font(.footnote)
        }
        .padding(.vertical, 4)
    }
}