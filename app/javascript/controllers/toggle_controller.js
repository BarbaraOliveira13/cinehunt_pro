import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "togglableElement2", "togglableElement3"]
  connect() {
    console.log("data")
  }
  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
    this.togglableElement2Target.classList.toggle("d-none");
    this.togglableElement3Target.classList.toggle("d-none");
  }
}
