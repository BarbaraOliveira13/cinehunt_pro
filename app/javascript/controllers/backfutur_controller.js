import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["voiture1", "voiture2"]

  connect() {
    console.log("FUTUUUR");

    // Enregistrer l'URL précédente lors du chargement de la page
    this.previousPath = sessionStorage.getItem("previousPath");
  }

  test() {
    console.log("yyyeees");
    this.voiture1Target.classList.add("d-none");
    this.voiture2Target.classList.remove("d-none");

    setTimeout(() => {

      // Utiliser l'URL précédente pour la redirection
      window.location.href = this.previousPath || '/scenes';

      window.history.go(-1);

    }, 300);
  }
}
