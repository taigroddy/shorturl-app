// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import '../stylesheets/application'

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "channels"

Rails.start()
Turbolinks.start()

// Jquery
require('jquery')
require('popper.js')

// Bootstrap 4
require('bootstrap')

// Datatables
require('datatables.net-bs4')
require('datatables.net-autofill-bs4')
require('datatables.net-buttons-bs4')
require('datatables.net-fixedcolumns-bs4')
require('datatables.net-fixedheader-bs4')
