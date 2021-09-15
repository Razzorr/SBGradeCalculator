//
//  MainController.swift
//  SBGradeCalculator
//
//  Created by ACVK on 5/13/20.
//  Copyright © 2020 VACK. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds

class MainController: UIViewController {
    
    
    @IBOutlet weak var TestGradeChart: UIButton!
    
    
    
    private let banner3: GADBannerView = {
        let banner = GADBannerView()
        banner.adUnitID = "ca-app-pub-6889887748450827/9282945846"
        banner.load(GADRequest())
        return banner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTapGesture()
        overrideUserInterfaceStyle = .dark
        
        //First Banner
        banner3.rootViewController = self
        banner3.backgroundColor = .secondarySystemBackground
        
      
        view.addSubview(banner3)
        
        
       
 
        
        //
       
    }
    
    
    @IBAction func TestGradeChart(_ sender: UIButton!) {
    
        if UIDevice.current.deviceCategory() != .iPhone5  {
         let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let gradeChart = storyBoard.instantiateViewController(withIdentifier: "GradeChart") as! GradeChart
         self.present(gradeChart, animated:true, completion:nil)
       }
       
    }
 
 
    
    
    
    override func viewDidLayoutSubviews() {
       super.viewDidLayoutSubviews()
      
        if UIDevice.current.deviceCategory() == .iPhone6 {
            banner3.frame = CGRect(x: 25, y: view.frame.size.height-90, width: 320, height: 75).integral
        } else if UIDevice.current.deviceCategory() == .iPhone5 {
             banner3.frame = CGRect(x: 25, y: view.frame.size.height-60, width: 275, height: 58).integral
            
        } else {
             banner3.frame = CGRect(x: 25, y: view.frame.size.height-90, width: 375, height: 75).integral
        }
       
    }
    
    
    
    
    
    private func configureTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
       
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
       
    @objc func handleTap(){
        print("Handle Tap")
        view.endEditing(true)
    }
    

    
}

extension UIDevice {

enum DeviceCategory  {

    case iPhone4
    case iPhone5
    case iPhone6
    case iPhone6Plus
    case iPhoneX
    case iPhoneXR
    case iPadPro12inch
    case iPad

}



func deviceCategory() -> DeviceCategory {

    let height = UIScreen.main.bounds.size.height
    switch height  {

    case 480:
        return .iPhone4
    case 568:
        return .iPhone5
    case 667:
        return .iPhone6
    case 736:
        return .iPhone6Plus
    case 812:
        return .iPhoneX
    case 896:
        return .iPhoneXR
    case 1366:
        return .iPadPro12inch
    default:
        return .iPad
    }
}
}
