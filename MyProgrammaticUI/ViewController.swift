//
//  ViewController.swift
//  MyProgrammaticUI
//
//  Created by Aditya Narayan on 2/23/17.
//
//

import UIKit

class ViewController: UIViewController {

    //ImageViews
    let imageView = UIImageView(frame: CGRect.init(x: 50, y: 150, width: 100, height: 100))
    var backgroundImage: UIImageView? = nil
    //let falcoImageView = UIImageView(frame: CGRect.init(x: 250, y: 250, width: 100, height: 100))
    
    //Calc stuff
    let textField1 = UITextField(frame: CGRect.init(x: 10, y: 300, width: 100, height: 30))
    let textField2 = UITextField(frame: CGRect.init(x: 200, y: 300, width: 100, height: 30))
    let sumLabel = UILabel(frame: CGRect(x: 180, y: 350, width: 200, height: 30))
    
    //ImageArray
    let imageArray = NSArray(objects: "fox", "falco")
    var currentImageNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let label = UILabel(frame: CGRect(x: 150, y: 35, width: 150, height: 15))
        label.text = "Whats Good?!"
        self.view.addSubview(label)
        
        let swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipeLeft(sender:)))
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipeRight(sender:)))
        
        swipeGestureLeft.direction = UISwipeGestureRecognizerDirection.left
        swipeGestureRight.direction = UISwipeGestureRecognizerDirection.right
        
        self.view.addGestureRecognizer(swipeGestureLeft)
        self.view.addGestureRecognizer(swipeGestureRight)
        
        self.createImageView()
        self.createCalc()
    }

    func createImageView(){
        
//        self.backgroundImage = UIImageView(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
//        
//        self.backgroundImage?.image = UIImage(named: "fd")
//        self.backgroundImage?.contentMode = .scaleAspectFill
//        self.view.insertSubview(self.backgroundImage!, at: 0)
        
        //fox
        self.imageView.image = UIImage(named: "fox")
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handleTap(sender:)))
        self.imageView.addGestureRecognizer(panGesture)
        self.imageView.isUserInteractionEnabled = true
        
        self.view.insertSubview(self.imageView, at: 1)
        
//        //falco
//        self.falcoImageView.image = UIImage(named: "falco")
//        
//        let panGesture2 = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handleTap(sender:)))
//        self.falcoImageView.addGestureRecognizer(panGesture2)
//        self.falcoImageView.isUserInteractionEnabled = true
//        
//        self.view.insertSubview(self.falcoImageView, at: 2)
    }
    
    func createCalc(){
        
//        self.textField1.backgroundColor = UIColor.lightGray
//        self.textField2.backgroundColor = UIColor.lightGray
        
        self.textField1.borderStyle = .bezel
        self.textField2.borderStyle = .bezel
        
        self.view.addSubview(self.textField1)
        self.view.addSubview(self.textField2)
        self.view.addSubview(self.sumLabel)
        self.sumLabel.textColor = UIColor.black

        
        let sumButton = UIButton(frame: CGRect(x: 10, y: 350, width: 100, height: 30))
        sumButton.addTarget(self, action: #selector(sumButtonPressed), for: .touchUpInside)
        sumButton.setTitle("Sum", for: .normal)
        sumButton.backgroundColor = UIColor.lightGray
        self.view.addSubview(sumButton)
    }
    
    func sumButtonPressed(){
        
        let num1 : Int? = Int(self.textField1.text!)
        let num2 : Int? = Int(self.textField2.text!)
        
        if num1 != nil, num2 != nil {
            let sum = (num1!) + (num2!)
            self.sumLabel.text = String(sum)
        } else {
            self.sumLabel.text = "Integers only baby girl"
        }
        
    }
    
    //Handle Gestures
    func handleTap(sender: UIPanGestureRecognizer){
        sender.view?.center = sender.location(in: sender.view?.superview)
    }

    func handleSwipeLeft(sender: UISwipeGestureRecognizer){
        
        if(self.currentImageNum == 0){
            
            self.currentImageNum = (self.imageArray.count - 1);
        }
        else{
            
            self.currentImageNum = self.currentImageNum - 1;
        }

        
        
        self.imageView.image = UIImage(named:self.imageArray[self.currentImageNum] as! String)

        
    }
    
    func handleSwipeRight(sender: UISwipeGestureRecognizer){
        
        if(self.currentImageNum == (self.imageArray.count - 1)){
            
            self.currentImageNum = 0;
        }
        else{
            
            self.currentImageNum = self.currentImageNum + 1;
        }

        self.imageView.image = UIImage(named:self.imageArray[self.currentImageNum] as! String)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

