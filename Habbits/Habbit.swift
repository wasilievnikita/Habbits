//
//  Habbit.swift
//  Habbits
//
//  Created by Никита Васильев on 21.06.2023.
//

import UIKit

struct Habbit {
    let name: String
    let description: String
    var counter: Int

    
    static func maketHabbit() -> [Habbit] {
        var habbit = [Habbit]()
        
        habbit.append( Habbit(name: "Выпить стакан воды", description: "Каждый день в 7:00",  counter: 0))
        habbit.append(Habbit(name: "Лечь спать до 23:00 и проснуться в 7:00", description: "Каждый день в 22:30",   counter: 0))
        habbit.append(Habbit(name: "Прочитать 30 страниц книги", description: "Каждый день в 21:30", counter: 0))
        return habbit
    }
}


