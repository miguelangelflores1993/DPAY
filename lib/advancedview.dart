import 'package:flutter/material.dart';

class AdvancedView extends StatelessWidget {
  const AdvancedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Blue gradient header section
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff030A2E),
                  Color(0xFF0E27A1),
                  Color(0xff030A2E),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  // Top bar with menu, help and close icons
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.help_outline,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  // Greeting text
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '¡Hello! Juan Pablo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Service icons grid
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        // First row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _ServiceIcon(
                              icon: Icons.qr_code,
                              label: 'QR\nCharge',
                            ),
                            _ServiceIcon(
                              icon: Icons.link,
                              label: 'Payment\nLink',
                            ),
                            _ServiceIcon(
                              icon: Icons.credit_card,
                              label: 'Card\nTap',
                            ),
                            _ServiceIcon(
                              icon: Icons.account_balance_wallet,
                              label: 'Cash\nPayment',
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        
                        // Second row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _ServiceIcon(
                              icon: Icons.phone_android,
                              label: 'Top-ups',
                            ),
                            _ServiceIcon(
                              icon: Icons.lightbulb_outline,
                              label: 'Services',
                            ),
                            _ServiceIcon(
                              icon: Icons.account_balance,
                              label: 'Financial\nCorrespondent',
                            ),
                            const SizedBox(width: 80), // Empty space for alignment
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          
          // White section with transactions
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  // Transactions header
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Transactions',
                              style: TextStyle(
                                color: Color(0xFF313A4E),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Friday, January 30',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'View all',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Transaction list
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        _TransactionItem(
                          icon: Icons.qr_code,
                          title: 'QR Payment',
                          subtitle: 'Payment ID: 1234\nClient: Juan Pérez',
                          amount: 'Bs 150.00',
                        ),
                        _TransactionItem(
                          icon: Icons.link,
                          title: 'Payment Link',
                          subtitle: 'Payment ID: 1234\nClient: Juan Pérez',
                          amount: 'Bs 5,000.00',
                        ),
                        _TransactionItem(
                          icon: Icons.account_balance_wallet,
                          title: 'Cash Payment',
                          subtitle: 'Payment ID: 1234',
                          amount: 'Bs 40.00',
                        ),
                        _TransactionItem(
                          icon: Icons.link,
                          title: 'Payment Link',
                          subtitle: '',
                          amount: 'Bs 5,000.00',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      
      // Bottom navigation bar
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _BottomNavItem(
              icon: Icons.home_outlined,
              label: 'Home',
              isActive: false,
            ),
            _BottomNavItem(
              icon: Icons.receipt_long_outlined,
              label: 'Transactions',
              isActive: false,
            ),
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: Color(0xFF12B76A),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.qr_code,
                color: Colors.white,
                size: 28,
              ),
            ),
            _BottomNavItem(
              icon: Icons.qr_code_outlined,
              label: 'Affiliate QR',
              isActive: false,
            ),
            _BottomNavItem(
              icon: Icons.account_circle_outlined,
              label: 'Account',
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ServiceIcon({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF12B76A),
            size: 32,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;

  const _TransactionItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF12B76A).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF12B76A),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF313A4E),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              color: Color(0xFF313A4E),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? const Color(0xFF12B76A) : Colors.grey[600],
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? const Color(0xFF12B76A) : Colors.grey[600],
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}