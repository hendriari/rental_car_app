class Payment {
  String image;
  String name;

  Payment({
    required this.image,
    required this.name,
  });
}

var paymentMetode = [
  Payment(
    image: 'images/payment/mastercard.png',
    name: 'Bank Transfer',
  ),Payment(
    image: 'images/payment/dana.png',
    name: 'Dana',
  ),Payment(
    image: 'images/payment/ovo.png',
    name: 'Ovo',
  ),Payment(
    image: 'images/payment/spay.png',
    name: 'Shopeepay',
  ),
];