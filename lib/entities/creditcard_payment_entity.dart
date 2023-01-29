class CreditCardPaymentEntity {
  String? cardNumber;
  String? cardName;
  String? CVV;
  String?  expiryDate;

  CreditCardPaymentEntity({this.cardName, this.cardNumber, this.CVV, this.expiryDate});
}