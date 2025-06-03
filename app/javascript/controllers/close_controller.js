import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["name"]
  connect() {
    this.hide()
  }
  hide() {
    setTimeout(()=> {
      this.nameTarget.classList.toggle("hidden")
    }, 2000)
  }
}
