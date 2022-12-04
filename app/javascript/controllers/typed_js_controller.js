import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["all you can do with a bit of Junk."],
      typeSpeed: 50,
      loop: false
    })
  }
}
