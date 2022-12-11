import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-form"
export default class extends Controller {
  static targets = ["form", "category",
    "craft", "input", "cards"]

  connect() {
    console.log("in the search-form")
    // console.log(this.cardsTarget.innerHTML)
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
      const activeHeader = activeDiv.getElementsByTagName("h5")[0].id
      const serviceURL = this.formTarget.baseURI
      const url = `${serviceURL}?category=Services&query=${activeHeader}&location=&query_min_price=&query_max_price=`
      console.log("url reporting")
      // console.log(url)
      // this.inputTarget.value = activeHeader
      // console.log(this.inputTarget.value)
      // console.log(this.formTarget.action)
      // console.log(activeHeader)
      fetch(url, {
        headers: { "Accept": "text/plain" }
      })
        .then(response => response.text())
        .then(data => {
          this.cardsTarget.outerHTML = data
        })


    }, 1000);

  }
}
