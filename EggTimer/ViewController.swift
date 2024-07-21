import UIKit
import AVFoundation

var player: AVAudioPlayer!

class ViewController: UIViewController {
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7 ]
    var secondsPassed = 0
    var totalTime = 0
    var timer = Timer()
    /*
    var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: false)
    
    
    @objc func updateCounter(){
    if secondsRemaining > 0 {
        print("\(secondsRemaining) seconds.")
        secondsRemaining -= 1
    }
    }
     */
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        var hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPassed < self.totalTime {
                self.secondsPassed += 1
                var percentageProgress = Float(self.secondsPassed)/Float(self.totalTime)
                self.progressBar.progress =  percentageProgress
                    
                } else {
                    Timer.invalidate()
                    		
                    self.titleLabel.text = "DONE!"
                    //playSound()
                    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                    player = try! AVAudioPlayer(contentsOf: url!)
                    player.play()
                }
            }
        /* 
        func playSound() {
            guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)

                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

                /* iOS 10 and earlier require the following line:
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

                guard let player = player else { return }

                player.play()

            } catch let error {
                print(error.localizedDescription)
            }
        }
         */
                
       
        /*if(hardness == "Soft"){
            print(eggTimes["Soft"])
        }
        else if (hardness == "Medium"){
            print(eggTimes["Medium"])
        }
        else{
            print(eggTimes["Hard"])
        }*/
    }

}
