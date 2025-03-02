import 'package:dart_eval/dart_eval.dart';
import 'dart:math';

/// A calculator class that handles mathematical expressions and evaluations.
/// 
/// This class follows the Singleton pattern with a private constructor and static instance.
/// It maintains the current expression state and handles various mathematical operations.
class GyaeSan25 {
  /// The single static instance of the calculator
  static final GyaeSan25 to = GyaeSan25._internal();

  /// Private constructor for Singleton pattern
  GyaeSan25._internal();
  
  /// The current mathematical expression being built or evaluated
  String expression = ''; 
  
  /// Alpha value for UI image transparency. 
  /// Set to 255 on calculation errors, 0 otherwise.
  int alpha = 0; 

  /// List of valid numeric characters including decimal point
  final List<String> number = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.'];

  /// List of valid mathematical operators and symbols
  final List<String> symbol = ['^', '(', ')', '+', '-', '*', '/', '%'];

  /// Processes input text to build and evaluate mathematical expressions.
  /// 
  /// This method handles:
  /// - Adding numbers and operators to the expression
  /// - Evaluating the expression when '=' is entered
  /// - Erasing the last character with 'ERASE'
  /// - Clearing the expression with 'RESET'
  /// 
  /// For evaluation, it:
  /// 1. Combines consecutive numbers/decimals
  /// 2. Handles parentheses evaluation from innermost to outermost
  /// 3. Processes exponents (^) before other operations
  /// 4. Evaluates the final expression
  /// 
  /// On calculation errors:
  /// - Sets alpha to 255 (full opacity)
  /// - Clears the expression
  ///
  /// [text] The input character or command to process
  void gs25(String text) {
    alpha = 0; //Reset error state
    if (number.contains(text)) {
      expression += text;
    } else if (symbol.contains(text)) {
      expression += text;
    } else if (text == '=') {
      if (expression != '') {
        var gsList = []; //List for calculation

        gsList = expression.split('');
        
        // Combine consecutive numbers and decimals
        int t = 1;
        while (t <= gsList.length - 1) {
          if (symbol.contains(gsList[t]) || symbol.contains(gsList[t - 1])) {
            t++;
          } else {
            gsList[t - 1] += gsList[t];
            gsList.removeAt(t);
          }
        }
        
        // Convert integers to floats
        for (int i = 0; i <= gsList.length - 1; i++) {
          if (!symbol.contains(gsList[i]) && !gsList[i].contains('.')) {
            gsList[i] += '.0';
          }
        }

        try {
          eval(gsList.join('').replaceAll('^', '+'));

          // Handle parentheses evaluation
          while (gsList.contains('(')) {
            var gwOpIdx = []; // Opening parenthesis indices
            var gwClIdx = []; // Closing parenthesis indices
            var temp = [...gsList];
            while (temp.contains('(')) {
              gwOpIdx.add(temp.lastIndexOf('('));
              gwClIdx.add(temp.lastIndexOf(')'));
              temp[temp.lastIndexOf('(')] = 'Op';
              temp[temp.lastIndexOf(')')] = 'Cl';
            }
            
            temp.clear();
            temp.addAll(gwClIdx);
            temp.addAll(gwOpIdx);
            temp.sort();
            var op = gwOpIdx[0];
            var cl = temp[temp.indexOf(gwOpIdx[0]) + 1];
            var smallGw = gsList.sublist(op + 1, cl);

            // Handle exponents within parentheses
            while (smallGw.contains('^')) {
              int ind = smallGw.indexOf('^');
              smallGw.insert(ind - 1, pow(double.parse(smallGw[ind - 1]), double.parse(smallGw[ind + 1])).toString());
              smallGw.removeRange(ind, ind + 3);
            }

            gsList.insert(op, eval(smallGw.join('')).toString());
            gsList.removeRange(op + 1, cl + 2);
            gwOpIdx.remove(op);
            gwClIdx.remove(cl);
          }

          // Handle remaining exponents
          while (gsList.contains('^')) {
            int ind = gsList.indexOf('^');
            gsList.insert(ind - 1, pow(double.parse(gsList[ind - 1]), double.parse(gsList[ind + 1])).toString());
            gsList.removeRange(ind, ind + 3);
          }

          expression = eval(gsList.join('')).toString();
          gsList = [];
        } catch (error) {
          alpha = 255;
          expression = '';
        }
      }
    } else if (text == 'ERASE') {
      if (expression.length <= 1) {
        expression = '';
      } else {
        expression = expression.substring(0, expression.length - 1);
      }
    } else if (text == 'RESET') {
      expression = '';
    }
  }
}
