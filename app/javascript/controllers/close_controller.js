import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["name", "profileCard"]
  connect() {
    if(this.hasNameTarget){
      this.hide()
    }
  }
  hide() {
    setTimeout(()=> {
      this.nameTarget.classList.toggle("hidden")
    }, 2000)
  }
  profileCardToggle() {
    this.profileCardTarget.classList.toggle("hidden")
  }
}
