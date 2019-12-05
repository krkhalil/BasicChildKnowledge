import UIKit
import AVFoundation



class VegitablesViewController: UIViewController {
    
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
        
        
        arrayOfMainImage = ["Broccoli",
                            "Cabbage",
                            "Carrot",
                            "Cucumber",
                            "Eggplant",
                            "Garlic",
                            "Ginger",
                            "Green_Bean"]
        
        
        arrayofDetails = ["Broccoli is an edible green plant in the cabbage family (Brassicas) whose large flowering head and stalk is eaten as a vegetable. The word broccoli comes from the Italian plural of broccolo, which means the flowering crest of a cabbage, and is the diminutive form of brocco, meaning small nail or sprout",
                         "Cabbage or headed cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage, B. oleracea var. oleracea, and belongs to the cole crops, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and savoy cabbage (var. sabauda). Brassica rapa is commonly named Chinese, celery or napa cabbage and has many of the same uses. ",
                         "The carrot (Daucus carota subsp. sativus) is a root vegetable, usually orange in colour, though purple, black, red, white, and yellow cultivars exist. Carrots are a domesticated form of the wild carrot, Daucus carota, native to Europe and southwestern Asia. The plant probably originated in Persia and was originally cultivated for its leaves and seeds. The most commonly eaten part of the plant is the taproot, although the stems and leaves are eaten as well. The domestic carrot has been selectively bred for its greatly enlarged, more palatable, less woody-textured taproot.",
                         "Cucumber (Cucumis sativus) is a widely cultivated plant in the gourd family, Cucurbitaceae. It is a creeping vine that bears cucumiform fruits that are used as vegetables. There are three main varieties of cucumber: slicing, pickling, and seedless. Within these varieties, several cultivars have been created. In North America, the term wild cucumber refers to plants in the genera Echinocystis and Marah, but these are not closely related. The cucumber is originally from South Asia, but now grows on most continents. Many different types of cucumber are traded on the global market.",
                         "Most commonly purple, the spongy, absorbent fruit is used in various cuisines. Although often considered a vegetable, it is a berry by botanical definition. As a member of the genus Solanum, it is related to tomato and potato. Like the tomato, its skin and seeds can be eaten, but, like the potato, it is usually eaten cooked. Eggplant is nutritionally low in macronutrient and micronutrient content, but the capability of the fruit to absorb oils and flavors into its flesh through cooking expands its use in the culinary arts.",
                         "Garlic (Allium sativum) is a species in the onion genus, Allium. Its close relatives include the onion, shallot, leek, chive,and Chinese onion.Garlic is native to Central Asia and northeastern Iran, and has long been a common seasoning worldwide, with a history of several thousand years of human consumption and use.It was known to ancient Egyptians, and has been used both as a food flavoring and as a traditional medicine. In Ancient Rome, it was much used for food among the poor",
                         "Ginger (Zingiber officinale) is a flowering plant whose rhizome, ginger root or ginger, is widely used as a spice and a folk medicine.[2] It is a herbaceous perennial which grows annual pseudostems (false stems made of the rolled bases of leaves) about a meter tall bearing narrow leaf blades. The inflorescences bear pale yellow with purple flowers and arise directly from the rhizome on separate shoots.",
                         "Green beans are the unripe, young fruit and protective pods of various cultivars of the common bean (Phaseolus vulgaris).Immature or young pods of the runner bean (Phaseolus coccineus), yardlong bean (Vigna unguiculata subsp. sesquipedalis), and hyacinth bean (Lablab purpureus) are used in a similar way.Green beans are known by many common names, including French beans,string beans (for old varieties; modern varieties are stringless),snap beans,snaps,and the French name haricot vert."]
        
        
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


