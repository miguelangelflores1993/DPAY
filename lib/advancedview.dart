import 'package:flutter/material.dart';

class AdvancedView extends StatelessWidget {
  const AdvancedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo azul con header y grid
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff030A2E),
                  Color(0xFF0E27A1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top bar
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _CircleIcon(icon: Icons.menu),
                        Row(
                          children: [
                            _CircleIcon(icon: Icons.help_outline),
                            SizedBox(width: 12),
                            GestureDetector(
                              child: _CircleIcon(icon: Icons.close),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Saludo
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '¡Hola! Juan Pablo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Grid de servicios 4x3 - Versión mejorada
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.9,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _ServiceButton(
                            icon: Icons.qr_code,
                            label: 'Cobro QR',
                            onTap: () {},
                          ),
                          _ServiceButton(
                            icon: Icons.link,
                            label: 'Link de pagos',
                            onTap: () {},
                          ),
                          _ServiceButton(
                            icon: Icons.credit_card,
                            label: 'Tap Tarjeta',
                            onTap: () {},
                          ),
                          _ServiceButton(
                            icon: Icons.account_balance_wallet,
                            label: 'Pago en efectivo',
                            onTap: () {},
                          ),
                          _ServiceButton(
                            icon: Icons.phone_android,
                            label: 'Recargas',
                            onTap: () {},
                          ),
                          _ServiceButton(
                            icon: Icons.lightbulb_outline,
                            label: 'Servicios',
                            onTap: () {},
                          ),
                          _ServiceButton(
                            icon: Icons.account_balance,
                            label: 'Corresponsal financiero',
                            onTap: () {},
                          ),
                          const SizedBox(), // Espacio vacío para completar la cuadrícula
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // DraggableScrollableSheet para transacciones
          DraggableScrollableSheet(
            initialChildSize: 0.48,
            minChildSize: 0.2,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 16,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Transacciones',
                                style: TextStyle(
                                  color: Color(0xFF313A4E),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Viernes, 30 de enero',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Ver todo',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        children: const [
                          _TransactionItem(
                            icon: Icons.qr_code,
                            title: 'Pago por QR',
                            subtitle1: 'Payment ID: 1234',
                            subtitle2: 'Cliente: Juan Pérez',
                            amount: 'Bs 150,00',
                          ),
                          _TransactionItem(
                            icon: Icons.link,
                            title: 'Link de pago',
                            subtitle1: 'Payment ID: 1234',
                            subtitle2: 'Cliente: Juan Pérez',
                            amount: 'Bs 5.000,00',
                          ),
                          _TransactionItem(
                            icon: Icons.account_balance_wallet,
                            title: 'Pago en efectivo',
                            subtitle1: 'Payment ID: 1234',
                            subtitle2: '',
                            amount: 'Bs 40,00',
                          ),
                          _TransactionItem(
                            icon: Icons.link,
                            title: 'Link de pago',
                            subtitle1: 'Payment ID: 1234',
                            subtitle2: 'Cliente: Juan Pérez',
                            amount: 'Bs 5.000,00',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
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
            const _BottomNavItem(
              icon: Icons.home_outlined,
              label: 'Inicio',
              isActive: false,
            ),
            const _BottomNavItem(
              icon: Icons.receipt_long_outlined,
              label: 'Transacciones',
              isActive: true,
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
            const _BottomNavItem(
              icon: Icons.qr_code_outlined,
              label: 'QR afiliado',
              isActive: false,
            ),
            const _BottomNavItem(
              icon: Icons.account_circle_outlined,
              label: 'Cuenta',
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }
}

// Ícono circular para el header
class _CircleIcon extends StatelessWidget {
  final IconData icon;
  const _CircleIcon({required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }
}

// Widget para los botones de servicio - Versión mejorada
class _ServiceButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ServiceButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF12B76A),
              size: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// Ítem de transacción
class _TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String amount;

  const _TransactionItem({
    required this.icon,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF12B76A).withOpacity(0.1),
              shape: BoxShape.circle,
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
                Text(
                  subtitle1,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                  ),
                ),
                if (subtitle2.isNotEmpty)
                  Text(
                    subtitle2,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                    ),
                  ),
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

// Bottom nav
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
