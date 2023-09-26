//
//  MapView.swift
//  MapKitApp
//
//  Created by FAMM on 26/09/23.
//

import SwiftUI

struct MapView: View {
    
    var viewModel: MapViewModel
    
    init(viewModel: MapViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
