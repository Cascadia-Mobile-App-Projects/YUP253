//
//  Safety_Waivers.swift
//  YUP253
//
//  Created by Sean Jones on 11/3/21.
//
import SwiftUI

struct Safety_Waivers: View {
				var body: some View {
					VStack {
						
						ScrollView {
							Text("Waivers").font(.title).foregroundColor(.black)
								.padding(.top,115.0)
							
										VStack(spacing: 20) {
											Image("YUP_Waiver")
												.resizable()
																.frame(height: 900)
																						.background(Color.white)
												
											Image("YUP_Waiver2")
												.resizable()
																.frame(height: 900)
																						.background(Color.white)
											Image("YUP_Waiver3")
												.resizable()
																.frame(height: 900)
																						.background(Color.white)
											Image("YUP_Waiver4")
												.resizable()
																.frame(height: 900)
																						.background(Color.white)
											Image("YUP_Waiver5")
												.resizable()
																.frame(height: 900)
																						.background(Color.white)
														
										}
						}
						.frame(height: 900)
						
					
					}
					
					
				}
}

struct Safety_Waivers_Previews: PreviewProvider {
				static var previews: some View {
					Safety_Waivers()
						.preferredColorScheme(.light)
						
						
				}
}
