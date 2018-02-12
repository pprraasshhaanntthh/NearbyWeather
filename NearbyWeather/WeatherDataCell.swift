//
//  WeatherDataCell.swift
//  SimpleWeather
//
//  Created by Erik Maximilian Martens on 03.12.16.
//  Copyright © 2016 Erik Maximilian Martens. All rights reserved.
//

import UIKit

class WeatherDataCell: UITableViewCell {
    
    var weatherDataIdentifier: Int!
   
    @IBOutlet weak var backgroundColorView: UIView!
    
    @IBOutlet weak var weatherConditionLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cloudCoverageLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windspeedLabel: UILabel!
    
    func configureWithWeatherDTO(_ weatherDTO: WeatherDataDTO) {
        weatherDataIdentifier = weatherDTO.cityID
        
        backgroundColorView.layer.cornerRadius = 5.0
        backgroundColorView.layer.backgroundColor = UIColor.nearbyWeatherBubble.cgColor
        
        cityNameLabel.textColor = .white
        cityNameLabel.font = .preferredFont(forTextStyle: .headline)
        
        temperatureLabel.textColor = .white
        temperatureLabel.font = .preferredFont(forTextStyle: .subheadline)
        
        cloudCoverageLabel.textColor = .white
        cloudCoverageLabel.font = .preferredFont(forTextStyle: .subheadline)
        
        humidityLabel.textColor = .white
        humidityLabel.font = .preferredFont(forTextStyle: .subheadline)
        
        windspeedLabel.textColor = .white
        windspeedLabel.font = .preferredFont(forTextStyle: .subheadline)
        
        let weatherConditionSymbol = ConversionService.weatherConditionSymbol(fromWeathercode: weatherDTO.weatherCondition[0].identifier)
        weatherConditionLabel.text = weatherConditionSymbol
        
        cityNameLabel.text = weatherDTO.cityName
        
        let temperatureDescriptor = ConversionService.temperatureDescriptor(forTemperatureUnit: WeatherDataManager.shared.temperatureUnit, fromRawTemperature: weatherDTO.atmosphericInformation.temperatureKelvin)
        temperatureLabel.text = "🌡 \(temperatureDescriptor)"
        
        cloudCoverageLabel.text = "☁️ \(weatherDTO.cloudCoverage.coverage)%"
        
        humidityLabel.text = "💧 \(weatherDTO.atmosphericInformation.humidity)%"
        
        let windspeedDescriptor = ConversionService.windspeedDescriptor(forDistanceSpeedUnit: WeatherDataManager.shared.windspeedUnit, forWindspeed: weatherDTO.windInformation.windspeed)
        windspeedLabel.text = "🎏 \(windspeedDescriptor)"
    }
}
