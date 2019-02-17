//
//  ViewController.swift
//  loteriasAppSwift
//
//  Created by Henrique Augusto on 13/02/2019.
//  Copyright © 2019 Henrique Augusto. All rights reserved.
//

import UIKit

enum GameType: String{
    case megasena = "Mega-sena"
    case quina = "Quina"
}

infix operator >-<

func >-< (total: Int, universe: Int) -> [Int]{
    var result: [Int] = []
    while result.count < total {
        let randomNumber = Int(arc4random_uniform(UInt32(universe))+1)
        if !result.contains(randomNumber){
            result.append(randomNumber)
        }
    }
    return result.sorted()
}

class ViewController: UIViewController {
    
    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    @IBOutlet var balls: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        showNumbers(for: .megasena)
    }
    
    func showNumbers(for Type: GameType){
        lbGameType.text = Type.rawValue
        var game : [Int] = []
        switch Type {
        case .megasena:
            game = 6>-<60
            balls.last!.isHidden = false
        case .quina:
            game = 5>-<80
            balls.last!.isHidden = true
        }
        for (index, game) in game.enumerated() {
            balls[index].setTitle("\(game)", for: .normal)
        }
    }

    @IBAction func generateGame() {
        switch scGameType.selectedSegmentIndex {
        case 0:
            showNumbers(for: .megasena)
        default:
            showNumbers(for: .quina)
        }
        
    }
    
}

