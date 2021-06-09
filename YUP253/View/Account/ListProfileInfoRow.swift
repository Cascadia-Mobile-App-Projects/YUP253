//
//  ListProfileInfoRow.swift
//  YUP253
//
//  Created by Student Account on 6/9/21.
//

import SwiftUI
import RealmSwift
struct ListProfileInfoRow: View {
    let thisPerson:Person
    
    init(thePerson:Person){
        thisPerson = Person(id: UUID().hashValue, username: "Joey_Baloney", password: "73hp@55w0rd!?", fName: "Joseph", lName: "Balconi", age: "13", phNum: "2634577743", email: "joeydahbaloney@none.com")
    }
    
    func noop(){}
    
    @EnvironmentObject var theDataRepo: DataRepository

    var body: some View {
        VStack(alignment: .leading) {
                Text("Profile Info:")
                padding()
                HStack {
                    Text("Username: \(thisPerson.username)")
                    Text("First Name: \(thisPerson.fName)")
                    Text("Last Name: \(thisPerson.lName)")
                    Text("Age: \(thisPerson.age)")
                    Text("Phone Number: \(thisPerson.phNum)")
                    Text("E-mail: \(thisPerson.email)")
                }
            }
        .background(LinearGradient(gradient: Gradient(colors: [Color.black, (Color(red: 0.022, green: 0.24, blue: 0.561))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
}
}


struct ListProfileInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        let demoProfile = Person(id: UUID().hashValue, username: "Joey_Baloney", password: "73hp@55w0rd!?", fName: "Joseph", lName: "Balconi", age: "13", phNum: "2634577743", email: "joeydahbaloney@none.com")
        ListProfileInfoRow(thePerson: demoProfile)
    }
}
