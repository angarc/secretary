import { Controller } from "stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = [ "deadlineInput", "durationInput" ]

  connect() {
    flatpickr(this.deadlineInputTarget, {
      minDate: "today",
      enableTime: true
    })

    flatpickr(this.durationInputTarget, {
      enableTime: true,
      noCalendar: true,
      dateFormat: "G:i",
      time_24hr: true,
      defaultHour: 0
    })
  }
}
