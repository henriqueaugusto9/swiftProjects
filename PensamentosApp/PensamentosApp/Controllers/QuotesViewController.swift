//
//  QuotesViewController.swift
//  PensamentosApp
//
//  Created by Henrique Augusto on 15/02/2019.
//  Copyright © 2019 Henrique Augusto. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {

    
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var ivPhotoBg: UIImageView!
    @IBOutlet weak var labelQuote: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var ctTop: NSLayoutConstraint!
    
    let quotesManager = QuotesManager()
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareQuote()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func prepareQuote(){
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 8.0, repeats: true, block: { (timer) in
            self.showRandomQuote()
        })
        showRandomQuote()
    }
    
    func showRandomQuote(){
        let quote = QuotesManager().getRandomQuote()
        labelQuote.text = quote.quote
        labelAuthor.text = quote.author
        ivPhoto.image = UIImage(named: quote.image)
        ivPhotoBg.image = ivPhoto.image
        
        labelQuote.alpha = 0.0
        labelAuthor.alpha = 0.0
        ivPhotoBg.alpha = 0.0
        ivPhoto.alpha = 0.0
        
        UIView.animate(withDuration: 2.5) {
            self.labelQuote.alpha = 1.0
            self.labelAuthor.alpha = 1.0
            self.ivPhotoBg.alpha = 0.25
            self.ivPhoto.alpha = 1.0
        }
    }
}
