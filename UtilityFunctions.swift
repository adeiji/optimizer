//
//  UtilityFunctions.swift
//  Graffiti
//
//  Created by adeiji on 4/10/18.
//  Copyright © 2018 Dephyned. All rights reserved.
//

import Foundation
import UIKit
import MapKit

public class UtilityFunctions {
    
    static var finishedTaskView:UIView!
    static let imageCache = NSCache<NSString, UIImage>()
    
    class func gotoUrlWithString (url: String) {
        if let url = URL(string: url) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    class func downloadImageFromHTTPS (url: URL, completion: @escaping (Error?, UIImage?) -> Void) {
        let session = URLSession(configuration: .default)
        //creating a dataTask
        let getImageFromUrl = session.dataTask(with: url) { (data, response, error) in
            //if there is any error
            if let e = error {
                //displaying the message
                print("Error Occurred: \(e)")
                DispatchQueue.main.sync {
                    completion(error, nil)
                }
            } else {
                //in case of now error, checking wheather the response is nil or not
                if (response as? HTTPURLResponse) != nil {
                    //checking if the response contains an image
                    if let imageData = data {
                        //getting the image
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.sync {
                            completion(nil, image)
                        }
                    } else {
                        print("Image file is currupted")
                    }
                } else {
                    print("No response from server for https request: \(url.absoluteString)")
                }
            }
        }
        
        //starting the download task
        getImageFromUrl.resume()
    }
    
    class func showTaskCompleted (title: String) {
        let window = (UIApplication.shared.delegate as? AppDelegate)?.window
        let navController = window?.rootViewController as? UINavigationController
        let topView = navController?.topViewController?.view
        self.finishedTaskView = Style.finishedTaskView(withSuperview: topView!, withTitle: title)
    }
    
    class func removeTaskCompletedView () {
        self.finishedTaskView.removeFromSuperview()
    }
    
    class func getTagsFromString (text: String) -> [String] {
        let words = text.split(separator: " ")
        var hashTags = [String]()
        for word in words {
            if word.hasPrefix("#") {
                let wordWithNoHashtag = word.replacingOccurrences(of: "#", with: "")
                hashTags.append(String(wordWithNoHashtag.lowercased()))
            }
        }
        
        return hashTags
    }
    
    class func tagObjectsToArray (tags: [String:Bool]?) -> [String] {
        if tags == nil {
            return [String]()
        }
        var tagsArray = [String]()
        for tag in (tags?.keys)! {
            tagsArray.append(tag)
        }
        
        return tagsArray
    }
    
    class func nextLetter(_ letter: String) -> String? {
        // Check if string is build from exactly one Unicode scalar:
        guard let uniCode = UnicodeScalar(letter) else {
            return nil
        }
        switch uniCode {
        case "a" ..< "z":
            return String(UnicodeScalar(uniCode.value + 1)!)
        default:
            return "a"
        }
    }
    
    class func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    /**
     * - Description Get a dictionary of tags of type [<tagName>:true] so that we can query the db for spots
     * - Returns [String:Bool] the spot objects to save to Firebase
     */
    class func getTagObjects (tags: [String]) -> [String:Bool] {
        var tagObjects = [String:Bool]()
        for tag in tags {
            tagObjects[tag] = true
        }
        return tagObjects
    }
    
    class func getRandomColor () -> UIColor {
        let num = arc4random_uniform(10)
        switch num {
        case 0:
            return UIColor.Style.htPeach
        case 1:
            return UIColor.Style.htTeal
        case 2:
            return UIColor.Style.htBlueish
        case 3:
            return UIColor.Style.htRedish
        case 4:
            return UIColor.Style.htLightPurple
        case 5:
            return UIColor.Style.htLightBlue
        case 6:
            return UIColor.Style.htLightGreen
        case 7:
            return UIColor.Style.htLightOrange
        case 8:
            return UIColor.Style.htDarkPurple
        case 9:
            return UIColor.Style.htDookieGreen
        default:
            return .white
        }
    }
    
