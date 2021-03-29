class Item {
  final String id;
  final String name;
  final String sity;
  final String email;
  final int phone;
  final bool isCustomer;
  final bool isMarket;
  final bool isDriver;
  final bool isAdmin;
  final bool isActive;
  final String image;

  Item(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.sity,
      this.isCustomer,
      this.isMarket,
      this.isDriver,
      this.isAdmin,
      this.isActive,
      this.image});
}
