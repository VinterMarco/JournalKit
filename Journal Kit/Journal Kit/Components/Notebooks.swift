//
//  Notebooks.swift
//  Journal Kit
//
//  Created by Vinter Marco on 28.01.2024.
//

import SwiftUI

enum ImageType: String {
    case london
    case trip2
    case trip3
    case trip4
}

struct Notebooks: View {
    
//    var images : [Image]  = [
//        Image(.london),
//        Image(.trip2),
//        Image(.trip3),
//        Image(.trip4)
//    ]
    
    var images: [ImageType] = [.london, .trip2, .trip3, .trip4]

    
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                    .opacity(0)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack() {
                            ForEach(images, id: \.self) { image in
                                NavigationLink {
                                    Text("View")
                                } label: {
                                    Image(image.rawValue)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width - 40, height: 200)
                                        .cornerRadius(15)


                                        .overlay {
                                            VStack {
                                                HStack {
                                                    VStack (alignment : .leading) {
                                                        Text("14 Notes")
                                                            .foregroundStyle(.gray)
                                                            .font(.footnote)

                                                        Text("TITLE")
                                                            .foregroundStyle(.white)
                                                            .font(.title).bold()
                                                        Text("last visited 15 Feb, 2024")
                                                            .foregroundStyle(.white)
                                                            .font(.footnote)
                                                    }
                                                    Spacer()
                                                    
                                                }
                                                Image(image.rawValue)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(height: 111)
                                                    .cornerRadius(15)
                                            }
                                            .padding(7)
                                            .frame(width: UIScreen.main.bounds.width - 40, height: 200)
                                            .background(.thinMaterial)
                                            .cornerRadius(15)


                                        }
//                                    HStack {
//                                        Image(.london)
//                                            .resizable()
//                                            .scaledToFill()
//                                            .frame(width: 50)
//                                        Spacer()
//                                        VStack {
//                                            Text("Title")
//                                                .foregroundStyle(.orange.gradient)
//                                                .font(.headline)
//                                            HStack {
//                                                Text("Row \(notebook)")
//                                                    .font(.footnote)
//                                            }
//                                        }
//                                        Spacer()
//                                        Spacer()
//                                    }
//                                        .frame(width: UIScreen.main.bounds.width - 25, height: 60)
//                                        .background(.ultraThinMaterial)
//                                        .foregroundColor(.white)
//                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
            }
            .navigationTitle("Notebooks")
        }
    }
}

#Preview {
    Notebooks()
}
