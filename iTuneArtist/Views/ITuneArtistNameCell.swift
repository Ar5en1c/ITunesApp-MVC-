//
//  MainArtistNameCell.swift
//  iTuneArtist
//
//  Created by Kuldeep Singh on 6/12/24.
//

import UIKit

class ITuneArtistNameCell: UITableViewCell {
    
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artistSongInfoLabel: UILabel!
    @IBOutlet weak var albumCoverImageView: UIImageView!
    @IBOutlet weak var priceButton: UIButton!
    
    var dataRecieved: ArtistInfo? {
        didSet {
            assignData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        assignData()
    }

}

extension ITuneArtistNameCell {
    func assignData() {
        artistNameLabel.text = "\(dataRecieved?.artistName ?? "")"
        artistSongInfoLabel.text = "Genre: \(dataRecieved?.primaryGenreName ?? ""), Country: \(dataRecieved?.country ?? "")"
        
        if let price = dataRecieved?.collectionPrice {
            priceButton.setBasicBorderStyling()
            priceButton.setBasicAttributedTitleStyling(text: "\(price)", fontSize: 12)
        } else {
            priceButton.setTitle("N/A", for: .normal)
        }
        
        if let artworkURL = dataRecieved?.artworkUrl60 {
            ApiClass.shared.fetchImage(from: artworkURL) { [weak self] imageData in
                DispatchQueue.main.async {
                    if let data = imageData, let image = UIImage(data: data) {
                        self?.albumCoverImageView.image = image
                    } else {
                        self?.albumCoverImageView.image = UIImage(systemName: "house")
                    }
                }
            }
        }
    }
}
