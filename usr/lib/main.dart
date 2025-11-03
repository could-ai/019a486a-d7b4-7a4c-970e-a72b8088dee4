import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Python Code Explanation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const CodeExplanationScreen(),
    );
  }
}

class CodeExplanationScreen extends StatelessWidget {
  const CodeExplanationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final codeStyle = GoogleFonts.sourceCodePro(
      backgroundColor: Colors.grey[200],
      color: Colors.black87,
      fontSize: 14,
    );
    final textStyle =
        Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Print vs. Bare Expression in Python'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Understanding the Difference',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            "You've asked why two similar lines of Python code can produce different results. Let's break down the behavior of your code snippet.",
            style: textStyle,
          ),
          const SizedBox(height: 16),
          const Text(
            'Your Code:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          _buildCodeBlock(
            '''
is_data_scientist = True
print("is_data_scientist =", is_data_scientist, "and type", type(is_data_scientist))
type(is_data_scientist)
''',
            codeStyle,
          ),
          const SizedBox(height: 24),
          const Text(
            '1. The `print()` Function',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            "The `print()` function is an explicit instruction to your program to output information to the console. It takes whatever you give it, converts it to a string, and displays it. That's why you see this line in your output:",
            style: textStyle,
          ),
          const SizedBox(height: 8),
          _buildCodeBlock(
            'is_data_scientist = True and type <class \'bool\'>',
            codeStyle.copyWith(backgroundColor: Colors.green[100]),
          ),
          const SizedBox(height: 24),
          const Text(
            '2. The Bare Expression: `type(is_data_scientist)`',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            "The line `type(is_data_scientist)` is an expression. It gets evaluated by Python, and it returns a value (in this case, the type object `<class 'bool'>`).",
            style: textStyle,
          ),
          const SizedBox(height: 8),
          Text(
            "However, simply evaluating an expression does not automatically print its result to the screen when running a script. The program calculates the result and, since you don't assign it to a variable or pass it to a function like `print()`, the result is discarded. Therefore, this line produces no visible output on its own in a standard script.",
            style: textStyle,
          ),
          const SizedBox(height: 24),
          const Text(
            'The Key Difference: Interactive vs. Script Mode',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            "The confusion often comes from the behavior of interactive environments like a Python REPL or a Jupyter/Colab notebook. In those environments, the result of the very last line of code in a cell is automatically printed for convenience. This is a feature of the interactive tool, not a core feature of the Python language itself.",
            style: textStyle,
          ),
          const SizedBox(height: 8),
          Text(
            "So, if you ran your code in a notebook, you would see two lines of output:",
            style: textStyle,
          ),
          const SizedBox(height: 8),
          _buildCodeBlock(
            '''
is_data_scientist = True and type <class 'bool'>
<class 'bool'>
''',
            codeStyle.copyWith(backgroundColor: Colors.green[100]),
          ),
          const SizedBox(height: 24),
          const Text(
            'Conclusion',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            "Always use the `print()` function when you want to guarantee that output will be displayed on the console, regardless of the environment you are running the code in.",
            style: textStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildCodeBlock(String text, TextStyle style) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(text.trim(), style: style),
    );
  }
}
