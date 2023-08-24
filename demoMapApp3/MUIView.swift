//
//  MUIView.swift
//  demoMapApp3
//
//  Created by IZIY on 8/23/23.
//

import SwiftUI
import MapKit


struct MUIView: View {
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 35.78705057355375,
            longitude:51.459305866753766
         )
        , span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5
         )
    )
    
    @State var tracking: MapUserTrackingMode = .follow

    var body: some View {
        Map(
            coordinateRegion: $region,
            interactionModes: MapInteractionModes.all,
            showsUserLocation: true,
            userTrackingMode: $tracking
        )
    }
}

struct MUIView_Previews: PreviewProvider {
    static var previews: some View {
        MUIView()
    }
}
