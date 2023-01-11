//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Majka on 11/01/2023.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - PROPERTIES
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    // random coordinate
    func randomCoordinate(max: CGFloat) -> CGFloat {
        CGFloat.random(in: 0...max)
    }
    // random size
    func randomSize() -> CGFloat {
        CGFloat(Int.random(in: 10...300))
    }
    // random scale
    func randomScale() -> CGFloat {
        CGFloat(Double.random(in: 0.1...2.0))
    }
    // random speed
    func randomSpeed() -> Double {
        Double.random(in: 0.025...1.0)
    }
    //random delay
    func randomDelay() -> Double {
        Double.random(in: 0...2)
    }
    //MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                    )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .speed(randomSpeed())
                            .delay(randomDelay())
                                   , value: isAnimating)
                        .onAppear {
                            isAnimating = true
                        }
                }
            } // zstack
            .drawingGroup()
        } // geometry
    }
}

//MARK: - PREVIEW
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
