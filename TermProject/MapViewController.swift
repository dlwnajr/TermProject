import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var InfoLabel: UILabel!
    @IBOutlet weak var TextLabel: UILabel!
    
    var cityDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MapViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        InfoLabel.numberOfLines = 0  // 여러 줄 허용
        InfoLabel.lineBreakMode = .byWordWrapping
            
        if let parent = self.parent as? UITabBarController,
           let cityViewController = parent.viewControllers?.first as? CityViewController {
            let (city, longitude, latitude, text, description) = cityViewController.getCurrentLonLatAndText()
            print("선택한 도시 이름: \(city), longitude: \(String(describing: longitude)), latitude: \(String(describing: latitude)), text: \(String(describing: text)), description: \(String(describing: description))") // Debug line
            
            TextLabel.text = text
            InfoLabel.text = description // Set description text to InfoLabel
            
            // Check if longitude and latitude are valid before updating map
            if let longitude = longitude, let latitude = latitude {
                updateMap(title: city, longitude: longitude, latitude: latitude, text: text)
            } else {
                print("Invalid coordinates")
            }
        }
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mapView.removeAnnotations(mapView.annotations)
    }
}

extension MapViewController {
    func updateMap(title: String, longitude: Double, latitude: Double, text: String?) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        annotation.subtitle = text // Use the text from CityViewController's textField
        mapView.addAnnotation(annotation)

        // Zoom to the region with the annotation
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
}

