import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
    this.element.classList.remove("navbar-custom-color")
  }
  updateNavbar() {
    if (window.scrollY >= window.innerHeight) {
      this.element.classList.add("navbar-custom-color")
    } else {
      this.element.classList.remove("navbar-custom-color")
    }
  }
}
