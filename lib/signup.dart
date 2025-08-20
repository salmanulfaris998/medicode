import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Step 1: Create a GlobalKey for the Form widget
  final _formKey = GlobalKey<FormState>();

  // Step 2: Create TextEditingControllers for each input field
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController(); // New controller for confirm password

  // Step 3: Function to clear the form fields
  void _clearForm() {
    _fullNameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear(); // Clear confirm password
  }

  // Step 4: Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a success message and clear the form
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign Up Successful')),
      );
      _clearForm(); // Clear the form fields after successful submission
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Color
          Container(
            color: const Color.fromARGB(255, 226, 164, 9),
          ),
          // Top Image
          Container(
            height: 250, // Adjust height as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/8592F678-92E5-412A-8A44-F336DF3C2328.PNG'), // Path to your image
                fit: BoxFit.cover, // Adjust how the image fits
              ),
            ),
          ),
          // Centered Form
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Padding(
                padding: const EdgeInsets.only(top: 250, bottom: 100),
                child: Form(
                  key: _formKey, // Attach the GlobalKey to the Form widget
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Full Name Field
                      _buildTextFormField(
                          'Full Name', Icons.person, _fullNameController),
                      SizedBox(height: 20),

                      // Email Field
                      _buildTextFormField(
                          'Email', Icons.email, _emailController),
                      SizedBox(height: 20),

                      // Password Field
                      _buildTextFormField(
                          'Password', Icons.lock, _passwordController,
                          obscureText: true),
                      SizedBox(height: 20),

                      // Confirm Password Field
                      _buildTextFormField('Confirm Password', Icons.lock,
                          _confirmPasswordController,
                          obscureText: true), // New confirm password field
                      SizedBox(height: 20),

                      // Sign Up Button
                      ElevatedButton(
                        onPressed: _submitForm, // Call the submit function
                        child: const Text('Sign Up',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(
                                color: const Color.fromARGB(255, 12, 12, 12)),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          backgroundColor: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to build text form fields
  Widget _buildTextFormField(
      String label, IconData icon, TextEditingController controller,
      {bool obscureText = false}) {
    return TextFormField(
      controller:
          controller, // Step 2: Link the controller to the TextFormField
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Color.fromARGB(41, 4, 4, 4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.black),
        ),
        prefixIcon: Icon(icon, color: Colors.black),
      ),
      // Step 4: Add validation logic for the input fields
      validator: (value) {
        if (label == 'Full Name' && (value == null || value.isEmpty)) {
          return 'Please enter your full name';
        } else if (label == 'Email') {
          // Basic email validation
          final emailPattern =
              RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
          if (value == null || value.isEmpty || !emailPattern.hasMatch(value)) {
            return 'Please enter a valid email';
          }
        } else if (label == 'Password' && (value == null || value.length < 6)) {
          return 'Password must be at least 6 characters';
        } else if (label == 'Confirm Password') {
          if (value != _passwordController.text) {
            return 'Passwords do not match';
          }
        }
        return null; // Return null if the input is valid
      },
    );
  }
}
