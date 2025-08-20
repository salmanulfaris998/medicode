import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Otp extends StatelessWidget {
  final String phoneNumber;

  Otp({required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    String lastFourDigits = phoneNumber.length >= 4
        ? phoneNumber.substring(phoneNumber.length - 4)
        : phoneNumber;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          SizedBox(height: 45),
          Image.asset('assets/10221118 2.jpg'),
          SizedBox(height: 20),
          Text(
            'Enter Verification code',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 20),
          Text(
            '''We are automatically detecting an SMS 
   sent to your mobile number ******$lastFourDigits''',
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          OtpInput(),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            child: const Text(
              "Submit",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
              backgroundColor: const Color.fromARGB(255, 69, 11, 141),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Didn\'t receive the OTP?'),
              TextButton(onPressed: () {}, child: Text('RESEND OTP'))
            ],
          ),
        ],
      ),
    );
  }
}

// OtpInput class (no changes needed)
class OtpInput extends StatefulWidget {
  @override
  _OtpInputState createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _handleOtpChange(int index, String value) {
    if (value.isNotEmpty && index < _focusNodes.length - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildOtpField(0),
        SizedBox(width: 10),
        _buildOtpField(1),
        SizedBox(width: 10),
        _buildOtpField(2),
        SizedBox(width: 10),
        _buildOtpField(3),
      ],
    );
  }

  Widget _buildOtpField(int index) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        maxLength: 1,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          letterSpacing: 8,
        ),
        onChanged: (value) {
          _handleOtpChange(index, value);
        },
      ),
    );
  }
}
