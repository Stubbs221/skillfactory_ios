// Exercise 1
var mrPresident = (age: 49, firstName: "William", secondName: "Jefferson", surname: "Clinton")
var intern = (age: 22, firstName: "Monica", secondName: "Samille", surname: "Lewinsky")

mrPresident.0
mrPresident.1
mrPresident.2
mrPresident.3

intern.age
intern.firstName
intern.secondName
intern.surname

// Exercise 2
var daysInMonth: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
var monthName: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

for i in 1..<daysInMonth.count{
    print(daysInMonth[i])
}

for i in 1...daysInMonth.count-1{
    print("In \(monthName[i]), \(daysInMonth[i]) days ")
}

var arrayOfTuples = zip( daysInMonth, monthName).map{($1, $0)}

for (month, days) in arrayOfTuples {
    print("In \(month), \(days) days")
}

for i in stride(from: daysInMonth.count-1, through: 0, by: -1){
    print("In \(monthName[i]), \(daysInMonth[i]) days")
}

func daysRemain(day currentDay: Int, month currentMonth: String) -> Int?{
    guard currentDay <= daysInMonth[monthName.firstIndex(of: currentMonth)!] && monthName.contains(currentMonth) else {
        print("Incorrect data!")
        return nil
    }
    let daysLeft = daysInMonth[monthName.firstIndex(of: currentMonth)!] - currentDay
    let monthsLeft = daysInMonth[monthName.firstIndex(of: currentMonth)!...]
    return Optional(monthsLeft.reduce(daysLeft, +))
}

daysRemain(day: 15, month: "July")

// Exercise 3
var journalOfStudents = ["Mike": 5, "Robert": 4, "Nate": 1, "Jeff": 2, "Richard": 4]

journalOfStudents["Nate"] = 2

for value in journalOfStudents.values {
    if value >= 3 {
        print("Congratulation! You have passed the exam!")
    } else {
        print("You gonna retake the exam.")
    }
}

journalOfStudents["Chad"] = 3
journalOfStudents["Polly"] = 5
journalOfStudents["Harold"] = 4
journalOfStudents["Tomas"] = 4

journalOfStudents["Tomas"] = nil

print(Double(journalOfStudents.values.reduce(0, +) / journalOfStudents.count))
