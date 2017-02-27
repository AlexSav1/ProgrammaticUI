//
//  ViewController.swift
//  MyProgrammaticUI
//
//  Created by Aditya Narayan on 2/23/17.
//
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let label = UILabel(frame: CGRect(x: 125, y: 35, width: 150, height: 15))
    
    //ImageViews
    let imageView = UIImageView(frame: CGRect.init(x: 50, y: 150, width: 100, height: 100))
    var backgroundImage: UIImageView? = nil
    let falcoImageView = UIImageView(frame: CGRect.init(x: 250, y: 150, width: 100, height: 100))
    
    //Calc stuff
    let textField1 = UITextField(frame: CGRect.init(x: 10, y: 300, width: 100, height: 30))
    let textField2 = UITextField(frame: CGRect.init(x: 200, y: 300, width: 100, height: 30))
    let sumLabel = UILabel(frame: CGRect(x: 180, y: 350, width: 200, height: 30))
    let sumButton = UIButton(frame: CGRect(x: 10, y: 350, width: 100, height: 30))
    
    //Square in corner
    let cube = UIView(frame: CGRect.init(x: 300, y: 600, width: 50, height: 50))
    
    //ImageArray
    let imageArray = NSArray(objects: "blurblue", "blurpurple")
    var currentImageNum = 0
    
    //Audio Player
    var player: AVAudioPlayer?
    
    var sound: NSDataAsset?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        self.label.text = "Whats Good?!"
        self.view.addSubview(self.label)
        
        self.cube.backgroundColor = UIColor.red
        self.view.addSubview(self.cube)
        
        //Instantiate gestures
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.handleRotate(sender:)))
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.handlePinch(sender:)))
        
        let swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipeLeft(sender:)))
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipeRight(sender:)))
        
        swipeGestureLeft.direction = UISwipeGestureRecognizerDirection.left
        swipeGestureRight.direction = UISwipeGestureRecognizerDirection.right
        
        self.view.addGestureRecognizer(swipeGestureLeft)
        self.view.addGestureRecognizer(swipeGestureRight)
        self.imageView.addGestureRecognizer(pinchGesture)
        self.falcoImageView.addGestureRecognizer(rotateGesture)

        
        self.createImageView()
        self.createCalc()
    }

    func createImageView(){
        
        self.backgroundImage = UIImageView(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        
        self.backgroundImage?.image = UIImage(named: "blurblue")
        self.backgroundImage?.contentMode = .scaleAspectFill
        self.view.insertSubview(self.backgroundImage!, at: 0)
        
        //fox
        self.imageView.image = UIImage(named: "fox")
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(sender:)))
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.handleLongPress(sender:)))

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap(sender:)))
       
        self.imageView.addGestureRecognizer(panGesture)
        self.imageView.addGestureRecognizer(longPressGesture)
        self.imageView.addGestureRecognizer(tapGesture)
        self.imageView.isUserInteractionEnabled = true
        
        self.view.insertSubview(self.imageView, at: 1)
        
        //falco
        self.falcoImageView.image = UIImage(named: "falco")
        
        let panGesture2 = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(sender:)))
        
        let longPressGesture2 = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.handleLongPress(sender:)))
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap(sender:)))
        
        self.falcoImageView.addGestureRecognizer(panGesture2)
        self.falcoImageView.addGestureRecognizer(longPressGesture2)
        self.falcoImageView.addGestureRecognizer(tapGesture2)
        self.falcoImageView.isUserInteractionEnabled = true
        
        self.view.insertSubview(self.falcoImageView, at: 2)
    }
    
    func createCalc(){
        
        self.textField1.backgroundColor = UIColor.white
        self.textField2.backgroundColor = UIColor.white
        
        self.textField1.borderStyle = .bezel
        self.textField2.borderStyle = .bezel
        
        self.view.addSubview(self.textField1)
        self.view.addSubview(self.textField2)
        self.view.addSubview(self.sumLabel)
        self.sumLabel.textColor = UIColor.black
        
        self.sumButton.addTarget(self, action: #selector(sumButtonPressed), for: .touchUpInside)
        self.sumButton.setTitle("Sum", for: .normal)
        self.sumButton.backgroundColor = UIColor.lightGray
        self.view.addSubview(self.sumButton)
    }
    
    func sumButtonPressed(){
        
        let num1 : Int? = Int(self.textField1.text!)
        let num2 : Int? = Int(self.textField2.text!)
        
        if num1 != nil, num2 != nil {
            let sum = (num1!) + (num2!)
            self.sumLabel.text = String(sum)
        } else {
            self.sumLabel.text = "Integers only"
        }
        
    }
  

    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        self.backgroundImage?.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        if UIDevice.current.orientation.isLandscape{
            print("Landscape")
            
            self.label.frame = CGRect(x: 300, y: 35, width: 150, height: 15)
            self.imageView.frame = CGRect(x: 150, y: 50, width: 100, height: 100)
            self.falcoImageView.frame = CGRect(x: 350, y: 50, width: 100, height: 100)
            
            self.textField1.frame = CGRect(x: 150, y: 200, width: 100, height: 30)
            self.textField2.frame = CGRect(x: 300, y: 200, width: 100, height: 30)
            self.sumLabel.frame = CGRect(x: 250, y: 250, width: 200, height: 30)
            self.sumButton.frame = CGRect(x: 150, y: 250, width: 100, height: 30)
            
            self.cube.frame = CGRect(x: 600, y: 300, width: 50, height: 50)
            
        }
        
        if UIDevice.current.orientation.isPortrait{
            print("Portrait")
            
            self.label.frame = CGRect(x: 125, y: 35, width: 150, height: 15)
            self.imageView.frame = CGRect(x: 50, y: 150, width: 100, height: 100)
            self.falcoImageView.frame = CGRect(x: 250, y: 150, width: 100, height: 100)
            
            self.textField1.frame = CGRect(x: 10, y: 300, width: 100, height: 30)
            self.textField2.frame = CGRect(x: 200, y: 300, width: 100, height: 30)
            self.sumLabel.frame = CGRect(x: 180, y: 350, width: 200, height: 30)
            self.sumButton.frame = CGRect(x: 10, y: 350, width: 100, height: 30)
            
            self.cube.frame = CGRect(x: 300, y: 600, width: 50, height: 50)
            
        }

    }

    //Handle Gestures
    
    func handleTap(sender: UITapGestureRecognizer){
        
        if(sender.view == self.imageView){
            
            if(self.imageView.image == #imageLiteral(resourceName: "fox")){
                self.imageView.image = #imageLiteral(resourceName: "fox2")
            } else {
                self.imageView.image = #imageLiteral(resourceName: "fox")
            }
            
        } else {
            
            if(self.falcoImageView.image == #imageLiteral(resourceName: "falco")){
                self.falcoImageView.image = #imageLiteral(resourceName: "falco2")
            } else {
                self.falcoImageView.image = #imageLiteral(resourceName: "falco")
            }

        }

        
    }
    
    func handleRotate(sender: UIRotationGestureRecognizer){
        

//        let rotate = CGAffineTransform(rotationAngle: 1.0)
//        let stretchAndRotate = rotate.scaledBy(x: 0.8, y: 0.8)
//        sender.view!.transform = stretchAndRotate
        
        sender.view!.transform = sender.view!.transform.rotated(by: sender.rotation)
        sender.rotation = 0
        
    }
    
    
    
    
    func handlePinch(sender: UIPinchGestureRecognizer){
        
        if let view = sender.view{
            
//            let scale = sender.scale
//            view.transform = CGAffineTransform(scaleX: scale, y: scale)
            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1.0
        }
    }
    
    func handleLongPress(sender: UILongPressGestureRecognizer){
        
        if(sender.view == self.imageView){
            self.sound = NSDataAsset(name: "foxyell")
        } else {
            self.sound = NSDataAsset(name: "falcoyell")
        }
        
        if(sender.state == .began){
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(data: (sound?.data)!, fileTypeHint: AVFileTypeWAVE)
            
            player!.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
        }
    }
    
    func handlePan(sender: UIPanGestureRecognizer){
        sender.view?.center = sender.location(in: sender.view?.superview)
    }

    func handleSwipeLeft(sender: UISwipeGestureRecognizer){
        
        if(self.currentImageNum == 0){
            
            self.currentImageNum = (self.imageArray.count - 1);
        }
        else{
            
            self.currentImageNum = self.currentImageNum - 1;
        }

        
        
        self.backgroundImage!.image = UIImage(named:self.imageArray[self.currentImageNum] as! String)

        
    }
    
    func handleSwipeRight(sender: UISwipeGestureRecognizer){
        
        if(self.currentImageNum == (self.imageArray.count - 1)){
            
            self.currentImageNum = 0;
        }
        else{
            
            self.currentImageNum = self.currentImageNum + 1;
        }

        self.backgroundImage!.image = UIImage(named:self.imageArray[self.currentImageNum] as! String)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

