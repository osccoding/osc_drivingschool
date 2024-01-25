Config = {
    Framework = 'esx', -- esx
    Inventory = 'ox', -- ox, quasar, chezza
    Target = 'ox_target', -- qtarget, ox_target
    BossMenu = 'esx_society' -- esx_society
}

Config.LicenseType = {
    {label = "DMV", name = 'dmv'},
    {label = "Car", name = 'drive'},
    {label = "Bike", name = 'drive_bike'},
    {label = "Truck", name = 'drive_truck'},
    {label = "Boat", name = 'drive_boat'},
}

Config.Boss = {
    {
        Target_Icon = "fas fa-computer",
        Target_Label = "Boss Menu",
        Job = 'drivingschool',
        Coords = vector3(217.1023, -1390.8378, 30.5875),
    }
}

Config.Stashs = {
    {
        Name = "school",
        Label = "Driving School Stash",
        Slots = 50,
        Weight = 50000, -- 50 KG
        Target_Icon = "fas fa-box-open",
        Target_Label = "Open Stash",
        Job = 'drivingschool',
        Coords = vector3(214.8316, -1389.0184, 30.5875),
    }
}