//
//  ContentView.swift
//  hw4
//
//  Created by Andy Huang on 3/2/23.
//

import SwiftUI

struct ContentView: View {
    // The navigationStack control point. If appended to, it will navigate the user to a new view.
    @State var navPath = NavigationPath()
    // Array of strings representing the path to the maze exit.
    @State var solutionPath: [String] = generate_turns(size: 3)
    // Array of strings representing the current path the user has taken.
    @State var currentPath: [String] = []
    // String representation of currentPath
    @State var currentPathString: String = ""
    // String representation of solutionPath. Helpful for debugging and testing.
    @State var solutionPathString: String = ""
    
    var body: some View {
        // NavigationStack wraps entire view.
        NavigationStack(path: $navPath) {
            VStack {
                Text("Enter the maze if you dare! ☠️")
                
                // Append to navigationStack when button is pressed.
                Button("Begin") {
                    navPath.append("Begin")
                }
                .padding()
            }
            .navigationTitle("Maze Game")
            .navigationDestination(for: String.self) { action in
                // Check if the user has reached the exit.
                if (solutionPathString == currentPathString) {
                    MazeExitView(navPath: $navPath, currentPath: $currentPath, solutionPath: $solutionPath, solutionPathString: $solutionPathString, currentPathString: $currentPathString)
                } else {
                    MazeLocationView(previous_action: action, navPath: $navPath, currentPath: $currentPath, solutionPath: $solutionPath, solutionPathString: $solutionPathString, currentPathString: $currentPathString)
                }
            }
        }
        .onAppear {
            solutionPathString = solutionPath.joined(separator: "->")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
