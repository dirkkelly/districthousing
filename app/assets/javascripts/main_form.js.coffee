if window.location.pathname.match(/\/apply$/)
  $ ->

    changeSection = ->
      hash = window.location.hash
      sectionId = hash.substring 1
      $('.section').each ()->
        section = $ @
        if section.attr('id') is sectionId
          section.toggleClass 'hide', false
        else
          section.toggleClass 'hide', true
      $('.wizard-nav a').each ()->
        link = $ @
        parent = link.parent()
        if link.attr('href') is hash
          parent.toggleClass 'active', true
        else
          parent.toggleClass 'active', false

    scrollToTop = ->
      window.scrollTo 0, 0

    $(window).on 'hashchange', changeSection
    $(window).on 'hashchange', scrollToTop

    showDownloadWarning = ->
      $('#download-warning').modal()

    submitUpdateForm = ->
      $('#update-button').submit()

    initialize = (e)->
      $('.download-forms').click(
        showDownloadWarning
        submitUpdateForm
      )
      firstSectionHash = $('.wizard-nav a').eq(0).attr 'href'
      if window.location.hash.length <= 1
        window.location.hash = firstSectionHash
      else
        changeSection()

    $(document).ajaxComplete initialize
    initialize()