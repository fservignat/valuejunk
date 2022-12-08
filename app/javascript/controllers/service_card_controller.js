import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="service-card"
export default class extends Controller {
  static targets = ["address", "card_address",
    "craft", "card_craft",
    "description", "card_description",
    "price", "card_price",
    "speciality", "card_speciality"]


  connect() {
    // console.log("connected")
    // console.log(this.specialityTarget)
  }

  update_craft() {
    this.card_craftTarget.innerHTML = this.craftTarget.value;
  }

  update_address() {
    this.card_addressTarget.innerHTML = this.addressTarget.value;
  }

  update_description() {

    var text_length = (this.descriptionTarget.value.length);
    this.card_descriptionTarget.innerHTML =
      `\"${this.descriptionTarget.value.slice(0, 200)}\"` + (text_length > 250 ? "..." : "");

  }

  update_price() {
    this.card_priceTarget.innerHTML = `${this.priceTarget.value} €/hr`;
  }

  update_speciality() {

    let num_tags = document.querySelectorAll(".item-label").length;
    let tag_item = "";
    let final_innerHTML = "";

    for (let i = 0; i < num_tags; i++) {
      tag_item = `<a class="speciality-btn">
        ${document.querySelectorAll(".item-label")[i].outerText}</a>`

      //limit the number of tags shown in the card
      if (i < 3) {
        final_innerHTML += tag_item;
      } else {
        final_innerHTML += (i == 3 ? "..." : ``);
      }
    }

    this.card_specialityTarget.innerHTML = final_innerHTML;

  }
}
