// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import { Notyf } from "notyf"
import "../stylesheets/dashboard.scss"


document.addEventListener('DOMContentLoaded', function () {
  var notyf = new Notyf({position: {x: 'right', y: 'top'}});
  const toast = (type, message) => {
    if (type === "success") {
      notyf.success(message);
    } else if (type === "danger") {
      notyf.error(message);
    }
  }

  window.toast = toast;
});






