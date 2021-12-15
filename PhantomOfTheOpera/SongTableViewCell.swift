//
//  SongTableViewCell.swift
//  PhantomOfTheOpera
//
//  Created by Chia on 2021/12/14.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    var delagate: SongTableViewCellDelegate?
    private var songIndex: Int?

    
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var songTitleLabel: UILabel!
    @IBOutlet var lyricsButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func lyricsButtonPressed(_ sender: UIButton) {
        delagate?.didTapButton(with: sender.tag)
    }
    
    func update(with song: Song) {
        thumbnailImageView.image = UIImage(named: song.imageName)
        songTitleLabel.text = song.title
    }
    
}


protocol SongTableViewCellDelegate {
    func didTapButton(with songIndex: Int)
}
