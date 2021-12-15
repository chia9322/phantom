//
//  LyricsViewController.swift
//  PhantomOfTheOpera
//
//  Created by Chia on 2021/12/15.
//

import UIKit

class LyricsViewController: UIViewController {
    var songIndex: Int
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var lyricsTextView: UITextView!
    
    init?(coder: NSCoder, songIndex: Int) {
        self.songIndex = songIndex
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let song = songs[songIndex]
        imageView.image = UIImage(named: song.imageName)
        lyricsTextView.text = song.lyrics
        navigationItem.title = song.title
    }
}
