import 'package:app/paymentlink_view.dart';
import 'package:app/paymentregistered_view.dart';
import 'package:flutter/material.dart';

class CashPaymentView extends StatefulWidget {
  const CashPaymentView({super.key});

  @override
  State<CashPaymentView> createState() => _CashPaymentViewState();
}

class _CashPaymentViewState extends State<CashPaymentView> {
  String _amount = "5,000.00";
  static const green = Color(0xFF32D583);

  void _onNumberPressed(String number) {
    setState(() {
      if (_amount == "0" || _amount == "0.00") {
        _amount = number;
      } else {
        // Remove formatting for calculation
        String cleanAmount = _amount.replaceAll(',', '');
        if (cleanAmount.length < 10) {
          // Limit digits
          _amount = cleanAmount + number;
          _amount = _formatAmount(_amount);
        }
      }
    });
  }

  void _onDecimalPressed() {
    setState(() {
      if (!_amount.contains('.')) {
        _amount = _amount.replaceAll(',', '') + '.';
        _amount = _formatAmount(_amount);
      }
    });
  }

  void _onDeletePressed() {
    setState(() {
      String cleanAmount = _amount.replaceAll(',', '').replaceAll('.', '');
      if (cleanAmount.length > 1) {
        cleanAmount = cleanAmount.substring(0, cleanAmount.length - 1);
        if (_amount.contains('.') && cleanAmount.length >= 3) {
          cleanAmount =
              cleanAmount.substring(0, cleanAmount.length - 2) + '.' + cleanAmount.substring(cleanAmount.length - 2);
        }
        _amount = _formatAmount(cleanAmount);
      } else {
        _amount = "0";
      }
    });
  }

  String _formatAmount(String amount) {
    // Simple formatting for display
    String cleanAmount = amount.replaceAll(',', '');
    if (cleanAmount.contains('.')) {
      List<String> parts = cleanAmount.split('.');
      String integerPart = parts[0];
      String decimalPart = parts[1];

      // Add commas to integer part
      String formatted = '';
      for (int i = 0; i < integerPart.length; i++) {
        if (i > 0 && (integerPart.length - i) % 3 == 0) {
          formatted += ',';
        }
        formatted += integerPart[i];
      }
      return formatted + '.' + decimalPart;
    } else {
      // Add commas for thousands
      String formatted = '';
      for (int i = 0; i < cleanAmount.length; i++) {
        if (i > 0 && (cleanAmount.length - i) % 3 == 0) {
          formatted += ',';
        }
        formatted += cleanAmount[i];
      }
      return formatted + '.00';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF313A4E),
                        size: 24,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Pago en efectivo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF313A4E),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // Para balancear el header
                ],
              ),
            ),

            // Amount Section
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ingresa el monto',
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Amount Display
                  Text(
                    'Bs $_amount',
                    style: const TextStyle(
                      color: Color(0xFF313A4E),
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Keypad
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Row 1: 1, 2, 3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _KeypadButton('1', () => _onNumberPressed('1')),
                      _KeypadButton('2', () => _onNumberPressed('2')),
                      _KeypadButton('3', () => _onNumberPressed('3')),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Row 2: 4, 5, 6
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _KeypadButton('4', () => _onNumberPressed('4')),
                      _KeypadButton('5', () => _onNumberPressed('5')),
                      _KeypadButton('6', () => _onNumberPressed('6')),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Row 3: 7, 8, 9
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _KeypadButton('7', () => _onNumberPressed('7')),
                      _KeypadButton('8', () => _onNumberPressed('8')),
                      _KeypadButton('9', () => _onNumberPressed('9')),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Row 4: ., 0, Delete
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _KeypadButton(',', _onDecimalPressed),
                      _KeypadButton('0', () => _onNumberPressed('0')),
                      _KeypadDeleteButton(_onDeletePressed),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),

            // Continue Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Acción del botón continuar
                    print('Amount: Bs $_amount');
                    Navigator.push(
                      context,
                      // ignore: inference_failure_on_instance_creation
                      MaterialPageRoute(
                        builder: (context) => const PaymentRegisteredView()
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF12B76A),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Continuar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _KeypadButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _KeypadButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 80,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFF313A4E),
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _KeypadDeleteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _KeypadDeleteButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 80,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Center(
          child: Icon(
            Icons.backspace_outlined,
            color: Color(0xFF313A4E),
            size: 24,
          ),
        ),
      ),
    );
  }
}
