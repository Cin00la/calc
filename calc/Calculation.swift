//
//  Calculation.swift
//  calc
//
//  Created by Nicolas Chang Sing  on 18/3/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

class Calculation{
    
    // turns double negation into a positive
    func dNegationToPositive(args : [String]) ->[String]{
        if(args.count == 1) {return args;}
        for i in 0...args.count-1 {
            if(i%2 != 0 && i<args.count-1){
                if(args[i] == "-" && Int(args[i+1])! < 0){
                    return dNegationToPositive(args:Array(args.prefix(upTo: i)) +
                     ["+",String(-1*Int(args[i+1])!)] +
                    Array(args.suffix(from: i+2)))
                }
            }
        }
        return args;
    }
    
    func calculateOperation(givenOperator: String, num1: Int, num2:Int)->Int{
        var returnNum: Int = 0;
        switch(givenOperator){
        case "x": returnNum = (num1 * num2);
        case "%": returnNum = (num1 % num2);
        case "/": returnNum = (num1 / num2);
        case "+": returnNum = (num1 + num2);
        case "-": returnNum = (num1 - num2);
        default: print("This shouldn't be printing")
        }
        return returnNum ;
    }

    func recursion(args : [String])->[String]{
        var result : String = "";
        var index : Int = 1;
        if(args.count == 1) {
            return args;
            
        }
        for i in 0...args.count-1 {
            if(i%2 != 0){
                
                if((args[i] == "+" || args[i] == "-") && !(args[index] == "x" || args[index] == "/" || args[index] == "%" || args[index] == "-")) {
                    index = i;
                }
                
                if((args[i] == "x" || args[i] == "/" || args[i] == "%") && !(args[index] == "x" || args[index] == "/" || args[index] == "%")) {
                    index = i;
                }
            }
        }
        result = String(calculateOperation(givenOperator: args[index], num1: Int(args[index-1])!, num2: Int(args[index+1])!))
        return recursion(args :Array(args.prefix(upTo: index-1)) + [result] + Array(args.suffix(from: index+2)))
    }
}
