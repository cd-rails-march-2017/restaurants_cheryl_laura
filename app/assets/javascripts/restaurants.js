// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){
  $('#create_rest').hide()
  $('#add_rest').click(function(){
    $('#create_rest').toggle();
  })

  $('').click(function(){
     $('#create_rest').hide();
     $.ajax({
       method: 'POST',
       url: '/restaurants',
       success: console.log('Yay!')
     })
   })

  $('.rating').hide()
  $('.restaurants').click(function(){
    id = $(this).attr('id');
    $('#r' + id).toggle();
  })
})
