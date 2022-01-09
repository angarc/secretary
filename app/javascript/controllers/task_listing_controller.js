import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "editButton", "container", "editForm" ]

  connect() {
  }

  editButtonPressed() {
    this.containerTarget.innerHTML = this.editFormTarget.innerHTML;
  }
}
