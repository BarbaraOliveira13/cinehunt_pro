import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['modal'];
  connect() {
    console.log('coeur');
  }

  showModal() {
    this.modalTarget.modal("show");
  }
}
