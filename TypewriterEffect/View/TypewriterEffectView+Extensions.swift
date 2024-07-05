//
//  TypewriterEffectView+Extensions.swift
//  TypewriterEffect
//
//  Created by Lucky on 05/07/24.
//

import SwiftUI

extension TypewriterEffectView {
    
    // MARK: - Typewriter Effect
    
    func startTypewriterEffect() {
        setIsTextFullyDisplayed(false)
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if self.currentTextIndex < self.text.count {
                let index = self.text.index(self.text.startIndex, offsetBy: self.currentTextIndex)
                self.displayedText.append(self.text[index])
                self.currentTextIndex += 1
            } else {
                timer.invalidate()
                self.setIsTextFullyDisplayed(true)
            }
        }
    }
    
    func showFullText() {
        timer?.invalidate()
        displayedText = text
        currentTextIndex = text.count
        setIsTextFullyDisplayed(true)
    }
    
    func handleTap() {
        if getIsTextFullyDisplayed() {
            // You can do something after the text is fully shown here
        } else {
            showFullText()
        }
    }
}

