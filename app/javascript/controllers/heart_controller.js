import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="heart"
export default class extends Controller {
  connect() {
    console.log("hello")
  }
  updateHeart(event) {
    // if ( this.element.include?("heart-red") ) {
    //   this.element.classList.remove('heart-red');
    // } else {
    //   this.element.classList.add('heart-red');

      // (this).addClass('heart-red');
    // console.log(event)
    // (this.element).classList.toggle('heart-red')
  // }

  if (this.element.classList.contains("fa-regular")) {
    this.element.classList.remove("fa-regular")
    this.element.classList.add("fa-solid")
  } else {
    this.element.classList.remove("fa-solid")
    this.element.classList.add("fa-regular")
  }
}
}
