//
//  ArtistDetailViewController.swift
//  iTuneArtist
//
//  Created by Kuldeep Singh on 6/12/24.
//

import UIKit

class ArtistDetailViewController: UIViewController {
    
    var dataRecieved: ArtistInfo?
    
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var primaryGenreNameLabel: UILabel!
    @IBOutlet weak var collectionPriceLabel: UILabel!
    @IBOutlet weak var artworkImagView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignData()
        // Do any additional setup after loading the view.
    }
    
    func assignData() {
        artistNameLabel.text = "Artist: \(dataRecieved?.artistName ?? "")"
        countryNameLabel.text = "Country: \(dataRecieved?.country ?? "")"
        primaryGenreNameLabel.text = "Genre: \(dataRecieved?.primaryGenreName ?? "")"
        collectionPriceLabel.text = "Collection Price ($): \(dataRecieved?.collectionPrice ?? 0)"
        if let artworkURL = dataRecieved?.artworkUrl60 {
            ApiClass.shared.fetchImage(from: artworkURL) { [weak self] imageData in
                DispatchQueue.main.async {
                    if let data = imageData, let image = UIImage(data: data) {
                        self?.artworkImagView.image = image
                    } else {
                        self?.artworkImagView.image = UIImage(systemName: "house")
                    }
                }
            }
        }
    }
    
}
