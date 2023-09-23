import 'package:accessability_demo_google_io/presentation/widgets/credit_card.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class BankScreen extends StatefulWidget {
  const BankScreen({Key? key}) : super(key: key);

  @override
  State<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  final ScrollController _scrollController = ScrollController();
  late bool _showAdditionalInfo = false;

  final double threshold = 200;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > threshold && !_showAdditionalInfo) {
      setState(() {
        _showAdditionalInfo = true;
      });
    } else if (_scrollController.offset <= threshold && _showAdditionalInfo) {
      setState(() {
        _showAdditionalInfo = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: _CustomAppBar(showAdditionalInfo: _showAdditionalInfo),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 50,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const CreditCard(
              cardExpiration: '08/2026',
              cardHolder: 'John Doe',
              cardNumber: '3546 7532 XXXX 9742',
              cardType: 'mastercard',
              color: Color(0xFF43434F),
            );
          }
          return _BankStatements(
            index: index,
          );
        },
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    required bool showAdditionalInfo,
  }) : _showAdditionalInfo = showAdditionalInfo;

  final bool _showAdditionalInfo;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _showAdditionalInfo
          ? GestureDetector(
              child: const Icon(Icons.arrow_back_ios),
              onTap: () => Navigator.pop(context),
            )
          : null,
      title: _showAdditionalInfo
          ? const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cuenta de Ahorros'),
                Text('\$ 10,000.00'),
              ],
            )
          : null,
      backgroundColor: Colors.indigo.shade700,
    );
  }
}

class _BankStatements extends StatelessWidget {
  final int index;

  const _BankStatements({
    required this.index,
  });

  int getRandomInt(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  @override
  Widget build(BuildContext context) {
    final debitedValue = '- \$ ${getRandomInt(10, 30)}.${getRandomInt(00, 99)}';
    final creditedValue =
        '+ \$ ${getRandomInt(30, 1000)}.${getRandomInt(00, 99)}';

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.account_balance),
          title: index % 2 != 0
              ? Text('Caj/auto.ret. $index')
              : const Text('Transferencia Directa ⚡️'),
          subtitle: const Text('Detalle del movimiento'),
          trailing: index % 2 != 0
              ? Text(
                  debitedValue,
                  semanticsLabel: 'Valor debitado de la cuenta: $debitedValue',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                  ),
                )
              : Text(
                  creditedValue,
                  semanticsLabel:
                      'Valor acreditado a la cuenta: $creditedValue',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
        ),
        index != 49 ? const Divider() : Container()
      ],
    );
  }
}
