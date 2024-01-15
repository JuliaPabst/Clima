//
//  ViewController.swift
//  Clima
//
//  Created by Julia Pabst on 11.01.24.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    @IBOutlet var conditionImageView: UIImageView!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        searchTextField.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}

//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: UIButton) {
         // print(searchTextField.text ?? "empty")
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // print(searchTextField.text ?? "empty")
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != "" {
            return true
        } else {
            searchTextField.placeholder = "Type something!"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // print(searchTextField.text ?? "NULL")
        if let city = searchTextField.text {
            weatherManager.fetchWeather(city: city)
        }
        
        searchTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}






