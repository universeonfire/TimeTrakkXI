import 'bootstrap' 
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("moment")
import flatpickr from "flatpickr";
require("flatpickr/dist/flatpickr.css")


document.addEventListener("turbolinks:load", () => {
    flatpickr("[data-behavior='datepickr']",{
        static: true,
        altInput: true,
        altFormat: "d-m-Y",
        dateFormat: "d-m-Y",
        defaultDate: "today"
    }),
    flatpickr("[data-behavior='timepickr']",{
        time_24hr: true,
        static: true,
        enableTime: true,
        noCalendar: true,
        dateFormat: "H:i"
    })
})

