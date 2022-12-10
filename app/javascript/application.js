// Entry point for the build script in your package.json
import { Turbo } from "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"


// Get the modal
const modal = document.getElementById("myModal");
const images = document.querySelectorAll(".small-image")
console.log(images)
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
  console.log(span)
  if (span) {
    // When the user clicks on <span> (x), close the modal
    span.addEventListener("click", (event) => {
      modal.style.display = "none";
    })
  }
}

Turbo.session.drive = false
