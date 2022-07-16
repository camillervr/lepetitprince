import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searchbar"
export default class extends Controller {
  static targets = ["form", "input", "list"]

  connect() {
    console.log("Youhou")
    console.log(this.formTarget)
    console.log(this.inputTarget)
    console.log(this.listTarget)
  }

  update() {
    console.log("Update")

    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
  }
}
