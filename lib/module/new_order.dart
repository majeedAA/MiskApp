class NewOrder {
  final List allOrder;
  final String customerId;
  final String marketId;
  final String pay;
  final String notis;
  final String time;
  final bool driveIt;
  final double total;
  final String idOfOrder;
  final bool state;
  final bool accept;
  final bool tikeIt;
  final bool toDriver;
  final bool ready;
  final bool tikeItDriver;
  final String driverId;

  NewOrder(
      {this.allOrder,
      this.customerId,
      this.marketId,
      this.pay,
      this.notis,
      this.time,
      this.driveIt,
      this.total,
      this.idOfOrder,
      this.state,
      this.accept,
      this.tikeIt,
      this.toDriver,
      this.ready,
      this.tikeItDriver,
      this.driverId});
}

class NewOrderData {
  final List allOrder;
  final String customerId;
  final String marketId;
  final String pay;
  final String notis;
  final String time;
  final bool driveIt;
  final double total;
  final String idOfOrder;
  final bool state;
  final bool accept;
  final bool tikeIt;
  final bool toDriver;
  final bool tikeItDriver;
  final String driverId;
  NewOrderData(
      {this.allOrder,
      this.customerId,
      this.marketId,
      this.pay,
      this.notis,
      this.time,
      this.driveIt,
      this.total,
      this.idOfOrder,
      this.state,
      this.accept,
      this.tikeIt,
      this.toDriver,
      this.tikeItDriver,
      this.driverId});
}
