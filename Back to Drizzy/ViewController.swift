//
//  ViewController.swift
//  Back to Drizzy
//
//  Created by Aditya Maru on 2016-04-24.
//  Copyright © 2016 Aditya Maru. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()

    @IBAction func adjustVolume(sender: AnyObject)
    {
        player.volume = (volumeSlider?.value)!
        
    }
    

    @IBAction func adSc(sender: AnyObject)
    {
        player.currentTime = NSTimeInterval(scrubberSlider.value)
    }
    
    @IBOutlet weak var volumeSlider: UISlider?
    
    @IBOutlet weak var scrubberSlider: UISlider!
    
    @IBAction func Play(sender: AnyObject)
    {
        player.play()
        
    }
    
    
    @IBAction func Pause(sender: AnyObject)
    {
        player.pause()
        
    }
    
    @IBAction func Stop(sender: AnyObject)
    {
        player.pause()
        do
        {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Trophies", ofType: "mp3")!))
        
        }
        catch{
            //it didnt work!
        }
        
        
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        do
        {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Trophies", ofType: "mp3")!))
            
            scrubberSlider.maximumValue = Float(player.duration)
        }
        catch{
            //it didnt work!
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.adScU), userInfo: nil, repeats: true)
        
        
        
    }
    
    func adScU()
    {
        scrubberSlider.value = Float(player.currentTime)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }


}

