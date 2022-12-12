import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="heart"
export default class extends Controller {
  connect() {
    console.log("hello")
  }
  updateHeart(event) {
    // if ( (this).hasClass("heart-red") ) {
    //   (this).removeClass('heart-red');
    // } else {
    //   ('li .heart-red').removeClass('heart-red');
    //   (this).addClass('heart-red');
    (this.element).toggleClass('heart-red')
  }
}
