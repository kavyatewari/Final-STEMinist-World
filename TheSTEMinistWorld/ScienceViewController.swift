//
//  ScienceViewController.swift
//  STEMinistWorld
//
//  Created by Kavya on 7/13/15.
//  Copyright (c) 2015 Kavya Tewari. All rights reserved.
//

import UIKit
import RealmSwift

class ScienceViewController: UIViewController, UITabBarControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker =  UIImagePickerController()
    var userImage: UserImage?
    @IBOutlet var scienceView: UIImageView!
    @IBOutlet var scienceButton: UIButton!
    var index = 0
    
//    var displayImage : UIImage?
    
    func takePicture(sender: UIButton) {
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func takeScienceViewController(sender: UIButton) {
        //let realm = Realm()
        self.takePicture(sender)
    }
    
    func getImageFromRealm ()
    {
        let realm = Realm()
        
        let results = realm.objects(UserImage).filter("tag == \(self.index)")
        println ("RESULTS count: \(results.count)")
        if results.count > 0
        {
            let myUser = results[0]
            //         let myUser = results.
            let myUserImage = myUser.image
            self.scienceView.image = UIImage(data: myUserImage, scale: 1.0)
        }

    }
    
    func replaceImageInRealm ( image: UIImage ) {
        let realm = Realm()
        let results = realm.objects(UserImage).filter("tag == \(self.index)")
        if results.count > 0
        {
            let object = results[0]
//            realm.write() {
//                let userImage = results[0]
//                userImage.image = UIImagePNGRepresentation(image)
//            }
            realm.write { realm.delete(object) }
        }
        let newUserImage = UserImage()
        newUserImage.image = UIImageJPEGRepresentation(image, 0.8)
        newUserImage.tag = index
        realm.write{realm.add(newUserImage)}
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        self.imagePicker.dismissViewControllerAnimated(true, completion: nil)
        let realm = Realm();
        var chosenImage = info[UIImagePickerControllerOriginalImage] as? UIImage!
        self.replaceImageInRealm(chosenImage!)
            //self.scienceView.image = chosenImage
//            userImage = UserImage()
//            userImage!.setUserImage(chosenImage!)
//            userImage!.tag = self.index
//            
//            realm.write{realm.add(self.userImage!)}
    }
    
    enum discipline {
        
        case Science
        case Tech
        case Engineering
        case Math
    }
    
    var currentDiscipline: String = ""

    //General Buttons
    @IBOutlet weak var roleModel1Button: UIButton!
    @IBOutlet weak var roleModel2Button: UIButton!
    @IBOutlet weak var roleModel3Button: UIButton!
    @IBOutlet weak var roleModel4Button: UIButton!
    
    //General Lines/Hook
    @IBOutlet weak var Line1: UILabel!
    @IBOutlet weak var Line2: UILabel!
    @IBOutlet weak var Line3: UILabel!
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {

        let realm = Realm()
        var selectedIndex = tabBarController.selectedIndex
        index = tabBarController.selectedIndex
        
        
        if selectedIndex == 0 {
            currentDiscipline = "Science"
//            realm.objects(UserImage).filter("scienceTag == 0")
//            userImage!.tag = 0
            
            Line1.text = "Scientists are curious and find the answers."
            Line2.text = "Does this sound like you?"
            Line3.text = "Explore the Science field to learn more!"
            
            let image = UIImage(named: "ElizabethBlackwell") as UIImage!
            roleModel1Button.setImage(image, forState: .Normal)
            
            let image2 = UIImage(named: "MarieCurie") as UIImage!
            roleModel2Button.setImage(image2, forState: .Normal)
            
            let image3 = UIImage(named: "RosalindFranklin") as UIImage!
            roleModel3Button.setImage(image3, forState: .Normal)
            
            let image4 = UIImage(named: "DorothyHodgkin") as UIImage!
            roleModel4Button.setImage(image4, forState: .Normal)
            
            //self.scienceView.image = UIImage(data: realm.objects(UserImage))!
//            let results = realm.objects(UserImage)
        }
        
        else if selectedIndex == 1 {
            println("THE CURRENT INDEX IS \(selectedIndex)")
            currentDiscipline = "Tech"
//            realm.objects(UserImage).filter("techTag == 1")
//            userImage!.tag = 1
    
            Line1.text = "Technologists use creativity to solve needs."
            Line2.text = "Does this sound like you?"
            Line3.text = "Explore the Technology field to learn more!"
            
            let image = UIImage(named: "AdaLovelace") as UIImage!
            roleModel1Button.setImage(image, forState: .Normal)
            
            let image2 = UIImage(named: "GraceHopper") as UIImage!
            roleModel2Button.setImage(image2, forState: .Normal)
            
            let image3 = UIImage(named: "AnitaBorg") as UIImage!
            roleModel3Button.setImage(image3, forState: .Normal)
            
            let image4 = UIImage(named: "JoannaHoffman") as UIImage!
            roleModel4Button.setImage(image4, forState: .Normal)
        }
        
        else if selectedIndex == 2 { 
            currentDiscipline = "Engineering"
//            realm.objects(UserImage).filter("engineeringTag == 2")
//            userImage!.tag = 2
            
            Line1.text = "Engineers design products to fix issues."
            Line2.text = "Does this sound like you?"
            Line3.text = "Explore the Engineering field to learn more!"
            
            let image = UIImage(named: "BeulahLouiseHenry") as UIImage!
            roleModel1Button.setImage(image, forState: .Normal)
            
            let image2 = UIImage(named: "HedyLamarr") as UIImage!
            roleModel2Button.setImage(image2, forState: .Normal)
            
            let image3 = UIImage(named: "SallyRide") as UIImage!
            roleModel3Button.setImage(image3, forState: .Normal)
            
            let image4 = UIImage(named: "MarissaMayer") as UIImage!
            roleModel4Button.setImage(image4, forState: .Normal)
            
        }
        
        else if selectedIndex == 3 {
            currentDiscipline = "Math"
//            realm.objects(UserImage).filter("mathTag == 3")
//            userImage!.tag = 3
            
            Line1.text = "Mathematicians find patterns in nature."
            Line2.text = "Does this sound like you?"
            Line3.text = "Explore the Mathematics field to learn more!"
            
            let image = UIImage(named: "MariaGaetanaAgnesi") as UIImage!
            roleModel1Button.setImage(image, forState: .Normal)

            let image2 = UIImage(named: "SofiaKovalevskaya") as UIImage!
            roleModel2Button.setImage(image2, forState: .Normal)

            let image3 = UIImage(named: "EmmyNoether") as UIImage!
            roleModel3Button.setImage(image3, forState: .Normal)

            let image4 = UIImage(named: "ShakuntalaDevi") as UIImage!
            roleModel4Button.setImage(image4, forState: .Normal)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.delegate = self
        
        self.roleModel1Button.layer.cornerRadius = 42
        self.roleModel1Button.clipsToBounds = true
        
        self.roleModel2Button.layer.cornerRadius = 42
        self.roleModel2Button.clipsToBounds = true
    
        self.roleModel3Button.layer.cornerRadius = 42
        self.roleModel3Button.clipsToBounds = true
        
        self.roleModel4Button.layer.cornerRadius = 42
        self.roleModel4Button.clipsToBounds = true
        
        self.scienceView.layer.cornerRadius = 42
        self.scienceView.clipsToBounds = true

        
        
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.getImageFromRealm()
    }
}