

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer?
    
    
    // press any egg button
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        
        progressBar.progress = 0
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
        
        
        
    }
    // progress bar if time is left show progress
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
            
        }
         // if time is up play sound
        else {
            timer.invalidate()
            titleLabel.text = "Time is up!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")!

                       do {
                           player = try AVAudioPlayer(contentsOf: url)
                           player?.play()
                       } catch {
                           print("Error: audio file play failed.")
                       }
        }
    }
}
    
