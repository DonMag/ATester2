//
//  ViewController.swift
//  aTester2
//
//  Created by 3000 on 19/02/2019.
//  Copyright © 2019 n/a. All rights reserved.
//

import UIKit

// the main viewcontroller
class ViewController: UIViewController,UIScrollViewDelegate {
    
    // the scrollview contains the content view
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    // the contentview contains the imageview and the stackview
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let sampleText = [
			"This is a little text",
			"Here is some more text. This will be enough to cause word-wrapping in the label.",
			"This time, we have some\nEmbedded Line Breaks,\njust to demonstrate the auto-sizing of our custom view.",
			"And blah blah blah, blah blah blah, blah blah blah, blah blah blah, blah blah blah, blah blah blah.",
			"Another one-liner.",
			"And blah blah blah, blah blah blah, blah blah blah, blah blah blah, blah blah blah, blah blah blah.",
			"Lorem ipsum dolor sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet",
			"And so on... you get the point."
		]
		
		sampleText.forEach { str in
			
			let v = CustomView()
			v.color = .random
			v.labelText = str
			self.stackView.addArrangedSubview(v)
			
		}
		
	}
	
}

// changed the random range to 0.33 - 1.0 to keep the backgrounds a little lighter
extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: (0.33)...1),
                       green: .random(in: (0.33)...1),
                       blue: .random(in: (0.33)...1),
                       alpha: 1.0)
    }
}





// unrelated
/*import MapKit

class MapViewController: UIViewController {
    
    var points = [CLLocationCoordinate2D]() {
        didSet {
            print(points)
        }
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.isUserInteractionEnabled = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      //  mapView.removeOverlays(mapView.overlays) //Reset shapes
        if let touch = touches.first {
            let coordinate = mapView.convert(touch.location(in: mapView), toCoordinateFrom: mapView)
            points.append(coordinate)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let coordinate = mapView.convert(touch.location(in: mapView), toCoordinateFrom: mapView)
            points.append(coordinate)
            let polyline = MKPolyline(coordinates: points, count: points.count)
            mapView.addOverlay(polyline) //Add lines
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let polygon = MKPolygon(coordinates: &points, count: points.count)
        mapView.addOverlay(polygon) //Add polygon areas
        points = [] //Reset points
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = .orange
            polylineRenderer.lineWidth = 5
            return polylineRenderer
        } else if overlay is MKPolygon {
            let polygonView = MKPolygonRenderer(overlay: overlay)
            polygonView.fillColor = .magenta
            return polygonView
        }
        return MKPolylineRenderer(overlay: overlay)
    }
}
*/
