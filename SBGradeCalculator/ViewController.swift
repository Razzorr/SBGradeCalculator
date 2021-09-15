//
//  ViewController.swift
//  SBGradeCalculator
//
//  Created by ACVK on 5/10/20.
//  Copyright © 2020 ACVK. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
    

    @IBOutlet weak var CurrentGrade: UITextField!
    @IBOutlet weak var TestWeighting: UITextField!
    @IBOutlet weak var DesiredGrade: UITextField!
    @IBOutlet weak var Average: UILabel!

    
    //App ID: ca-app-pub-6889887748450827~2208942042
    //Unit ID: ca-app-pub-6889887748450827/3145306117
    //Test ID: ca-app-pub-3940256099942544/2934735716

    @IBOutlet weak var CurrentGrade2: UITextField!
    @IBOutlet weak var TestWeighting2: UITextField!
    @IBOutlet weak var TestGrade2: UITextField!
    @IBOutlet weak var Average2: UILabel!
    

    
     
       
    var firstCalc = 00.00
    var testScore = 00.00
    var calculation = 00.00
    var tww = 00.00
    var Grade = 00.00
    
    
    var tww2 = 0.0
    var calc = 0.0
    var avg = 0.0
 
    
    
    private let banner: GADBannerView = {
        let banner = GADBannerView()
        banner.adUnitID = "ca-app-pub-6889887748450827/2671976474"
        banner.load(GADRequest())
        return banner
    }()
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTapGesture()
        overrideUserInterfaceStyle = .dark
        
        //First Banner
        banner.rootViewController = self
        banner.backgroundColor = .secondarySystemBackground
        
      
        view.addSubview(banner)
       
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //banner.frame = CGRect(x: 25, y: view.frame.size.height-90, width: 375, height: 75).integral
        
        if UIDevice.current.deviceCategory() == .iPhone6 {
           banner.frame = CGRect(x: 25, y: view.frame.size.height-90, width: 320, height: 75).integral
       } else if UIDevice.current.deviceCategory() == .iPhone5 {
            banner.frame = CGRect(x: 25, y: view.frame.size.height-60, width: 275, height: 58).integral
           
       } else {
            banner.frame = CGRect(x: 25, y: view.frame.size.height-90, width: 375, height: 75).integral
       }
    }
       
    @IBAction func CurrentGrade(_ sender: UITextField) {
        let CG: Double? = Double(CurrentGrade.text!)
        
        print(CG as Any)
    }

    @IBAction func TestWeighting(_ sender: Any) {
        let TW: Double? = Double(TestWeighting.text!)
        
        print(TW as Any)
    }
       
    @IBAction func DesiredGrade(_ sender: Any) {
        let DG: Double? = Double(DesiredGrade.text!)
        
        print(DG as Any)
    }
    
    
    
    
    @IBAction func CurrentGrade2(_ sender: Any) {
        let CG2: Double? = Double(CurrentGrade2.text!)
        
        print(CG2 as Any)
    }
    
    @IBAction func TestWeighting2(_ sender: Any) {
        let TW2: Double? = Double(TestWeighting2.text!)
        
        print(TW2 as Any)
    }
    
    @IBAction func TestGrade2(_ sender: Any) {
        let TG2: Double? = Double(TestGrade2.text!)
        
        print(TG2 as Any)
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
    
    
       
       
    @IBAction func Generate(_ sender: Any) {
           
        view.endEditing(true)
        let DG: Double? = Double(DesiredGrade.text!)
        let CG: Double? = Double(CurrentGrade.text!)
        let TW: Double? = Double(TestWeighting.text!)
        
        
             
        if(DG == nil || CG == nil || TW == nil){
           
            let alert2 = UIAlertController(title: "Invalid Input", message: "Fill in all blanks!", preferredStyle: .alert)
           alert2.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert2, animated: true, completion: nil)
        } else {
            tww = Double(TW!/100)
            firstCalc = Double( DG! - ( (1-tww) * CG!) )
            testScore = Double(firstCalc / tww)
            testScore = Double(round(100*testScore)/100)
            Average.text = "\(testScore)%"
            
            //CurrentGrade.text = "\(CG!)%"
            //TestWeighting.text = "\(TW!)%"
            //DesiredGrade.text = "\(DG!)%"
    
        }
        
        
    
    }
    
    
    @IBAction func Generate2(_ sender: Any) {
        view.endEditing(true)
        let CG2: Double? = Double(CurrentGrade2.text!)
        let TW2: Double? = Double(TestWeighting2.text!)
        let TG2: Double? = Double(TestGrade2.text!)
        
       
        
        
        if(CG2 == nil || TW2 == nil || TG2 == nil){
            let alert = UIAlertController(title: "Invalid Input", message: "Fill in all blanks!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))

            self.present(alert, animated: true, completion: nil)
        } else {
            tww2 = Double(TW2!/100)
            calc = Double( (1-tww2) * CG2!)
            avg = Double( (TG2! * tww2) + calc )
            avg = Double(round(1000*avg)/1000)
            Average2.text = "\(avg)%"
            //CurrentGrade2.text = "\(CG2!)%"
            //TestWeighting2.text = "\(TW2!)%"
            //TestGrade2.text = "\(TG2!)%"
            
        }
        
        
        
    }
    
    
    
    
    
   



}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}





extension ViewController: GADBannerViewDelegate{
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("recieved ad")
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print(error)
    }
}


