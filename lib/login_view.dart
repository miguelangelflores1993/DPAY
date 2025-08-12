import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
              return SizedBox(
                height: constraints.maxHeight,
                child: Column(
                  children: [
                    // Espaciado superior
                    SizedBox(height: constraints.maxHeight * 0.15),
                    // Logo
                    Image.asset(
                      'assets/logo.png',
                      height: isSmallScreen ? 100 : 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: isSmallScreen ? 60 : 80),
                    // Título
                    Text(
                      'Punto de venta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isSmallScreen ? 32 : 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Espaciado flexible
                    SizedBox(height: constraints.maxHeight * 0.25),
                    // Botón Crear cuenta
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.08,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: isSmallScreen ? 56 : 64,
                        decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(32),
                            onTap: () {
                              // Navegar a crear cuenta
                            },
                            child: Center(
                              child: Text(
                                'Crear cuenta',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: isSmallScreen ? 16 : 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 24 : 32),
                    // Botón Iniciar sesión
                    GestureDetector(
                      onTap: () {
                        // Navegar a iniciar sesión
                      },
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isSmallScreen ? 16 : 18,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ),
                    // Espaciado inferior
                    SizedBox(height: constraints.maxHeight * 0.1),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}