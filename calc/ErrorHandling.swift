//
//  ErrorHandling.swift
//  calc
//
//  Created by Nicolas Chang Sing  on 4/3/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

//Error handled:
//Division by Zero
//Valid Input

enum CalculationError : Error{
    case divisionByZero
    case invalidOutput
}

class ErrorHandling{
    func errorPrevention(args: [String]) throws {
        if(checkDivisionByZero(args: args)) {
            throw CalculationError.divisionByZero;
            
        }
        if(checkInvalidOutput(args: args)) {
            throw CalculationError.invalidOutput;
            
        }
    }
    
    func checkDivisionByZero(args: [String]) -> Bool{
        for i in 0...args.count-1{
            if(i%2 != 0 && i<args.count-1){
                if(args[i] == "/" && args[i+1] == "0"){
                    return true;
                    
                }
            }
        }
        return false
    }
    
    func checkInvalidOutput(args: [String]) -> Bool {
        for i in 0...args.count-1{
            if(i%2 != 0){
                if(!isOperator(args: args[i])){
                    return true;
                    
                }
                if(i%2 == 0){
                    if(Int(args[i]) == nil){
                        return true;
                        
                    }
                }
            }
        }
        if(isOperator(args: args[args.count-1])){
            return true;
            
        }
        return false;
    }
    
    func isOperator(args: String) -> Bool{
        if(args == "x" || args == "/" || args == "%" || args == "+" || args == "-"){
            return true;
        }
        return false;
    }
}
