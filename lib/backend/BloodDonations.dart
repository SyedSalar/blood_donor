class BloodDonation {
  final int id;
  final String name;

  const BloodDonation({required this.id, required this.name});
}

List<BloodDonation> bloodDonation = const [
  BloodDonation(id: 0, name: "Blood"),
  BloodDonation(id: 1, name: "Power Red"),
  BloodDonation(id: 2, name: "Platelets"),
  BloodDonation(id: 3, name: "AB Plasma"),
];
