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
    
    @State var isHUDShowing = false
    @State var isCheckOutViewShowing = false
    
    var body: some View {
        ProgressHUDView(isShowing: self.$isHUDShowing) {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image(systemName: "multiply")
                        .resizable()
                        .position(y: 22)
                        .frame(width: 20, height: 20)
                        .offset(x: -10)
                        .onTapGesture {
                            self.close()
                        }
                    
                }
                .frame(height: 50)
                ScrollView {
                    
                    
                    VStack(alignment: .leading) {
                        Image(product.imageName)
                            .resizable()
                            .frame(height: 250)
                        VStack(alignment: .leading) {
                            Text(product.name)
                                .font(.system(size: 30, weight: .bold))
                                .padding(.bottom, 1)
                            
                            HStack {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(.yellow)
                                Text(String(format: "%.1f", 4.7))
                                    .foregroundColor(.yellow)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                
                                
                            }
                            Text("Description")
                                .font(.headline)
                                .padding([.bottom, .top])
                            
                            Text(product.description)
                                .foregroundColor(.gray)
                            Spacer()
                        }.padding()
                        Spacer()
                    }
                    
                    
                    Spacer()
                }
                HStack {
                    VStack(spacing: 0) {
                        Text("Total: ")
                            .font(.subheadline)
                        Text(String(format: "%.2f", product.price) + "$")
                            .font(.system(size: 22, weight: .bold))
                    }
                    Spacer()
                    
                    Button(action: {
                        self.isCheckOutViewShowing.toggle()
                    }) {
                        Text("Buy now")
                            .scaledToFill()
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 3)
                            )
                            
                            .foregroundColor(.blue)
                            .font(.headline)
                            .fullScreenCover(isPresented: self.$isCheckOutViewShowing, content: {
                                CheckoutView(product: self.product)
                            })
                    }
                    
                    Button(action: {
                        self.addToCart()
                    }, label: {
                        Text("Add to cart")
                            .scaledToFill()
                    })
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
                }
                .padding()
                
            }
        }
    }
    
    func close() {
        self.presentationMode.wrappedValue.dismiss()
        
    }
    
    
    
    func addToCart() {
        let group = DispatchGroup()
        group.enter()
        
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.cart.addToCart(product: product)
            
            self.isHUDShowing.toggle()
            
            self.playSound()
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
                self.isHUDShowing.toggle()
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            close()
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
        ProductDetails(product: Product(id: 1, name: "McDonalds", price: 99.7, category: "Menu"))
    }
}
