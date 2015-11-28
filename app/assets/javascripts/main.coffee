$ ->
  $('#card_content').focus()

  $('body').sortable
    axis: 'y'
    items: 'div, li, h2, h3, h4, h5, h6'

    update: (e, ui) ->
      item = ui.item
      item_data = item.data()
      params = { _method: 'put' }
      params[item_data.modelName] = { row_order_position: item.index() }
      $.ajax
        type: 'POST'
        url: item_data.updateUrl
        dataType: 'json'
        data: params
