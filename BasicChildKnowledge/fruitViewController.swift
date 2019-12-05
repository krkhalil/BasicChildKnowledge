import UIKit
import AVFoundation



class fruitViewController: UIViewController {
    
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
        
        
        arrayOfMainImage = ["Banana",
                            "Beet",
                            "Grapes",
                            "Lemon",
                            "Mango",
                            "Melon",
                            "Orange",
                            "Peach",
                            "Pear",
                            "Pineapple",
                            "Strawberry"]
        
        
        arrayofDetails = ["A banana is an edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa.[3] In some countries, bananas used for cooking may be called plantains, distinguishing them from dessert bananas. The fruit is variable in size, color, and firmness, but is usually elongated and curved, with soft flesh rich in starch covered with a rind, which may be green, yellow, red, purple, or brown when ripe. The fruits grow in clusters hanging from the top of the plant.",
                          "The beetroot is the taproot portion of a beet plant, usually known in North America as the beet, and also known as the table beet, garden beet, sugar beet, red beet, or golden beet. It is one of several cultivated varieties of Beta vulgaris grown for their edible taproots and leaves (called beet greens)",
                          "A grape is a fruit, botanically a berry, of the deciduous woody vines of the flowering plant genus Vitis.Grapes can be eaten fresh as table grapes or they can be used for making wine, jam, juice, jelly, grape seed extract, raisins, vinegar, and grape seed oil. Grapes are a non-climacteric type of fruit, generally occurring in clusters.",
                          "The lemon, Citrus limon (L.) Osbeck, is a species of small evergreen tree in the flowering plant family Rutaceae, native to South Asia, primarily North eastern India.The tree's ellipsoidal yellow fruit is used for culinary and non-culinary purposes throughout the world, primarily for its juice, which has both culinary and cleaning uses.[2] The pulp and rind (zest) are also used in cooking and baking. The juice of the lemon is about 5% to 6% citric acid, with a pH of around 2.2, giving it a sour taste. ",
                          "Mangoes are juicy stone fruit (drupe) from numerous species of tropical trees belonging to the flowering plant genus Mangifera, cultivated mostly for their edible fruit.The majority of these species are found in nature as wild mangoes. The genus belongs to the cashew family Anacardiaceae. Mangoes are native to South Asia,[1][2] from where the common mango or Indian mango, Mangifera indica, has been distributed worldwide to become one of the most widely cultivated fruits in the tropics. Other Mangifera species (e.g. horse mango, Mangifera foetida) are grown on a more localized basis.",
                          "A melon is any of various plants of the family Cucurbitaceae with sweet edible, fleshy fruit. The word melon can refer to either the plant or specifically to the fruit. Botanically, a melon is a kind of berry, specifically a pepo. The word melon derives from Latin melopepo",
                          "The orange is the fruit of the citrus species Citrus  sinensis in the family Rutaceae, native to China. It is also called sweet orange, to distinguish it from the related Citrus  aurantium, referred to as bitter orange. The sweet orange reproduces asexually (apomixis through nucellar embryony) varieties of sweet orange arise through mutations.",
                          "The peach (Prunus persica) is a deciduous tree native to the region of Northwest China between the Tarim Basin and the north slopes of the Kunlun Mountains, where it was first domesticated and cultivated. It bears an edible juicy fruit called a peach or a nectarine.",
                          "The pear is native to coastal and mildly temperate regions of the Old World, from western Europe and north Africa east right across Asia. It is a medium-sized tree, reaching 10–17 metres (33–56 ft) tall, often with a tall, narrow crown; a few species are shrubby.",
                          "The plant is indigenous to South America and is said to originate from the area between southern Brazil and Paraguay;however, little is known about the origin of the domesticated pineapple (Pickersgill, 1976). MS Bertoni (1919) considered the Paraná–Paraguay River drainages to be the place of origin of A. comosus.The natives of southern Brazil and Paraguay spread the pineapple throughout South America, and it eventually reached the Caribbean, Central America, and Mexico, where it was cultivated by the Mayas and the Aztecs.",
                          "The garden strawberry (or simply strawberry; Fragaria  ananassa) is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness. It is consumed in large quantities, either fresh or in such prepared foods as jam, juice, pies, ice cream, milkshakes, and chocolates. Artificial strawberry flavorings and aromas are also widely used in products such as candy, soap, lip gloss, perfume, and many others."]
        
        
        
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
                let alert = UIAlertController(title: "Alert", message: "This Is  End! ", preferredStyle: UIAlertControllerStyle.alert)
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

