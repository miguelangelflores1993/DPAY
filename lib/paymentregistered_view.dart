import 'package:flutter/material.dart';

class PaymentRegisteredView extends StatelessWidget {
  final String referenceNumber;
  final String dateTime;
  final String detail;
  final String amount;

  const PaymentRegisteredView({
    super.key,
    this.referenceNumber = "#123456",
    this.dateTime = "30/05/2025 11:36",
    this.detail = "Product Name",
    this.amount = "5,000.00",
  });

  static const green = Color(0xFF32D583);

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
                      'Payment Registered',
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
            
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    
                    // dPay Logo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'd',
                                style: TextStyle(
                                  color: Color(0xFF0E27A1),
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'Pay',
                                style: TextStyle(
                                  color: Color(0xFF0E27A1),
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Transform.rotate(
                            angle: 0.5,
                            child: Container(
                              decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Receipt Title
                    const Text(
                      'Receipt',
                      style: TextStyle(
                        color: Color(0xFF313A4E),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Receipt Details
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          _ReceiptRow(
                            label: 'Reference number',
                            value: referenceNumber,
                            isValueBold: true,
                          ),
                          const SizedBox(height: 16),
                          _ReceiptRow(
                            label: 'Date and time',
                            value: dateTime,
                            isValueBold: true,
                          ),
                          const SizedBox(height: 16),
                          _ReceiptRow(
                            label: 'Detail',
                            value: detail,
                            isValueBold: true,
                          ),
                          const SizedBox(height: 16),
                          _ReceiptRow(
                            label: 'Amount',
                            value: 'Bs $amount',
                            isValueBold: true,
                          ),
                        ],
                      ),
                    ),
                    
                    const Spacer(),
                  ],
                ),
              ),
            ),
            
            // Buttons
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Back to Home Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to home or pop to root
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE5E7EB),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: const Text(
                        'Back to Home',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Share Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Share functionality
                        print('Sharing receipt...');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF12B76A),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: const Text(
                        'Share',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReceiptRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isValueBold;

  const _ReceiptRow({
    required this.label,
    required this.value,
    this.isValueBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: const Color(0xFF313A4E),
              fontSize: 16,
              fontWeight: isValueBold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}