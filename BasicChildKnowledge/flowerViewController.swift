import UIKit
import AVFoundation



class flowerViewController: UIViewController {
    @IBOutlet weak var mainImageShow: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var detailViewText: UITextView!
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    
    
    
    var arrayofmainImage = NSMutableArray()
    var arrayofDetails = NSMutableArray()
    var arrayOfMainImage = NSMutableArray()
    var audioPlayer:AVAudioPlayer!
    var index:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        arrayOfMainImage = ["Amaryllis",
                            "Anemone",
                            "AsterBlue",
                            "Campanula",
                            "Lotus",
                            "Rose",
                            "Sunflower"]
        
        
        arrayofDetails = ["Amaryllis  is the only genus in the subtribe Amaryllidinae (tribe Amaryllideae). It is a small genus of flowering bulbs, with two species. The better known of the two, Amaryllis belladonna, is a native of the Western Cape region of South Africa, particularly the rocky southwest area between the Olifants River Valley and Knysna",
                          "Anemone are perennials that have basal leaves with long leaf-stems that can be upright or prostrate. Leaves are simple or compound with lobed, parted, or undivided leaf blades. The leaf margins are toothed or entire",
                          "Lilium (members of which are true lilies) is a genus of herbaceous flowering plants growing from bulbs, all with large prominent flowers. Lilies are a group of flowering plants which are important in culture and literature in much of the world. Most species are native to the temperate northern hemisphere, though their range extends into the northern subtropics. Many other plants have lily in their common name but are not related to true lilies",
                          "Campanula (/kæmˈpænjʊlə/)[4] is one of several genera in the family Campanulaceae with the common name bellflower. It takes both its common and its scientific name from its bell-shaped flowers—campanula is Latin for little bell",
                          "Nelumbo is a genus of aquatic plants with large, showy flowers. Members are commonly called lotus, though lotus is a name also applied to various other plants and plant groups, including the unrelated genus Lotus. Members outwardly resemble those in the family Nymphaeaceae (water lilies), but Nelumbo is actually very distant to Nymphaeaceae",
                          "A rose is a woody perennial flowering plant of the genus Rosa, in the family Rosaceae, or the flower it bears. There are over three hundred species and thousands of cultivars. They form a group of plants that can be erect shrubs, climbing, or trailing, with stems that are often armed with sharp prickles. Flowers vary in size and shape and are usually large and showy, in colours ranging from white through yellows and reds.",
                          "Helianthus or sunflower  is a genus of plants comprising about 70 species.[4][5] Except for three species in South America, all Helianthus species are native to North America and Central America. The common name, sunflower, typically refers to the popular annual species Helianthus annuus, or the common sunflower, whose round flower heads in combination with the ligules look like the sun.This and other species, notably Jerusalem artichoke (H. tuberosus), are cultivated in temperate regions and some tropical regions as food crops for humans, cattle, and poultry, and as ornamental plants."]
        
        
        setoptionvalue()
        
    }
    func sound(){
        myUtterance = AVSpeechUtterance(string: arrayOfMainImage[index] as! String)
        myUtterance.rate = 0.3
        synth.speak(myUtterance)
    }
    
    func setoptionvalue() {
        mainImageShow.image = UIImage(named: arrayOfMainImage[index] as! String)
        titleOutlet.text = arrayOfMainImage[index] as? String
        detailViewText.text = arrayofDetails[index] as? String
        
        
    }
    
    
    
    
    
    
    @IBAction func detailsButtonAction(_ sender: Any) {
        if mainView.isHidden{
            mainView.isHidden=false
            titleOutlet.isHidden=false
            detailViewText.isHidden=false
        }
        else{
            mainView.isHidden=true
            titleOutlet.isHidden=true
            detailViewText.isHidden=true
        }
        
        
        
    }
    
    
    @IBAction func previousButtonAction(_ sender: Any) {
        if index >= 0
        {
            
            if index == 0{
                let alert = UIAlertController(title: "Alert", message: " Proceed To Next! ", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert,animated: true,completion: nil)
                sound()
                
            }
            else{
                index=index-1
                setoptionvalue()
                
            }
        }
    }
    @IBAction func nextButtonAction(_ sender: Any) {
        
        if index < arrayOfMainImage.count {
            
            if index == arrayOfMainImage.count-1
            {
                index = 0
                let alert = UIAlertController(title: "Alert", message: "THis Is End ! ", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert,animated: true,completion: nil)
                
            }
            else{
                
                index=index+1
                
                setoptionvalue()
                
                
                
            }
        }
        
        
        
    }
    @IBAction func soundButtonAction(_ sender: Any) {
        
        sound()
    }
}

