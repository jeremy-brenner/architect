highlight = (table_name,column_name) ->
  for column in $('.schema_column') when $(column).data('table') == table_name and $(column).data('name') == column_name
    $(column).addClass('is_key')
    
jQuery ->
  for table in $('.schema_table')
    for jd in $(table).data('joindata')
      highlight jd['local']['table'], jd['local']['field']
      highlight jd['remote']['table'], jd['remote']['field']
    