import 'package:app/advancedview.dart';
import 'package:app/cashpayment_view.dart';
import 'package:app/paymentlink_view.dart';
import 'package:app/qrcharge_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:show_up_animation/show_up_animation.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const green = Color(0xFF32D583);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700 || size.width < 380;

    // Responsive paddings and font sizes
    final horizontalPadding = isSmallScreen ? 10.0 : 20.0;
    final verticalPadding = isSmallScreen ? 10.0 : 20.0;
    final headerFontSize = isSmallScreen ? 24.0 : 32.0;
    final coinFontSize = 36.0;
    final gridSpacing = isSmallScreen ? 10.0 : 16.0;
    final gridAspectRatio = isSmallScreen ? 1.2 : 1.6;
    final cardHeight = isSmallScreen ? 110.0 : 140.0;
    final cardItemHeight = isSmallScreen ? 60.0 : 80.0;

    const backgroundGradient = RadialGradient(
      colors: [
        Color(0XFF0E27A1),
        Color(0XFF030A2E),
      ],
      center: Alignment.topCenter,
      radius: 1.5,
    );

    return Scaffold(
      backgroundColor: const Color(0XFF030A2E),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(gradient: backgroundGradient),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Encabezado
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20).copyWith(top: kToolbarHeight),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.06),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                        border: Border.symmetric(
                          horizontal: BorderSide(color: Colors.white.withOpacity(0.2), width: 1),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white.withOpacity(0.06), width: 1),
                                  color: Colors.white.withOpacity(0.06),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.person, color: Colors.white),
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/image/dpay_logo.svg',
                                width: 80,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white.withOpacity(0.06), width: 1),
                                  color: Colors.white.withOpacity(0.06),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.headphones, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: isSmallScreen ? 8 : 10,
                              horizontal: isSmallScreen ? 8 : 16,
                            ),
                      
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: isSmallScreen ? 12 : 18),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/image/Union.svg',
                                      width: 24,
                                      height: 24,
                                    ),
                                    Text(
                                      '300.00',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: coinFontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Saldo dCoin',
                                  style: TextStyle(
                                    color: Color(0xffD5D7DA),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                            SizedBox(height: isSmallScreen ? 8 : 12),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.06),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
                            ),
                            child: Row(
                              spacing: 12,
                              children: [
                                Icon(
                                  Icons.arrow_upward,
                                  color: green,
                                  size: 32,
                                ),
                                Text(
                                  'Recargar',
                                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.06),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
                            ),
                            child: Row(
                              spacing: 12,
                              children: [
                                Icon(
                                  Icons.arrow_downward_outlined,
                                  color: green,
                                  size: 32,
                                ),
                                Text(
                                  'Retirar',
                                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                        ],
                      ),
                    ),
                
                  
                    // Grid de botones
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: gridSpacing,
                        crossAxisSpacing: gridSpacing,
                        childAspectRatio: gridAspectRatio,
                        children: [
                          _HomeButton(
                            icon: Icons.qr_code_scanner,
                            label: 'Paga dPay',
                            color: green,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const QrChargeView(),
                                ),
                              );
                            },
                            isSmallScreen: isSmallScreen,
                          ),
                          _HomeButton(
                            icon: Icons.qr_code,
                            label: 'Paga dPay',
                            color: green,
                            onTap: () => context.push('/qr'),
                            isSmallScreen: isSmallScreen,
                          ),
                          _HomeButton(
                            icon: Icons.link,
                            label: 'Link de pagos',
                            color: green,
                            onTap: () {},
                            isSmallScreen: isSmallScreen,
                          ),
                          _HomeButton(
                            icon: Icons.qr_code,
                            label: 'Cobro QR',
                            color: green,
                            onTap: () {},
                            isSmallScreen: isSmallScreen,
                          ),
                          _HomeButton(
                            icon: Icons.credit_card,
                            label: 'Paga Tarjeta',
                            color: green,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PaymentLinkView(),
                                ),
                              );
                            },
                            isSmallScreen: isSmallScreen,
                          ),
                          _HomeButton(
                            icon: Icons.credit_card,
                            label: 'Cobro Tarjeta',
                            color: green,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CashPaymentView(),
                                ),
                              );
                            },
                            isSmallScreen: isSmallScreen,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 16 : 24),
                
                    // Cards apiladas
                    Container(
                      height: cardHeight,
                      child: Stack(
                        children: [
                          // Card de Transacciones
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            child: GestureDetector(
                              onTap: () => _showTransactionsSheet(context),
                              child: Container(
                                height: cardItemHeight,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    isSmallScreen ? 12 : 20,
                                    isSmallScreen ? 12 : 20,
                                    isSmallScreen ? 12 : 20,
                                    isSmallScreen ? 8 : 16,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.swap_vert,
                                        color: Color(0xFF313A4E),
                                        size: isSmallScreen ? 20 : 24,
                                      ),
                                      SizedBox(width: isSmallScreen ? 8 : 12),
                                      Expanded(
                                        child: Text(
                                          'Transacciones',
                                          style: TextStyle(
                                            color: Color(0xFF313A4E),
                                            fontSize: isSmallScreen ? 15 : 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Ver todo',
                                        style: TextStyle(
                                          color: Color(0xFF313A4E),
                                          fontSize: isSmallScreen ? 13 : 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: isSmallScreen ? 6 : 8),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF313A4E),
                                        size: isSmallScreen ? 13 : 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Card de Vista avanzada
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: const Duration(milliseconds: 800),
                                    pageBuilder: (context, animation, secondaryAnimation) {
                                      return ShowUpAnimation(
                                        delayStart: const Duration(milliseconds: 50),
                                        animationDuration: const Duration(milliseconds: 700),
                                        curve: Curves.easeOut,
                                        direction: Direction.vertical,
                                        offset: -0.5,
                                        child: const AdvancedView(),
                                      );
                                    },
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      final slideAnimation = Tween<Offset>(
                                        begin: const Offset(0, 1),
                                        end: Offset.zero,
                                      ).animate(animation);
                
                                      return SlideTransition(
                                        position: slideAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                height: cardItemHeight,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF3B4252),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 12,
                                      offset: Offset(0, 6),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    isSmallScreen ? 12 : 20,
                                    isSmallScreen ? 8 : 16,
                                    isSmallScreen ? 12 : 20,
                                    isSmallScreen ? 12 : 20,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.grid_view,
                                        color: Colors.white,
                                        size: isSmallScreen ? 18 : 24,
                                      ),
                                      SizedBox(width: isSmallScreen ? 8 : 12),
                                      Expanded(
                                        child: Text(
                                          'Vista avanzada',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: isSmallScreen ? 15 : 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Ver todo',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: isSmallScreen ? 13 : 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: isSmallScreen ? 6 : 8),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white70,
                                        size: isSmallScreen ? 13 : 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 14 : 140),
                
                    // Texto de contacto
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: '¿Necesitas ayuda? ',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: isSmallScreen ? 11 : 14,
                          ),
                          children: [
                            TextSpan(
                              text: 'Contáctanos',
                              style: TextStyle(
                                color: green,
                                fontWeight: FontWeight.bold,
                                fontSize: isSmallScreen ? 11 : 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).padding.bottom + (isSmallScreen ? 10 : 16)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showTransactionsSheet(BuildContext context) {
    // ignore: inference_failure_on_function_invocation
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(
                      children: [
                        Icon(Icons.swap_vert, color: Color(0xFF313A4E), size: 28),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Transacciones',
                                style: TextStyle(
                                  color: Color(0xFF313A4E),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Últimos movimientos',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(24),
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.close, color: Colors.black54, size: 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      children: const [
                        _TransactionListItem(
                          icon: Icons.coffee,
                          title: 'Compra',
                          subtitle1: 'Payment ID: 1234',
                          subtitle2: 'Motivo: dCafé',
                          amount: 'Bs 10,00',
                          amountColor: Color(0xFF313A4E),
                        ),
                        _TransactionListItem(
                          icon: Icons.qr_code_2,
                          title: 'Pago por QR',
                          subtitle1: 'Payment ID: 1234',
                          subtitle2: 'Cliente: Juan Pérez',
                          amount: 'Bs -150,00',
                          amountColor: Colors.red,
                        ),
                        _TransactionListItem(
                          icon: Icons.link,
                          title: 'Link de pago',
                          subtitle1: 'Payment ID: 1234',
                          subtitle2: 'Cliente: Juan Pérez',
                          amount: 'Bs 5.000,00',
                          amountColor: Color(0xFF313A4E),
                        ),
                        _TransactionListItem(
                          icon: Icons.money,
                          title: 'Pago en efectivo',
                          subtitle1: 'Payment ID: 1234',
                          subtitle2: '',
                          amount: 'Bs 40,00',
                          amountColor: Color(0xFF313A4E),
                        ),
                        _TransactionListItem(
                          icon: Icons.link,
                          title: 'Link de pago',
                          subtitle1: 'Payment ID: 1234',
                          subtitle2: 'Cliente: Juan Pérez',
                          amount: 'Bs 5.000,00',
                          amountColor: Color(0xFF313A4E),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _HomeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  final bool isSmallScreen;

  const _HomeButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
    this.isSmallScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.06),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: isSmallScreen ? 28 : 32),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StaticCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _StaticCard({
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(icon, color: Colors.black87, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Text(
                  'Ver todo',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
              ],
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;

  const _TransactionItem({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.receipt, color: Colors.black87, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: amountColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _AdvancedViewItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _AdvancedViewItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.black87, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}

// Modal transaction item
class _TransactionListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String amount;
  final Color amountColor;

  const _TransactionListItem({
    required this.icon,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.amount,
    required this.amountColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Color(0xFF313A4E), size: 24),
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
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      subtitle1,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    if (subtitle2.isNotEmpty)
                      Text(
                        subtitle2,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                  ],
                ),
              ),
              Text(
                amount,
                style: TextStyle(
                  color: amountColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey.shade300,
          height: 0,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }
}

// Cards apiladas estilo diseño
class _StackedCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Color textColor;
  final Color trailingColor;
  final List<Widget> children;
  final VoidCallback? onTap;
  final BorderRadius borderRadius;

  const _StackedCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.textColor,
    required this.trailingColor,
    required this.children,
    this.onTap,
    this.borderRadius = const BorderRadius.all(Radius.circular(24)),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                children: [
                  Icon(icon, color: textColor, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    'Ver todo',
                    style: TextStyle(
                      color: trailingColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.arrow_forward_ios, color: trailingColor, size: 20),
                ],
              ),
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}
