import CreateML
import Foundation

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "your_data_path"))
let (trainingData, testingData) = data.randomSplit(by: 0.8, seed: 2018)
let model = try MLRegressor(trainingData: trainingData, targetColumn: "your_target_column")
let metrics = model.evaluation(on: testingData)

print(metrics.rootMeanSquaredError)
print(metrics.maximumError)
