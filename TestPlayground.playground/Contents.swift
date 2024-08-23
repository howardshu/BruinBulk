// test code
APIService.shared.fetchDiningHalls { halls in
    if halls == nil {
        print("Returned nil")
    }
}

let rieber = DiningHall(name: "Rieber", url: "doesn't-matter-yet")

APIService.shared.fetchMenu(for: rieber) { menu in
    if menu == nil {
        print("Returned nil")
    }
}
