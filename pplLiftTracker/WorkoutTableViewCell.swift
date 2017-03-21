//
//  WorkoutTableViewCell.swift
//  pplLiftTracker
//
//  Created by Brooks Townsend on 3/20/17.
//  Copyright © 2017 Brooks Townsend. All rights reserved.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {
    @IBOutlet weak var workoutName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
