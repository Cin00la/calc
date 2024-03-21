//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // removes the name of the program

let calculation = Calculation();
let errorHandle = ErrorHandling();
do{
    try errorHandle.errorPrevention(args: args)
    let newArgs = calculation.dNegationToPositive(args: args);
    let finalResult = calculation.recursion(args: newArgs);
    print(Int(finalResult[0])!);
}
catch CalculationError.divisionByZero{
        print("Invalid Output")
        exit(1);
        
}
catch CalculationError.invalidOutput{
        print("Invalid Output")
        exit(1);
        
}

