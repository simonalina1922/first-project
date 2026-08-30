//
//  main.swift
//  caloriecalculator
//
//  Created by Alina on 26.08.2026.
//

import Foundation

print("КАЛЬКУЛЯТОР КАЛОРИЙ")
print("-------------------")

print("Введите количество калорий в первом продукте:")
guard let input1 = readLine(), let calories1 = Double(input1) else {
    print("Ошибка: введено не число!")
    exit(1)
}

print("Введите количество калорий во втором продукте:")
guard let input2 = readLine(), let calories2 = Double(input2) else {
    print("Ошибка: введено не число!")
    exit(1)
}

print("Введите количество калорий в третьем продукте:")
guard let input3 = readLine(), let calories3 = Double(input3) else {
    print("Ошибка: введено не число!")
    exit(1)
}

let total = calories1 + calories2 + calories3

print("-------------------")
print("Всего калорий: \(total) ккал")

