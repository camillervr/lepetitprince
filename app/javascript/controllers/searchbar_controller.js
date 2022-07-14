import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searchbar"
export default class extends Controller {
  static targets = ["form", "input", "coucou"]

  connect() {
    console.log("Youhou")
    console.log(this.formTarget)
    console.log(this.inputTarget)
    console.log(this.coucouTarget)
  }

  update() {
    console.log("Update")

    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.coucouTarget.outerHTML = data
      })
  }
}
