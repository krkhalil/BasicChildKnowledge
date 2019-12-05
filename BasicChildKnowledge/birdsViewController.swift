import UIKit
import AVFoundation



class birdsViewController: UIViewController {
    
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
        
        
        arrayOfMainImage = ["Crow",
                            "Duck",
                            "Eagle",
                            "Owl",
                            "Parrot",
                            "Peacock",
                            "Pigeons",
                            "Swan"]
        
        
        arrayofDetails = ["A crow is a bird of the genus Corvus, or more broadly a synonym for all of Corvus. The term crow is used as part of the common name of many species. Species with the word crow",
                          "Duck is the common name for a large number of species in the waterfowl family Anatidae which also includes swans and geese. Ducks are divided among several subfamilies in the family Anatidae; they do not represent a monophyletic group (the group of all descendants of a single common ancestral species) but a form taxon, since swans and geese are not considered ducks. Ducks are mostly aquatic birds, mostly smaller than the swans and geese, and may be found in both fresh water and sea water.",
                          "Eagle is the common name for many large birds of prey of the family Accipitridae. Eagles belong to several groups of genera, not all of which are closely related. Most of the 60 species of eagle are from Eurasia and Africa.[1] Outside this area, just 14 species can be found—2 in North America, 9 in Central and South America, and 3 in Australia.",
                          "Owls are birds from the order Strigiformes, which includes about 200 species of mostly solitary and nocturnal birds of prey typified by an upright stance, a large, broad head, binocular vision, binaural hearing, sharp talons, and feathers adapted for silent flight. Exceptions include the diurnal northern hawk-owl and the gregarious burrowing owl.",
                          "Parrots, also known as psittacines are birds of the roughly 393 species in 92 genera that make up the order Psittaciformes, found in most tropical and subtropical regions. The order is subdivided into three superfamilies: the Psittacoidea (true parrots), the Cacatuoidea (cockatoos), and the Strigopoidea (New Zealand parrots). Parrots have a generally pantropical distribution with several species inhabiting temperate regions in the Southern Hemisphere, as well. The greatest diversity of parrots is in South America and Australasia.",
                          "Peafowl is a common name for three species of birds in the genera Pavo and Afropavo of the Phasianidae family, the pheasants and their allies. Male peafowl are referred to as peacocks, and female peafowl as peahens.",
                          "Pigeons and doves constitute the animal family Columbidae and the order Columbiformes, which includes about 42 genera and 310 species. They are stout-bodied birds with short necks, and short slender bills that in some species feature fleshy ceres. They primarily feed on seeds, fruits, and plants. Pigeons and doves are likely the most common birds in the world; the family occurs worldwide, but the greatest variety is in the Indomalaya and Australasia ecozones.",
                          "Swans are birds of the family Anatidae within the genus Cygnus.[3] The swans' closest relatives include the geese and ducks. Swans are grouped with the closely related geese in the subfamily Anserinae where they form the tribe Cygnini. Sometimes, they are considered a distinct subfamily, Cygninae. There are six or seven living (and one extinct) species of swan in the genus Cygnus; in addition, there is another species known as the coscoroba swan, although this species is no longer considered one of the true swans."]
        
        
        
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


