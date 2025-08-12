import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700;

    const backgroundGradient = LinearGradient(
      colors: [Color(0xFF0E27A1), Color(0xff030A2E)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    const green = Color(0xFF32D583);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
       
        backgroundColor: Colors.transparent,
        elevation: 0,
     
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: backgroundGradient,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
            child: Column(
              children: [
                // Logo y título en contenedor
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/image/logo.png',
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: isSmallScreen ? 20 : 32),
                      // Título
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'dCoin',
                            style: TextStyle(
                              color: green,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '\$300,00',
                            style: TextStyle(
                              color: green,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Saldo actual',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                // Botones principales
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: isSmallScreen ? 1.4 : 1.3,
                    children: [
                      _HomeButton(
                        icon: Icons.qr_code_2,
                        label: 'Paga QR',
                        color: green,
                        isSmallScreen: isSmallScreen,
                        onTap: () {},
                      ),
                      _HomeButton(
                        icon: Icons.upload_rounded,
                        label: 'Recargar',
                        color: green,
                        isSmallScreen: isSmallScreen,
                        onTap: () {},
                      ),
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
                // Botón Vista Avanzada
                // Container(
                //   width: double.infinity,
                //   height: isSmallScreen ? 50 : 56,
                //   decoration: BoxDecoration(
                //     color: Colors.white.withOpacity(0.08),
                //     borderRadius: BorderRadius.circular(28),
                //     border: Border.all(
                //       color: Colors.white.withOpacity(0.15),
                //       width: 1,
                //     ),
                //   ),
                //   child: Material(
                //     color: Colors.transparent,
                //     child: InkWell(
                //       borderRadius: BorderRadius.circular(28),
                //       onTap: () {},
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Icon(
                //             Icons.person_outline,
                //             color: green,
                //             size: isSmallScreen ? 20 : 24,
                //           ),
                //           const SizedBox(width: 12),
                //           Text(
                //             'Vista avanzada',
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontSize: isSmallScreen ? 14 : 16,
                //               fontWeight: FontWeight.w500,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
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
