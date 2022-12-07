import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="junk-card"
export default class extends Controller {
  static targets = ["title", "card_title",
    "price", "card_price",
    "address", "card_address",
    "photo", "card_photo"]

  connect() {
    // console.log("junk connected");
    // console.log(this.photoTarget);
  }

  update_title() {
    console.log("inside title")
    this.card_titleTarget.innerHTML = this.titleTarget.value;
  }

  update_address() {
    // short_address = this.addressTarget.value.split(", ")[1];
    // console.log(short_address)
    // console.log(this.addressTarget.innerHTML)
    this.card_addressTarget.innerHTML = this.addressTarget.value;
  }

  update_price() {
    // console.log("inside price")
    // console.dir(this.card_priceTarget)
    this.card_priceTarget.innerHTML = `${this.priceTarget.value}€`;
  }

  update_photo() {

    console.log("inside photo")
    console.log(this.photoTarget)
  }

}
