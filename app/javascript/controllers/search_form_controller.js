import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-form"
export default class extends Controller {
  static targets = ["form", "category",
    "craft", "input"]

  connect() {
    console.log("in the search-form")
  }

  update() {
    if (this.categoryTarget.value == "Services") {
      const serviceURL = this.formTarget.baseURI + "services"
      this.formTarget.action = serviceURL
    }
  }

  update_with_img() {
    // console.log("this is update!")
    setTimeout(() => {
      const activeImg = this.craftTarget.querySelector(".active")
      const activeDiv = activeImg.getElementsByTagName("div")[0]
      const activeHeader = activeDiv.getElementsByTagName("h5")[0].innerText

      this.inputTarget.value = activeHeader
      console.log(this.inputTarget.value)
      // console.log(activeHeader)
      // fetch(){

      // }

    }, 1000);

  }
}
