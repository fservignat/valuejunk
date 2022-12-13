import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="junk-card"
export default class extends Controller {
  static targets = ["title", "card_title",
    "price", "card_price",
    "address", "card_address",
    "photo", "card_photo",
    "donation", "card_donation", "card_donation_free"]


  connect() {
    console.log("junk connected");
    console.log(this.photoTarget.value);
    console.log(this.donationTarget);
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

  update_donation() {

    // console.log("inside photo")
    // console.dir(this.card_photoTarget.src)
    // console.dir(this.card_donation_freeTarget)
    this.card_donationTarget.innerHTML = `<p class="donation">DONATION</p>`;
    this.card_priceTarget.innerHTML = `<p data-junk-card-target="card_donation_free">Free</p>`;

  }

}
