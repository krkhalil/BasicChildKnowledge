import UIKit
import AVFoundation



class detailViewController: UIViewController {
    
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
        
        
        arrayOfMainImage = ["Cow",
                            "Crocodile",
                            "Deer",
                            "Dog",
                            "Donkey",
                            "Elephant",
                            "Giraffe",
                            "Hippo",
                            "Horse",
                            "Kangaroo"]
        
        
        arrayofDetails = ["Cattle—colloquially cows—are the most common type of large domesticated ungulates. They are a prominent modern member of the subfamily Bovinae, are the most widespread species of the genus Bos, and are most commonly classified collectively as Bos taurus",
                          "The term crocodile here applies to only the species within the subfamily of Crocodylinae. The term is sometimes used even more loosely to include all extant members of the order Crocodilia, which includes the alligators and caimans (family Alligatoridae), the gharial and false gharial (family Gavialidae), and all other living and fossil Crocodylomorpha.",
                          "Deer (singular and plural) are the hoofed ruminant mammals forming the family Cervidae. The two main groups of deer are the Cervinae, including the muntjac, the elk (wapiti), the fallow deer, and the chital; and the Capreolinae, including the reindeer (caribou), the roe deer, and the moose. Female reindeer, and male deer of all species except the Chinese water deer, grow and shed new antlers each year",
                          "The domestic dog (Canis lupus familiaris when considered a subspecies of the wolf or Canis familiaris when considered a distinct species) is a member of the genus Canis (canines), which forms part of the wolf-like canids,[6] and is the most widely abundant terrestrial carnivore. The dog and the extant gray wolf are sister taxa as modern wolves are not closely related to the wolves that were first domesticated, which implies that the direct ancestor of the dog is extinct. The dog was the first species to be domesticated and has been selectively bred over millennia for various behaviors, sensory capabilities, and physical attributes.Their long association with humans has led dogs to be uniquely attuned to human behavior[18] and they are able to thrive on a starch-rich diet that would be inadequate for other canid species. Dogs vary widely in shape, size and colors. They perform many roles for humans, such as hunting, herding, pulling loads, protection, assisting police and military, companionship and, more recently, aiding disabled people and therapeutic roles. This influence on human society has given them the sobriquet of man's best friend",
                          "The donkey or ass (Equus africanus asinus) is a domesticated member of the horse family, Equidae. The wild ancestor of the donkey is the African wild ass, E. africanus. The donkey has been used as a working animal for at least 5000 years. There are more than 40 million donkeys in the world, mostly in underdeveloped countries, where they are used principally as draught or pack animals. Working donkeys are often associated with those living at or below subsistence levels. Small numbers of donkeys are kept for breeding or as pets in developed countries",
                          "Elephants, the largest existing land animals, are mammals of the family Elephantidae. Three species are currently recognised: the African bush elephant, the African forest elephant, and the Asian elephant. Elephantidae is the only surviving family of the order Proboscidea; extinct members include the mastodons. The family Elephantidae also contains several now-extinct groups, including the mammoths and straight-tusked elephants.",
                          "The giraffe (Giraffa) is an African even-toed ungulate mammal, the tallest living terrestrial animal and the largest ruminant. It is traditionally considered",
                          "The common hippopotamus (Hippopotamus amphibius), or hippo, is a large, mostly herbivorous, semiaquatic mammal and ungulate native to sub-Saharan Africa. It is one of only two extant species in the family Hippopotamidae, the other being the pygmy hippopotamus (Choeropsis liberiensis or Hexaprotodon liberiensis)",
                          "The horse (Equus ferus caballus) is one of two extant subspecies of Equus ferus. It is an odd-toed ungulate mammal belonging to the taxonomic family Equidae. The horse has evolved over the past 45 to 55 million years from a small multi-toed creature, Eohippus, into the large, single-toed animal of today. Humans began domesticating horses around 4000 BC, and their domestication is believed to have been widespread by 3000 BC",
                          "The kangaroo is a marsupial from the family Macropodidae (macropods, meaning large foot). In common use the term is used to describe the largest species from this family, especially those of the genus Macropus: the red kangaroo, antilopine kangaroo, eastern grey kangaroo, and western grey kangaroo. Kangaroos are indigenous to Australia. The Australian government estimates that 34.3 million kangaroos lived within the commercial harvest areas of Australia in 2011, up from 25.1 million one year earlier"]
        
        
        
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
            
            if index == 0
            {
                let alert = UIAlertController(title: "Alert", message: "Proceed To Next! ", preferredStyle: UIAlertControllerStyle.alert)
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
                let alert = UIAlertController(title: "Alert", message: "This is  End! ", preferredStyle: UIAlertControllerStyle.alert)
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
