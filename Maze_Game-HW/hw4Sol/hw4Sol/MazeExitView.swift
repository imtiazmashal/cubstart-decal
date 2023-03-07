//
//  SwiftUIView.swift
//  hw4
//
//  Created by Andy Huang on 3/3/23.
//

import SwiftUI

/* View that is presented when the player reaches the maze exit. */
struct MazeExitView: View {
    @Binding var navPath: NavigationPath
    @Binding var currentPath: [String]
    @Binding var solutionPath: [String]
    @Binding var solutionPathString: String
    @Binding var currentPathString: String
    
    var body: some View {
        Text("Woohoo you made it out alive!")
        
        Button("Play again") {
            // Reset the current path.
            currentPath = []
            currentPathString = ""
            
            // Generate a new maze path.
            solutionPath = generate_turns(size: 3)
            solutionPathString = solutionPath.joined(separator: "->")
            
            // Return to root view.
            navPath = .init()
        }
        .padding()
    }
}

struct MazeExitView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
