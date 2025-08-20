import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for TextInputFormatter
import 'package:medicode/Log%20in%20with%20Email.dart';
import 'package:medicode/otp.dart';

class Login extends StatelessWidget {
  Login({super.key});

  // Added: Controller for the phone number input
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 255, 255, 255), // Replace with your image's background color
      body: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Image.asset("assets/IMG_2418 (1).JPG"),
          Text(
            "STAY INFORMED STAY HEALTHY",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Adjust color as needed
                letterSpacing: 1.2,
                fontFamily: "fonts/Oswald-VariableFont_wght.ttf"),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 118, bottom: 12),
            child: Text(
              "Log in with phone number",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Adjust color as needed
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Mobile Number TextField
          Container(
            width: 355, // Set the desired width
            height: 60, // Set the desired height
            margin: const EdgeInsets.symmetric(
                vertical: 20), // Space around the TextField
            child: TextField(
              controller:
                  phoneController, // Use controller for phone number input
              decoration: InputDecoration(
                labelText: "Enter your mobile number",
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Allow only digits
                LengthLimitingTextInputFormatter(10), // Limit to 10 digits
              ],
            ),
          ),

// Log In Button
          ElevatedButton(
            onPressed: () {
              String phoneNumber = phoneController.text; // Capture phone number
              if (phoneNumber.length == 10) {
                // Ensure exactly 10 digits
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        Otp(
                            phoneNumber:
                                phoneNumber), // Pass phone number to Otp screen
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    transitionDuration: Duration(
                        milliseconds: 300), // Adjust transition duration
                    reverseTransitionDuration:
                        Duration(milliseconds: 300), // Adjust reverse duration
                  ),
                );
              } else {
                // Show a message if the phone number is not 10 digits
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Please enter a valid 10-digit number.')),
                );
              }
            },
            child: const Text(
              "Log In",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white, // Text color
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(300, 50), // Set button size
              backgroundColor:
                  const Color.fromARGB(255, 69, 11, 141), // Button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "OR",
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Sign in with Google button
              ElevatedButton.icon(
                onPressed: () {
                  // Add Google sign-in functionality here
                },
                icon: Image.asset(
                  'assets/Logo-google-icon-PNG.png',
                  width: 20,
                  height: 20,
                ), // Replace with Google icon if available
                label: Text(
                  "Sign in with Google",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  shadowColor: Colors.grey,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              SizedBox(width: 10), // Spacing between buttons

              // Sign in with Apple button
              ElevatedButton.icon(
                onPressed: () {
                  // Add Apple sign-in functionality here
                },
                icon: Image.asset(
                  'assets/apple-512.png',
                  width: 20,
                  height: 20,
                ), // Apple icon
                label: Text(
                  "Sign in with Apple",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  shadowColor: Colors.grey,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      LoginwithEmail(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  transitionDuration:
                      Duration(milliseconds: 300), // Forward transition speed
                  reverseTransitionDuration:
                      Duration(milliseconds: 300), // Backward transition speed
                ),
              );
            },
            child: const Text(
              "Log in with Email",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white, // Text color
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(300, 50), // Set button size
              backgroundColor:
                  const Color.fromARGB(255, 69, 11, 141), // Button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('''Don't have an account?'''),
              TextButton(onPressed: () {}, child: Text('Sign up'))
            ],
          )
        ],
      ),
    );
  }
}
