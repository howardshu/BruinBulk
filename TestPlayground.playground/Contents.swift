// test code
APIService.shared.fetchDiningHalls { halls in
    if halls == nil {
        print("Returned nil")
        return
    }
    for hall in halls! {
        print(hall.name)
        print(hall.id)
    }
}

let rieber = DiningHall(name: "Rieber")

APIService.shared.fetchMenu(for: rieber) { menu in
    if menu == nil {
        print("Returned nil")
    }
    for it in menu! {
        print(it.name)
        print(it.nutrition)
    }
}
