import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  final Color color;
  final String cardExpiration;
  final String cardHolder;
  final String cardNumber;
  final String cardType;

  const CreditCard({
    super.key,
    required this.cardExpiration,
    required this.cardHolder,
    required this.cardNumber,
    required this.cardType,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Número de tarjeta de crédito: $cardNumber',
      button: true,
      child: Card(
        elevation: 4.0,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Container(
          height: 200,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _CreditCardHeader(
                cardTye: cardType,
              ),
              ExcludeSemantics(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    cardNumber,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontFamily: 'CourrierPrime',
                    ),
                  ),
                ),
              ),
              _CreditCardFooter(
                cardHolder: cardHolder,
                cardExpiration: cardExpiration,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CreditCardHeader extends StatelessWidget {
  final String cardTye;
  const _CreditCardHeader({
    required this.cardTye,
  });

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/contact_less.png",
            height: 20,
            width: 18,
            semanticLabel: 'Tarjeta de crédito con chip',
          ),
          Image.asset(
            "assets/images/$cardTye.png",
            height: 50,
            width: 50,
            semanticLabel: 'Tarjeta de crédito $cardTye',
          ),
        ],
      ),
    );
  }
}

class _CreditCardFooter extends StatelessWidget {
  const _CreditCardFooter({
    required this.cardHolder,
    required this.cardExpiration,
  });

  final String cardHolder;
  final String cardExpiration;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Semantics(
            label: 'Dueño de la tarjeta: $cardHolder',
            child: _buildDetailsBlock(
              label: 'CARDHOLDER',
              value: cardHolder,
            ),
          ),
          Semantics(
            label: 'Válida hasta: $cardExpiration',
            child: _buildDetailsBlock(
              label: 'VALID THRU',
              value: cardExpiration,
            ),
          ),
        ],
      ),
    );
  }
}

// Build Column containing the cardholder and expiration information
Widget _buildDetailsBlock({required String label, required String value}) {
  return ExcludeSemantics(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
