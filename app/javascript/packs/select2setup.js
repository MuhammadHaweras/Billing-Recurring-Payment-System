import $ from 'jquery'
import 'select2'
import 'select2/dist/css/select2.css'

$(document).on('turbolinks:load', function() {
  $('.select-feature').select2({
    tags: true,
    tokenSeparators: [',', ' '],
    placeholder: 'Select Feature',
    width: '300px'
  });
})
