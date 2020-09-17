//
//  ProductDetails.swift
//  Weed delivery
//
//  Created by Ilya Senchukov on 16.09.2020.
//  Copyright © 2020 Ilya Senchukov. All rights reserved.
//

import SwiftUI
import AVFoundation
import JGProgressHUD

var player: AVAudioPlayer?

class ProgressHUDController: UIViewController {
    let hud = JGProgressHUD(style: .dark)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.dismiss()
    }
    
    func show(text: String) {
        hud.textLabel.text = text
        hud.indicatorView = JGProgressHUDSuccessIndicatorView()
        hud.show(in: self.view)
    }
    
    func dismiss() {
        hud.dismiss()
    }
}

struct ProgressHUD: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<ProgressHUD>) -> ProgressHUDController {
        ProgressHUDController()
    }
    
    func updateUIViewController(_ uiViewController: ProgressHUDController, context: UIViewControllerRepresentableContext<ProgressHUD>) {
        uiViewController.show(text: "Added to cart")
    }
    
    typealias UIViewControllerType = ProgressHUDController
}

public struct ProgressHUDView<Content>: View where Content: View {
    private var isShowing: Binding<Bool>
    private var content: () -> Content
    
    public init(isShowing: Binding<Bool>, content: @escaping () -> Content) {
        self.isShowing = isShowing
        self.content = content
    }
    
    public var body: some View {
        ZStack(alignment: .center) {
            if (!self.isShowing.wrappedValue) {
                self.content()
            } else {
                self.content()
                    .disabled(true)
                    .blur(radius: 3)
                
                ProgressHUD()
            }
        }
    }
}
struct ProductDetails: View {
    var product: Product
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isShowing = false
    
    var body: some View {
        ProgressHUDView(isShowing: self.$isShowing) {
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
        
    }
    
    func addToCart() {
        let group = DispatchGroup()
        group.enter()
        
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let cartItem = CartItem(id: 1, product: self.product)
            appDelegate.cart.append(cartItem)
            
            self.isShowing.toggle()
            
            self.playSound()
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
                self.isShowing.toggle()
                group.leave()
            }
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

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

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
