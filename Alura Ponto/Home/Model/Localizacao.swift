//
//  Localizacao.swift
//  Alura Ponto
//
//  Created by Natanael Alves Pereira on 10/02/22.
//

import Foundation
import CoreLocation

protocol LocalizacaoDelegate: AnyObject{
    func atualizaLocalizacaoDoUsusario(latitude: Double?, longitude: Double?)
    
}
class Localizacao: NSObject {
    
    private var latitude: CLLocationDegrees?
    private var longitude: CLLocationDegrees?
    weak var delegate: LocalizacaoDelegate?
    
    func permissao(_ gerenciadorDeLocalizacao: CLLocationManager){
        gerenciadorDeLocalizacao.delegate = self
        
        if CLLocationManager.locationServicesEnabled() {
            switch gerenciadorDeLocalizacao.authorizationStatus {
            case .authorizedAlways, .authorizedWhenInUse:
                gerenciadorDeLocalizacao.startUpdatingLocation()
                break
            case.denied:
                break
            case .notDetermined:
                gerenciadorDeLocalizacao.requestWhenInUseAuthorization()
            default:
                break
            }
        }
    }
         
}

extension Localizacao: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
           manager.startUpdatingLocation()
        
        default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if let localizacao = locations.first {
            latitude = localizacao.coordinate.latitude
            longitude = localizacao.coordinate.longitude
        }
        
    delegate?.atualizaLocalizacaoDoUsusario(latitude: latitude, longitude: longitude)
    }
}
