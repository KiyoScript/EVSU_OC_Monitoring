// app/javascript/controllers/clock_controller.js
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clock"
export default class extends Controller {
  static targets = ["time"]

  connect() {
    this.updateClock()
    this.timer = setInterval(() => {
      this.updateClock()
    }, 1000)
  }

  disconnect() {
    clearInterval(this.timer)
  }

  updateClock() {
    const now = new Date()
    let hours = now.getHours()
    const minutes = String(now.getMinutes()).padStart(2, '0')
    const seconds = String(now.getSeconds()).padStart(2, '0')
    const ampm = hours >= 12 ? 'PM' : 'AM'
    hours = hours % 12
    hours = hours ? hours : 12
    hours = String(hours).padStart(2, '0')
    this.timeTarget.textContent = `${hours}:${minutes}:${seconds} ${ampm}`
  }
}
