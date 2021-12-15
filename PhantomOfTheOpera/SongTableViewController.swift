//
//  SongTableViewController.swift
//  PhantomOfTheOpera
//
//  Created by Chia on 2021/12/14.
//

import UIKit
import AVKit

class SongTableViewController: UITableViewController {
    
    var selectedButtonIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongTableViewCell
        let song = songs[indexPath.row]
        cell.update(with: song)
        cell.lyricsButton.tag = indexPath.row
        cell.delagate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showVideo", sender: nil)
    }

    @IBSegueAction func showVideo(_ coder: NSCoder) -> AVPlayerViewController? {
        guard let row = tableView.indexPathForSelectedRow?.row else { return nil }
        let song = songs[row]
        let controller = AVPlayerViewController(coder: coder)
        guard let url = Bundle.main.url(forResource: "\(song.videoName)-240", withExtension: "mp4") else { return nil }
        controller?.navigationItem.title = song.title
        controller?.player = AVPlayer(url: url)
        controller?.player?.play()
        return controller
    }
    
    @IBSegueAction func showLyrics(_ coder: NSCoder) -> LyricsViewController? {
        return LyricsViewController(coder: coder, songIndex: selectedButtonIndex)
    }
    
}

extension SongTableViewController: SongTableViewCellDelegate {
    func didTapButton(with songIndex: Int) {
        selectedButtonIndex = songIndex
    }
}
