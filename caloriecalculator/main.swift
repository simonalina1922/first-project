import Foundation
import JavaScriptCore

// 1. Инициализируем контекст JavaScript
guard let context = JSContext() else {
    print("Ошибка: Не удалось запустить движок JavaScript")
    exit(1)
}

// 2. Передаем функции ввода и вывода из Swift в JavaScript
let readLineBlock: @convention(block) () -> String? = { return readLine() }
context.setObject(readLineBlock, forKeyedSubscript: "swiftReadLine" as NSCopying & NSObjectProtocol)

let printBlock: @convention(block) (String) -> Void = { message in print(message) }
context.setObject(printBlock, forKeyedSubscript: "swiftPrint" as NSCopying & NSObjectProtocol)

// 3. Код калькулятора на языке JavaScript
let javaScriptCode = """
swiftPrint("КАЛЬКУЛЯТОР КАЛОРИЙ на JavaScript (в Xcode)");
swiftPrint("-------------------------------------------");
swiftPrint("Вводите калории по очереди.");
swiftPrint("Чтобы закончить расчет, напишите 'стоп' или нажмите Enter.");
swiftPrint("-------------------------------------------");

let totalCalories = 0;
let productCount = 0;

while (true) {
    productCount++;
    swiftPrint("Продукт №" + productCount + " (калории): ");
    
    let input = swiftReadLine();
    
    // Если ввод пустой
    if (!input) {
        productCount--;
        break;
    }
    
    // Убираем пробелы средствами JS
    let trimmedInput = input.replace(/^\\s+|\\s+$/g, "");
    
    if (trimmedInput === "" || trimmedInput.toLowerCase() === "стоп") {
        productCount--;
        break;
    }
    
    let calories = Number(trimmedInput);
    
    if (!isNaN(calories) && calories >= 0) {
        totalCalories += calories;
    } else {
        swiftPrint("❌ Ошибка JS: введите корректное число или 'стоп' для выхода.");
        productCount--;
    }
}

swiftPrint("-------------------------------------------");
swiftPrint("Итого продуктов посчитано: " + productCount);
swiftPrint("Всего калорий: " + totalCalories + " ккал");
"""

// 4. Запускаем код
context.evaluateScript(javaScriptCode)

