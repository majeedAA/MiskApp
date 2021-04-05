class Cardd {
  final String idCustomer;
  final String idMarket;
  final String idDriver;
  final String nameOfItem;
  final int quantity;
  final double price;
  final double totalprice;
  final String idOfCart;

  Cardd(
      {this.idCustomer,
      this.idMarket,
      this.idDriver,
      this.nameOfItem,
      this.quantity,
      this.price,
      this.totalprice,
      this.idOfCart});
}

class CardData {
  final String idCustomer;
  final String idMarket;
  final String idDriver;
  final String nameOfItem;
  final double quantity;
  final double price;
  final double totalprice;
  CardData(
      {this.idCustomer,
      this.idMarket,
      this.idDriver,
      this.nameOfItem,
      this.quantity,
      this.price,
      this.totalprice});
}
