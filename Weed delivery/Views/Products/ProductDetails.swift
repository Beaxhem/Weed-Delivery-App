//
//  ProductDetails.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 16.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI
import AVFoundation

var player: AVAudioPlayer?

struct ProductDetails: View {
    var product: Product
    

    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            self.addToCart()
        }, label: {
            Text("Add to cart")
        })
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .font(.headline)
        .cornerRadius(10)
    }
    
    func addToCart() {
        let group = DispatchGroup()
        group.enter()
        
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
             appDelegate.cart.append(self.product)
            
            self.playSound()
            
            group.leave()
        }
        
        group.notify(queue: .main) {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func playSound() {
        
        
        guard let url = Bundle.main.url(forResource: "addToCartSound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(product: Product(id: 1, name: "McDonalds", price: 99.7))
    }
}
