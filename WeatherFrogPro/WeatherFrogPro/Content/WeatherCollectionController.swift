//
//  WeatherCollectionController.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 15.01.17.
//  Copyright © 2017 Libor Kučera. All rights reserved.
//

import UIKit
import ForecastIO
import CoreLocation

private let weatherReuseIdentifier = "WeatherView"
private let forecastReuseIdentifier = "ForecastCell"

class WeatherCollectionController: UICollectionViewController {
    
    let client : DarkSkyClient
    
    var forecast : Forecast? {
        didSet {
            print(forecast ?? "nil")
        }
    }
    
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
    @IBAction func refreshTapped(_ sender: UIBarButtonItem) {
        self.configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.client = DarkSkyClient(apiKey: "65bc74d73ce003bdb16501dfcaddefb2")
        self.client.language = .czech
        self.client.units = .auto
        super.init(coder: aDecoder)
    }
    
    lazy var timeFormatter = { () -> DateFormatter in
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.doesRelativeDateFormatting = true
        return formatter
    }()
    
    lazy var temperatureFormatter = { () -> NumberFormatter in
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "°C"
        formatter.maximumFractionDigits = 1
        return formatter
    }()
    
    lazy var speedFormatter = { () -> NumberFormatter in
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "m/s"
        formatter.maximumFractionDigits = 1
        return formatter
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    func configureView() {
        // Update the user interface for the detail item.
        if let point = self.point {
            self.navigationItem.title = point.title
            if let location = point.placemark?.location {
                self.client.getForecast(location: location.coordinate, completion: { (result) in
                    DispatchQueue.main.async {
                        guard case let .success(value) = result else { return }
                        self.forecast = value.0
                        if let timezone = self.forecast?.timezone {
                            self.timeFormatter.timeZone = TimeZone.init(identifier: timezone)
                        }
                        if let units = self.forecast?.flags?.units {
                            switch units {
                                case .uk:
                                    self.speedFormatter.currencySymbol = "mph"
                                case .ca:
                                    self.speedFormatter.currencySymbol = "kph"
                                case .us:
                                    self.temperatureFormatter.currencySymbol = "F"
                                    self.speedFormatter.currencySymbol = "mph"
                                default:
                                    break
                            }
                        }
                        self.collectionView?.reloadData()
                    }
                })
            }
        }
    }
    
    var point: Point? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showForecast" {
            let controller = (segue.destination as! UINavigationController).topViewController as! ForecastViewController
            
            if sender is ForecastCell {
                if let indexPath = self.collectionView?.indexPath(for: sender as! ForecastCell) {
                    if let dataPoint = self.forecast?.hourly?.data[indexPath.item] as DataPoint? {
                        controller.data = dataPoint
                    }
                }
            }
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if let data = self.forecast?.hourly?.data {
            return data.count
        }
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: forecastReuseIdentifier, for: indexPath) as! ForecastCell
    
        // Configure the cell
        if let data = self.forecast?.hourly?.data {
            if let dataPoint = data[indexPath.item] as DataPoint? {
                
                if let summary = dataPoint.summary {
                    cell.summaryLabel.text = summary
                }
                
                cell.timeLabel.text = self.timeFormatter.string(from: dataPoint.time)
                
                if let temperature = dataPoint.temperature {
                    cell.temperatureLabel.text = self.temperatureFormatter.string(for: temperature)
                }
                
                if let icon = dataPoint.icon {
                    cell.iconView.image = UIImage.init(named: icon.rawValue)
                }
                
            }
        }
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: weatherReuseIdentifier, for: indexPath) as! WeatherView
        
        // Configure the view
        if let hourly = self.forecast?.hourly {
            
            if let summary = hourly.summary {
                view.summaryLabel.text = summary
            }
            
            if let icon = hourly.icon {
                view.iconView.image = UIImage.init(named: icon.rawValue)
            }
        }
        
        return view
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let forecastCell = collectionView.cellForItem(at: indexPath) as! ForecastCell? {
            self.performSegue(withIdentifier: "showForecast", sender: forecastCell)
        }
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
 

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
     */
    

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
 */
    

}
