//
//  GradeChart.swift
//  SBGradeCalculator
//
//  Created by ACVK on 5/11/20.
//  Copyright © 2020 ACVK. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds

class GradeChart: UIViewController {
    
    @IBOutlet weak var CurrentGrade2: UITextField!
    @IBOutlet weak var TestWeighting2: UITextField!

    @IBOutlet weak var N1: UILabel!
    @IBOutlet weak var n2: UILabel!
    @IBOutlet weak var n3: UILabel!
    @IBOutlet weak var n4: UILabel!
    @IBOutlet weak var n5: UILabel!
    @IBOutlet weak var n6: UILabel!
    @IBOutlet weak var n7: UILabel!
    @IBOutlet weak var n8: UILabel!
    @IBOutlet weak var n9: UILabel!
    @IBOutlet weak var n10: UILabel!
    @IBOutlet weak var n11: UILabel!
    @IBOutlet weak var n12: UILabel!
    @IBOutlet weak var n13: UILabel!
    @IBOutlet weak var n14: UILabel!
    
    var firstCalc = 00.00
       var testScore = 00.00
       var calculation = 00.00
       var tww = 00.00
       var Grade = 00.00
    
    
    private let banner2: GADBannerView = {
           let banner2 = GADBannerView()
           banner2.adUnitID = "ca-app-pub-6889887748450827/7182067120"
           banner2.load(GADRequest())
           return banner2
       }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTapGesture()
        overrideUserInterfaceStyle = .dark
        
        
        
        //Second Banner View
        banner2.rootViewController = self
        banner2.backgroundColor = .secondarySystemBackground
        
        
        
       
        
        //view.addSubview(banner2)
        
        
        
        
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
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      
        banner2.frame = CGRect(x: 25, y: 90, width: 375, height: 75).integral
    }
    
    
    @IBAction func CurrentGrade2(_ sender: Any) {
          let CG2: Double? = Double(CurrentGrade2.text!)
          print(CG2 as Any)
          print(CurrentGrade2.text!)
      }
           
           
      @IBAction func TestWeighting2(_ sender: Any) {
          let TW2: Double? = Double(TestWeighting2.text!)
          print(TW2 as Any)
      }
    
    

    
    @IBAction func GenerateValues(_ sender: Any) {
           let CG2: Double? = Double(CurrentGrade2.text!)
           let TW2: Double? = Double(TestWeighting2.text!)
         
            if(TW2 == nil || CG2 == nil){
                let alert3 = UIAlertController(title: "Invalid Input", message: "Fill in all blanks!", preferredStyle: .alert)
               alert3.addAction(UIAlertAction(title: "Dismiss", style: .default))
                
                self.present(alert3, animated: true, completion: nil)
            } else {
                  tww = Double(TW2!/100)
                 calculation = Double( (1-tww) * CG2!)
            }
             if(CG2 != nil || TW2 != nil){
               Grade = Double( (100 * tww) + calculation )
                 Grade = Double(round(100*Grade)/100)
                 N1.text = "\(Grade)%"
                 Grade = Double((93*tww) + calculation)
                 Grade = Double(round(100*Grade)/100)
                 n2.text = "\(Grade)%"
                 Grade = Double((90*tww) + calculation)
                 Grade = Double(round(100*Grade)/100)
                 n3.text = "\(Grade)%"
                 Grade = Double((87*tww) + calculation)
                 Grade = Double(round(100*Grade)/100)
                 n4.text = "\(Grade)%"
                 Grade = Double((85*tww) + calculation)
                 Grade = Double(round(100*Grade)/100)
                 n5.text = "\(Grade)%"
                 Grade = Double((83*tww) + calculation)
                 Grade = Double(round(100*Grade)/100)
                 n6.text = "\(Grade)%"
                 Grade = Double((80*tww) + calculation)
                 Grade = Double(round(100*Grade)/100)
                 n7.text = "\(Grade)%"
                 Grade = Double((77*tww) + calculation)
                 Grade = Double(round(100*Grade)/100)
                 n8.text = "\(Grade)%"
                 Grade = Double((75*tww) + calculation)
                 Grade = Double(round(100*Grade)/100)
                 n9.text = "\(Grade)%"
                 Grade = Double((73*tww) + calculation)
                 Grade = Double(round(100*Grade)/100)
                 n10.text = "\(Grade)%"
                 Grade = Double((70*tww) + calculation)
                 Grade = Double(round(100*Grade)/100)
                 n11.text = "\(Grade)%"
                 Grade = Double((67*tww) + calculation)
                 Grade = Double(round(100*Grade)/100)
                 n12.text = "\(Grade)%"
                 Grade = Double((65*tww) + calculation)
                 Grade = Double(round(100*Grade)/100)
                 n13.text = "\(Grade)%"
                 Grade = Double((0*tww) + calculation)
                 Grade = Double(round(100*Grade)/100)
                 n14.text = "\(Grade)%"
                //CurrentGrade2.text = "\(CG2!)%"
                //TestWeighting2.text = "\(TW2!)%"
          }
       }
}


extension GradeChart : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


extension GradeChart: GADBannerViewDelegate{
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("recieved ad")
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print(error)
    }
}
