import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

// Connects to data-controller="image-expand"
export default class extends Controller {
  connect() {
    Turbo.session.drive = false

    const modal = document.getElementById("myModal");
    const images = document.querySelectorAll(".small-image")

    if (images) {
      // Get the image and insert it inside the modal - use its "alt" text as a caption
      const img = document.getElementById("myImg");
      const modalImg = document.getElementById("img01");
      const captionText = document.getElementById("caption");
      images.forEach((image) => {
        image.addEventListener("click", (event) => {
          modal.style.display = "block";
          modalImg.src = event.target.src;
        })
      })


      // Get the <span> element that closes the modal
      const span = document.getElementsByClassName("close")[0];
      if (span) {
        // When the user clicks on <span> (x), close the modal
        span.addEventListener("click", (event) => {
          modal.style.display = "none";
        })
      }
    }
  }

  disconnect() {
    Turbo.session.drive = true
  }
}
