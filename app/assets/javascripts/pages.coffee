$ ->
  speed = 500
  $loading = $('.js-loading')
  $search_wrapper = $('.search_wrapper')
  $search_btn = $('.search_btn')
  $target_flema_all = $('.target_flema_all')
  $target_flema = $('.target_flema')
  $target_used_all = $('.target_used_all')
  $target_used = $('.target_used')
  $smartphone_nav = $('.smartphone_nav')
  $move_top = $('.move_top')
  userAgent = window.navigator.userAgent.toLowerCase()


  $search_btn.on 'click', ->
      $loading.show()

  $target_flema_all.on 'click', ->
      $target_flema.prop('checked', this.checked)

  $target_flema.on 'click', ->
      if $('.search_status_target_flema :checked').length == $('.search_status_target_flema :input').length
          $target_flema_all.prop('checked', 'checked')
      else
          $target_flema_all.prop('checked', false)

  $target_used_all.on 'click', ->
      $target_used.prop('checked', this.checked)

  $target_used.on 'click', ->
      if $('.search_status_target_used :checked').length == $('.search_status_target_used :input').length
          $target_used_all.prop('checked', 'checked')
      else
          $target_used_all.prop('checked', false)

  $(document).on 'click','.move_top', ->
      $('body, html').animate scrollTop: 0, 'middle'

  $('#request_ajax_update')
    .on 'ajax:complete', (event) ->
      response = event.detail[0].response
      $('#updated_by_ajax').html(response)
      $loading.fadeOut speed
      if userAgent.indexOf("iPhone") >= 0 || userAgent.indexOf("Android") >= 0
          $search_wrapper.addClass("dispnone_search")

  $(document).on 'touchstart','.smartphone_nav', ->
      $search_wrapper.toggleClass("dispnone_search")
