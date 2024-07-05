//
//  TypewriterEffectView.swift
//  TypewriterEffect
//
//  Created by Lucky on 05/07/24.
//

import SwiftUI

struct TypewriterEffectView: View {
    
    // Stores the text content to display
    let text: String
    
    // Tracks current index of displayed text
    @State private var currentTextIndex: Int = 0 
    // Stores currently displayed text
    @State private var displayedText: String = "" 
    // Manages the timer for typewriter effect
    @State private var timer: Timer? = nil 
    // Indicates if all text is displayed
    @State private var isTextFullyDisplayed: Bool = false 
    
    var body: some View {
        VStack(spacing: 0) {
            // Displays the text with typewriter effect
            Text(displayedText) 
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                // Custom font and size (replace "Dogica" with your font name)
                .font(.custom("Dogica", size: 13)) 
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .lineSpacing(20)
                .onAppear {
                    // Start typewriter effect when view appears
                    startTypewriterEffect() 
                }
                .onTapGesture {
                    // Handles tap gesture to reveal full text
                    handleTap() 
                }
        }
    }
    
    // MARK: - TypeWriterEffect Functions
    
    /// Starts the typewriter effect by gradually displaying text character by character.
    private func startTypewriterEffect() {
        
        // Reset flag indicating text is fully displayed
        isTextFullyDisplayed = false 
        
        // Set up a timer to incrementally add characters to displayedText
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if self.currentTextIndex < self.text.count {
                let index = self.text.index(self.text.startIndex, offsetBy: self.currentTextIndex)
                // Append next character to displayedText
                self.displayedText.append(self.text[index]) 
                // Increment index to move to next character
                self.currentTextIndex += 1 
            } else {
                // Stop timer once all characters are displayed
                timer.invalidate() 
                // Update flag indicating text is fully displayed
                self.isTextFullyDisplayed = true 
            }
        }
    }
    
    /// Immediately displays the full text and stops the typewriter effect timer.
    private func showFullText() {
        // Stop the timer
        timer?.invalidate() 
        // Display the full text
        displayedText = text 
        // Set currentTextIndex to the length of the text
        currentTextIndex = text.count 
        // Update flag indicating text is fully displayed
        isTextFullyDisplayed = true 
    }
    
    /// Handles tap gesture on the text. If text is fully displayed, perform additional actions.
    private func handleTap() {
        if isTextFullyDisplayed {
            // Perform additional actions when text is fully displayed (e.g., navigate to next screen)
        } else {
            // Immediately reveal full text
            showFullText() 
        }
    }
}

#Preview {
    TypewriterEffectView(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
}
