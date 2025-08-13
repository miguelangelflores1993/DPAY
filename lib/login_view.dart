import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final isSmallScreen = size.height < 700;
    final isVerySmallScreen = size.height < 600;
    
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
                physics: const ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.08,
                      vertical: _getVerticalPadding(size),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Espaciado superior
                        SizedBox(height: _getTopSpacing(size)),
                        
                        // Logo
                        Flexible(
                          child: Image.asset(
                            'assets/logo.png',
                            height: _getLogoHeight(size),
                            fit: BoxFit.contain,
                          ),
                        ),
                        
                        SizedBox(height: _getSpacing(size, isVerySmallScreen ? 30 : 50)),
                        
                        // Título
                        Flexible(
                          child: Text(
                            'Punto de venta',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _getTitleFontSize(size),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        
                        SizedBox(height: _getSpacing(size, isVerySmallScreen ? 40 : 60)),
                        
                        // Botones
                        Column(
                          children: [
                            // Botón Crear cuenta
                            _buildPrimaryButton(
                              text: 'Crear cuenta',
                              onTap: () {
                                // Navegar a crear cuenta
                              },
                              color: green,
                              size: size,
                              isSmallScreen: isSmallScreen,
                            ),
                            
                            SizedBox(height: _getSpacing(size, isVerySmallScreen ? 16 : 24)),
                            
                            // Botón Iniciar sesión
                            _buildSecondaryButton(
                              text: 'Iniciar sesión',
                              onTap: () {
                                // Navegar a iniciar sesión
                              },
                              size: size,
                              isSmallScreen: isSmallScreen,
                            ),
                          ],
                        ),
                        
                        // Espaciado inferior
                        SizedBox(height: _getBottomSpacing(size)),
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

  Widget _buildPrimaryButton({
    required String text,
    required VoidCallback onTap,
    required Color color,
    required Size size,
    required bool isSmallScreen,
  }) {
    return Container(
      width: double.infinity,
      height: _getButtonHeight(size),
      constraints: const BoxConstraints(
        maxWidth: 400, // Máximo ancho para pantallas grandes
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(32),
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: _getButtonFontSize(size),
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton({
    required String text,
    required VoidCallback onTap,
    required Size size,
    required bool isSmallScreen,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: _getButtonFontSize(size),
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white,
            decorationThickness: 1.5,
          ),
        ),
      ),
    );
  }

  double _getLogoHeight(Size size) {
    if (size.height < 600) return 70;
    if (size.height < 700) return 90;
    if (size.height < 800) return 110;
    return 130;
  }

  double _getTitleFontSize(Size size) {
    if (size.width < 360) return 24;
    if (size.height < 600) return 26;
    if (size.height < 700) return 30;
    if (size.height < 800) return 34;
    return 38;
  }

  double _getButtonHeight(Size size) {
    if (size.height < 600) return 52;
    if (size.height < 700) return 56;
    return 64;
  }

  double _getButtonFontSize(Size size) {
    if (size.height < 600) return 15;
    if (size.height < 700) return 16;
    return 18;
  }

  double _getSpacing(Size size, double baseSpacing) {
    if (size.height < 600) return baseSpacing * 0.6;
    if (size.height < 700) return baseSpacing * 0.8;
    return baseSpacing;
  }

  double _getVerticalPadding(Size size) {
    if (size.height < 600) return 16;
    if (size.height < 700) return 24;
    return 32;
  }

  double _getTopSpacing(Size size) {
    if (size.height < 600) return size.height * 0.05;
    if (size.height < 700) return size.height * 0.08;
    return size.height * 0.12;
  }

  double _getBottomSpacing(Size size) {
    if (size.height < 600) return size.height * 0.03;
    if (size.height < 700) return size.height * 0.05;
    return size.height * 0.08;
  }
}