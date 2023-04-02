//
//  CharacterSeriesRow.swift
//  practicaIOSSuperpoderes
//
//  Created by vero on 1/4/23.
//

import SwiftUI

struct CharacterSeriesRow: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var serie: CharacterSeriesResult
    
    var body: some View {
        
        
     
            VStack{
                
                Text(serie.title)
                    .font(.title2)
                    .foregroundColor(.blue)
                    .padding()
                    .bold()
                    .opacity(0.7)
                    .id(0)
                AsyncImage(url: URL(string: "\(serie.thumbnail.path).\(serie.thumbnail.thumbnailExtension)")) { Image in
                    Image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                      
                        .padding()
                        .id(1)
                    
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                       
                        .padding()
                        .id(2)
                    
                    
                }
                if let descripcion = serie.description {
                    Text("\(descripcion)")
                        .font(.callout)
                 
                        .padding()
                        .id(3)
                    
                    
                    
                }else{
                    Text("Empty description")
                        .font(.callout)
                    .padding()
                        .id(4)
                }
                
                
                
                
            }
            
            .cornerRadius(10)
        }
    }
    
    
    struct CharacterSeriesRow_Previews: PreviewProvider {
        static var previews: some View {
            CharacterSeriesRow(serie: CharacterSeriesResult(
                id: 1,
                title: "Row Character Series ",
                description: "Row description Series",
                thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5"))
            
            
            
            
            
            )
                
           
                
            
        }
    }
