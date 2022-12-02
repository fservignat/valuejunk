import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-form"
export default class extends Controller {
  static targets = ["form", "category"]
  connect() {

  }

  update() {
    if (this.categoryTarget.value == "Services") {
      const serviceURL = this.formTarget.baseURI + "services"
      this.formTarget.action = serviceURL
    }
  }

}
