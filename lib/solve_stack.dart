class SolveStack {
  String number1 = "";
  double num1 = 0;
  double solution = 0;
  int index = 0;
  String answer = "";
  bool isOperator(String ch) {
    return ch == "+" || ch == "−" || ch == "×" || ch == "÷" || ch == "%";
  }

  String solveEquation(String equation) {
    for (int i = 0; i < equation.length; i++) {
      String ch = equation.substring(i, i + 1);

      if (!isOperator(ch)) {
        number1 = "$number1$ch";
      } else {
        index = i;
        break;
      }
    }
    String operator = equation.substring(index, index + 1);
    if (operator.isEmpty) {
      return number1;
    }

    String number2 = equation.substring(index + 1);

    if (operator == "%" && number2.isEmpty) {
      return "${double.parse(number1) / 100}";
    }
    try {
      double num1 = double.parse(number1);
      double num2 = double.parse(number2);

      switch (operator) {
        case "+":
          solution = num1 + num2;
        case "−":
          solution = (num1) - (num2);
        case "×":
          solution = num1 * num2;
        case "÷":
          solution = num1 / num2;
        case "%":
          solution = num1 % num2;
        default:
          return number1;
      }
    } catch (e) {
      return "ERROR";
    }
    if (!number1.contains(".") &&
        !number2.contains(".") &&
        solution.toString().contains("0")) {
      answer = "${solution.truncate()}";
    } else {
      answer =
          "${solution.floor() + ((10 * (solution % (solution.floor()))).roundToDouble()) / 10}";
    }
    return answer;
  }

  String negate(String equation) {
    for (int i = 0; i < equation.length; i++) {
      String ch = equation.substring(i, i + 1);

      if (!isOperator(ch)) {
        number1 = "$number1$ch";
      } else {
        index = i;
        break;
      }
    }
    try {
      double num1 = double.parse(number1) * -1;

      if (equation.contains("+") ||
          equation.contains("−") ||
          equation.contains("×") ||
          equation.contains("÷") ||
          equation.contains("%")) {
        String operator = equation.substring(index, index + 1);
        String number2 = equation.substring(index + 1);

        double num2 = double.parse(number2) * -1;

        if (!number2.contains(".")) {
          number2 = "${num2.truncate()}";
        } else {
          number2 = num2.toString();
        }

        return number1 + operator + number2;
      } else {
        solution = num1;
        answer = "$num1";
      }

      if (!number1.contains(".")) {
        answer = "${solution.truncate()}";
      }
      return answer;
    } catch (e) {
      return "ERROR";
    }
  }
}
