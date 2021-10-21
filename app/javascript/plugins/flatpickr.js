import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"



function initFlatPickr() {
  console.log("Hello");
  const bookingForm = document.getElementById('booking-date');
  if (bookingForm) {
    const bookings = JSON.parse(bookingForm.dataset.bookings);
    flatpickr("#date", {
      enableTime: true,
      minDate: "today",
      inline: true,
      dateFormat: "Y-m-d",
      "disable": bookings,
      clickOpens: true,
    });
  }
}

export { initFlatPickr };