    class func getRegionSpan (distance: Double) -> Double {
        if distance > 10000000 {
            return distance / 10
        } else if distance > 1000000 {
            return distance / 10
        } else if distance > 500000 {
            return distance / 10
        } else if distance > 10000 {
            return distance / 10
        } else if distance > 1000 {
            return distance /  2
        }
        else {
            return distance
        }
    }
    
    class func showMap (latitude: Double, longitude: Double, distance: Double, id: String, completion: @escaping (UIImage?) -> Void) {
        
        let mapSnapshotOptions = MKMapSnapshotter.Options()
        
        // Set the region of the map that is rendered.
        let location = CLLocationCoordinate2DMake(latitude, longitude) // Apple HQ
        let region = MKCoordinateRegion(center: location, latitudinalMeters: getRegionSpan(distance: distance), longitudinalMeters: getRegionSpan(distance: distance))
        mapSnapshotOptions.region = region
        
        // Set the scale of the image. We'll just use the scale of the current device, which is 2x scale on Retina screens.
        mapSnapshotOptions.scale = UIScreen.main.scale
        
        // Set the size of the image output.
        mapSnapshotOptions.size =  CGSize(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.width - 40)
        
        // Show buildings and Points of Interest on the snapshot
        mapSnapshotOptions.showsBuildings = true
        mapSnapshotOptions.showsPointsOfInterest = true
        
        let snapShotter = MKMapSnapshotter(options: mapSnapshotOptions)
        snapShotter.start { (snapshot, error) in
            if let snapshot = snapshot {
                self.imageCache.setObject(snapshot.image, forKey: id as NSString)
                completion(snapshot.image)
            }
            
            if let error = error {
                print("\(error.localizedDescription)")
                completion(nil)
            }
        }
    }
    
    class func mapActionSheet (placeLocation: CLLocationCoordinate2D, currentLocation:CLLocation) -> UIAlertController {
        let lat = currentLocation.coordinate.latitude
        let long = currentLocation.coordinate.longitude
        
        let placeLat = placeLocation.latitude
        let placeLong = placeLocation.longitude
        let actionSheet = UIAlertController(title: "Directions", message: "Get Directions to here", preferredStyle: .actionSheet)
        // User presses the Google Maps button
        let googleMapsAction = UIAlertAction(title: "Google Maps", style: .default) { (action) in
            // Check if the user has google maps installed
            if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
                // Open Google maps with the direction that we are going to
                UIApplication.shared.open(URL(string:"comgooglemaps://?saddr=\(lat),\(long)&daddr=\(placeLat),\(placeLong)&directionsmode=driving")!, options: [:], completionHandler: nil)
            } else {
                NSLog("Can't use comgooglemaps://");
            }
        }
        // User presses the Apple Maps button
        let appleMapsAction = UIAlertAction(title: "Apple Maps", style: .default, handler: { (action) in
            // Open apple maps with the lat/long of the tag
            let appleMapsURL = URL(string:"http://maps.apple.com/?saddr=\(lat),\(long)&daddr=\(placeLat),\(placeLong)")!
            UIApplication.shared.open(appleMapsURL, options: [:], completionHandler: nil)
        })
        
        actionSheet.addAction(googleMapsAction)
        actionSheet.addAction(appleMapsAction)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        return actionSheet
    }
    
//    class func getDistanceFromLocation (locationCoordinates: CLLocationCoordinate2D?) -> Double? {
//        if let lat = locationCoordinates?.latitude, let long = locationCoordinates?.longitude {
//            let location = CLLocation(latitude: lat, longitude: long)
//            if let currentLoc = Locator.currentLocation {
//                let distance = location.distance(from: currentLoc)
//                return distance
//            }
//        }
//        
//        return nil
//    }
}

