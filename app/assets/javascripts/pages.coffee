$ ->
  speed = 500
  $loading = $('.js-loading')
  $search_wrapper = $('.search_wrapper')
  $search_btn = $('.search_btn')
  $max_price_box = $('.conditions_price')
  $target_flema_all = $('.target_flema_all')
  $target_flema = $('.target_flema')
  $target_used_all = $('.target_used_all')
  $target_used = $('.target_used')
  $products = $('.products')
  $smartphone_nav = $('.smartphone_nav')
  $move_top = $('.move_top')
  $disabled_wrapper = $('.disabled_wrapper')
  userAgent = window.navigator.userAgent.toLowerCase()


  $search_btn.on 'click', ->
      $loading.show()

  $max_price_box.on 'keydown', ->
      # 0～9, テンキ―0～9以外は入力キャンセル
      if(!((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 96 && e.keyCode <= 105)))
          return false

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
      $move_top.removeClass("hidden")
      $smartphone_nav.removeClass("hidden")
      if userAgent.indexOf("iphone") >= 0 || userAgent.indexOf("android") >= 0 || userAgent.indexOf("ipad") == 13
          $search_wrapper.addClass("dispnone_search")
          $search_wrapper.removeClass("fadein")
          $search_wrapper.addClass("fadeout")
          $disabled_wrapper.removeClass("disabled_wrap")

  $(document).on 'touchstart','.smartphone_nav', ->
      $search_wrapper.removeClass("dispnone_search")
      $search_wrapper.toggleClass("fadein")
      $search_wrapper.toggleClass("fadeout")
      $disabled_wrapper.toggleClass("disabled_wrap")
