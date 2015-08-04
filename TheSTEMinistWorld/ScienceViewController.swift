//
//  ScienceViewController.swift
//  STEMinistWorld
//
//  Created by Kavya on 7/13/15.
//  Copyright (c) 2015 Kavya Tewari. All rights reserved.
//

import UIKit

class ScienceViewController: UIViewController, UITabBarControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker: UIImagePickerController!
    
    @IBOutlet var scienceView: UIImageView!
    @IBOutlet var scienceButton: UIButton!
   
    @IBOutlet var techButton: UIButton!
    @IBOutlet var techView: UIImageView!
    
    @IBOutlet var mathButton: UIButton!
    @IBOutlet var mathView: UIImageView!
    
    @IBOutlet var engineeringButton: UIButton!
    @IBOutlet var engineeringView: UIImageView!

    @IBAction func takePhotos(sender: UIButton) {
        self.takePicture(sender)
    }
    @IBAction func takeScienceViewController(sender: UIButton) {
        self.takePicture(sender)
    }
    
    @IBAction func takeTechPhoto(sender: UIButton) {
        self.takePicture(sender)
    }
    
    @IBAction func takeMathPhoto(sender: UIButton) {
        self.takePicture(sender)
    }
    func takePicture(sender: UIButton) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        self.imagePicker.dismissViewControllerAnimated(true, completion: nil)
        self.scienceView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.mathView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.techView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.engineeringView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
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
    @IBOutlet weak var selfieButton: UIButton!
    
    //General Lines/Hook
    @IBOutlet weak var Line1: UILabel!
    @IBOutlet weak var Line2: UILabel!
    @IBOutlet weak var Line3: UILabel!
    
    @IBOutlet weak var disciplineDetector: UITabBarItem!
    
    override func viewDidDisappear(animated: Bool) {
        UITabBar.appearance().tintColor = UIColor.greenColor()
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        var selectedIndex = tabBarController.selectedIndex
        
        if selectedIndex == 0 {
            currentDiscipline = "Science"
            
            Line1.text = "Scientists are curious and want to know all the answers."
            Line2.text = "Does this sound like you?"
            Line3.text = "Explore the Science field to learn more!"
            
            let image = UIImage(named: "ElizabethBlackwell") as UIImage!
            roleModel1Button.setImage(image, forState: .Normal)
            
            let image2 = UIImage(named: "MarieCurie") as UIImage!
            roleModel2Button.setImage(image2, forState: .Normal)
            
            let image3 = UIImage(named: "RosalindFranklin") as UIImage!
            roleModel3Button.setImage(image3, forState: .Normal)
            
            let image4 = UIImage(named: "DorothyHodgkin") as UIImage!
            roleModel3Button.setImage(image4, forState: .Normal)
            
        }
        
        else if selectedIndex == 1 {
            println("THE CURRENT INDEX IS \(selectedIndex)")
            currentDiscipline = "Tech"
    
            Line1.text = "Technologists are ________________"
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
            
            Line1.text = "Engineers are ____________"
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
            
            Line1.text = "Mathematicians are ____________"
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
//        tabBarController.viewControllers[selectedIndex].refreshView(NSNotification())
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
        
        self.selfieButton.layer.cornerRadius = 25
        self.selfieButton.clipsToBounds = true
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
//    self.profileImageView.clipsToBounds = YES;

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//class PhotoTakingHelper : NSObject {
//    
//      var photoTakingHelper: PhotoTakingHelper?
//    
//    /** View controller on which AlertViewController and UIImagePickerController are presented */
//    weak var viewController: UIViewController!
//    var callback: PhotoTakingHelperCallback
//    var imagePickerController: UIImagePickerController?
//    
//    init(viewController: UIViewController, callback: PhotoTakingHelperCallback) {
//        self.viewController = viewController
//        self.callback = callback
//        
//        super.init()
//        
//        showPhotoSourceSelection()
//    }
//    
//        func showPhotoSourceSelection() {
//            // Allow user to choose between photo library and camera
//            let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .ActionSheet)
//            
//            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//            alertController.addAction(cancelAction)
//            
//            // Only show camera option if rear camera is available
//            if (UIImagePickerController.isCameraDeviceAvailable(.Rear)) {
//                let cameraAction = UIAlertAction(title: "Photo from Camera", style: .Default) { (action) in
//                    // do nothing yet...
//                }
//                
//                alertController.addAction(cameraAction)
//            }
//            
//            let photoLibraryAction = UIAlertAction(title: "Photo from Library", style: .Default) { (action) in
//                // do nothing yet...
//            }
//            
//            alertController.addAction(photoLibraryAction)
//            
//            viewController.presentViewController(alertController, animated: true, completion: nil)
//        }
//    
////    func takePhoto() {
////        // instantiate photo taking class, provide callback for when photo  is selected
////        photoTakingHelper = PhotoTakingHelper(viewController: self.!) { (image: UIImage?) in
////            // don't do anything, yet...
//        }
//    }
//    
//}
