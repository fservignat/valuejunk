import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="service-card"
export default class extends Controller {
  static targets = ["address", "card_address",
    "craft", "card_craft",
    "description", "card_description",
    "price", "card_price",
    "speciality", "card_speciality"]


  connect() {
    console.log("connected")
    // console.log(this.card_craftTarget)
    // console.log(this.card_addressTarget)
    // console.log(this.priceTarget)
    console.log(this.specialityTarget)
  }

  update_craft() {
    // console.log("inside craft")
    // console.log(this.craftTarget.value)
    this.card_craftTarget.innerHTML = this.craftTarget.value;
  }

  update_address() {
    // console.log("inside address")
    // console.log(this.addressTarget.value)
    this.card_addressTarget.innerHTML = this.addressTarget.value;
  }

  update_description() {
    // console.log(this.descriptionTarget.value)
    var text_length = (this.descriptionTarget.value.length);
    // let main_text = `\"${this.descriptionTarget.value.substring(0, 250)} ...\"`;
    // // let final_text = main_text + (text_length > 250) && ("...");
    this.card_descriptionTarget.innerHTML =
      `\"${this.descriptionTarget.value.slice(0, 200)}\"` + (text_length > 250 ? "..." : "");
    // tt = (text_length > 250) && ("...")
    // console.log(text_length > 20 && "....");
  }

  update_price() {
    // console.log(this.priceTarget.value)
    this.card_priceTarget.innerHTML = `${this.priceTarget.value} €/hr`;
  }

  update_speciality() {
    console.log("inside speciality")
    // console.dir(this.specialityTarget)
    // console.log(document.querySelectorAll(".item-label")[1].outerText)
    // console.log(this.card_specialityTarget)
    let num_tags = document.querySelectorAll(".item-label").length;
    let tag_item = "";
    let final_innerHTML = "";

    for (let i = 0; i < num_tags; i++) {
      tag_item = `<a class="speciality-btn">
        ${document.querySelectorAll(".item-label")[i].outerText}</a>`

      if (i < 3) {
        final_innerHTML += tag_item;
      } else {
        final_innerHTML += (i == 3 ? "..." : ``);
      }
    }

    this.card_specialityTarget.innerHTML = final_innerHTML;

  }
}