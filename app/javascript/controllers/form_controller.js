import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["rfid", "scannerPlaceholder"]

  handleScan(event, placeholder, input, submitAfterScan) {
    if (this.rfid_value == undefined) this.rfid_value = ""
    if (event.key === 'Enter') {
      event.preventDefault()
      placeholder.classList.add("d-none")
      input.value = this.rfid_value
      this.rfid_value = ""
      document.getElementById("rfid_input_placeholder")?.classList.remove("d-none")
      document.onkeydown = null

      if (submitAfterScan) input.closest("form").requestSubmit()
    }
    else {
      this.rfid_value += event.key
    }
  }

  scanRfid(event) {
    if (event.preventDefault) event.preventDefault()
    console.log(event)
    const { placeholderId, inputId, submitAfterScan } = event.target.dataset
    const placeholder = document.getElementById(placeholderId)
    const input = document.getElementById(inputId)

    placeholder.classList.remove("d-none")

    document.onkeydown = (event) => this.handleScan(event, placeholder, input, submitAfterScan)
  }
}
