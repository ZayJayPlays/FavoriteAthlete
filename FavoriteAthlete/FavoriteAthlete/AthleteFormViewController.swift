//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Zane Jones on 3/6/23.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    @IBOutlet var textFieldName: UITextField!
    @IBOutlet var textFieldAge: UITextField!
    @IBOutlet var textFieldLeague: UITextField!
    @IBOutlet var textFieldTeam: UITextField!
    var athlete: Athlete?
    
    init?(coder: NSCoder, athlete: Athlete?) {
        super.init(coder: coder)
        self.athlete = athlete
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

        // Do any additional setup after loading the view.
    }
    
    func updateView() {
        if let unwrappedAthlete = athlete {
            textFieldName.text = unwrappedAthlete.name
            textFieldAge.text = String(unwrappedAthlete.age)
            textFieldLeague.text = unwrappedAthlete.league
            textFieldTeam.text = unwrappedAthlete.team
        }
    }

    @IBAction func saveButtonPress(_ sender: Any) {
        guard let name = textFieldName.text, let age = Int(textFieldAge.text!), let league = textFieldLeague.text, let team = textFieldTeam.text else {return}
        
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
        performSegue(withIdentifier: "UnwindToTable", sender: self)
    }
}
