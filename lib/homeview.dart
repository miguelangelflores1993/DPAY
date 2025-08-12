import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700;
    
    const backgroundGradient = LinearGradient(
      colors: [Color(0xFF1E3A8A), Color(0xFF1E40AF)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    const green = Color(0xFF10B981);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: backgroundGradient,
        ),
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        SizedBox(height: isSmallScreen ? 24 : 40),
                        // Logo
                        Image.asset(
                          'assets/logo.png',
                          height: isSmallScreen ? 60 : 80,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: isSmallScreen ? 20 : 32),
                        // Título
                        Text(
                          'Venta rápida',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isSmallScreen ? 28 : 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: isSmallScreen ? 32 : 48),
                        // Botones principales
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.06, // Responsivo basado en ancho
                          ),
                          child: GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: isSmallScreen ? 1.4 : 1.3,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              _HomeButton(
                                icon: Icons.qr_code_2,
                                label: 'Cobro QR',
                                color: green,
                                isSmallScreen: isSmallScreen,
                                onTap: () {},
                              ),
                              _HomeButton(
                                icon: Icons.link,
                                label: 'Link de pagos',
                                color: green,
                                isSmallScreen: isSmallScreen,
                                onTap: () {},
                              ),
                              _HomeButton(
                                icon: Icons.credit_card,
                                label: 'Tap Tarjeta',
                                color: green,
                                isSmallScreen: isSmallScreen,
                                onTap: () {},
                              ),
                              _HomeButton(
                                icon: Icons.account_balance_wallet_outlined,
                                label: 'Pago en efectivo',
                                color: green,
                                isSmallScreen: isSmallScreen,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        // Botón Vista Avanzada
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.06,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: isSmallScreen ? 50 : 56,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.15),
                                width: 1,
                              ),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(28),
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.person_outline,
                                      color: green,
                                      size: isSmallScreen ? 20 : 24,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Vista avanzada',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: isSmallScreen ? 14 : 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: isSmallScreen ? 16 : 24),
                        // Ayuda
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: isSmallScreen ? 20 : 32,
                          ),
                          child: RichText(
                            text: TextSpan(
                              text: '¿Necesitas ayuda? ',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: isSmallScreen ? 13 : 14,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Contáctanos',
                                  style: TextStyle(
                                    color: green,
                                    fontWeight: FontWeight.w600,
                                    fontSize: isSmallScreen ? 13 : 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool isSmallScreen;
  final VoidCallback onTap;

  const _HomeButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.isSmallScreen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color,
                size: isSmallScreen ? 28 : 32,
              ),
              SizedBox(height: isSmallScreen ? 8 : 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: isSmallScreen ? 13 : 15,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}