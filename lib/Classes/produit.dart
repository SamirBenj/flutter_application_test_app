class Produit {
  String categorie;
  String nomProduit;
  int prix;
  String imageProduit;
  bool valeurBool;
  String description;

  Produit(
    this.categorie,
    this.nomProduit,
    this.prix,
    this.imageProduit,
    this.valeurBool,
    this.description,
  ) {
    this.nomProduit = nomProduit;
    this.prix = prix;
    this.imageProduit = imageProduit;
    this.valeurBool = valeurBool;
    this.description = description;
  }
}
