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
        }
    
    override func viewDidLayoutSubviews(){
        
        super.viewDidLayoutSubviews()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        // in my first attempt this variable
        var startH = 0
        
        // I take the screen width because I have a square image view
        // any side of the image view must be the same size as the device width
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        print("Screen width = \(screenWidth), screen height = \(screenHeight)")
        
        for i in 0...10 {
            
            // this creates 11 identical views, that's not exactly my scenario
            // because my views are always the same width
            // but have different height and completely different contents
            // with this code, I was simply testing the ability of a view to expand
            // in case the text was bigger than the containing view
            
            let v = CustomView()
            v.color = .random
            let heightConstraintA = v.heightAnchor.constraint(equalToConstant: 100)
            heightConstraintA.isActive = true
            heightConstraintA.priority = UILayoutPriority(rawValue: 999)
            v.labelText = "Lorem ipsum dolor sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet"
            v.translatesAutoresizingMaskIntoConstraints = false
            self.stackView.addArrangedSubview(v)
            
            // 100 is a "wreck" from the first attempts based on frames, but I still use it
            startH += 100
        }
        
        // the content layout guide of the scrollview
        let scrollerLG = scrollView.contentLayoutGuide
        
        // the constraint of the scrollerLG
        // 375 is the currently hard coded width of the top image view (it's ok if you test for iPhone 6)
        // 1100 is 100*11 arranged subviews, with height 100
        scrollerLG.heightAnchor.constraint(equalToConstant: CGFloat(375+1100)).isActive = true
        
        scrollView.contentSize = contentView.frame.size
        
        print(contentView.subviews)
        print(stackView.subviews)
    
        view.layoutIfNeeded()
        
        // safe area isnets
        scrollView.contentInset.bottom = view.safeAreaInsets.bottom
        
    }
    
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}


// first attempts commented out
// they basically used frames

/*var v = CustomView(frame: CGRect(x: 0, y: Int(screenWidth)+startH, width: Int(screenWidth), height: 100))
 v.labelText = "Lorem ipsum dolor sit amet"
 contentView.addSubview(v)*/

/*if(i > 0){
 let line = UIView(frame: CGRect(x: 0, y: Int(screenWidth)+startH+1, width: Int(screenWidth), height: 1))
 line.backgroundColor = UIColor.red
 contentView.addSubview(line)
 }*/

/* var v = CustomView(frame: CGRect(x:0,y:0,width:320,height:100))
 v.labelText = "Lorem ipsum dolor sit amet"
 self.stackView.addArrangedSubview(v)*/

//  print(375+startH)
/* let v = UIView(frame: CGRect(x: 0, y: Int(screenWidth)+startH, width: Int(screenWidth), height: 100))
 v.backgroundColor = .random
 //     v.backgroundColor = UIColor.red
 contentView.addSubview(v)*/

// let v = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 100))
// let v = CustomView(frame: CGRect(x:0,y:0,width:320,height:100))
/*    let v = CustomView()
 //v.backgroundColor = .random
 v.labelText = "Lorem ipsum dolor sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet sit amet"
 v.heightAnchor.constraint(equalToConstant: 100).isActive = true
 v.widthAnchor.constraint(equalToConstant: 320).isActive = true
 //     v.backgroundColor = UIColor.red
 self.stackView.addArrangedSubview(v)*/





























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
