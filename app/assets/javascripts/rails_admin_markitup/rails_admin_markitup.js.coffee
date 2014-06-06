$(document).on 'rails_admin.dom_ready', (e, content) ->

  content = if content then content else $('form')

  if content.length
    goMarkitups = (array, config_options) =>
      markitup_settings = {
        previewParserPath: '/markitup/preview'
        markupSet: [
          {name:'First Level Heading', openWith:'#', key:"1", placeHolder:'Your title here...'},
          {name:'Second Level Heading', key:"2", openWith:'##', placeHolder:'Your title here...'},
          {name:'Heading 3', key:"3", openWith:'### ', placeHolder:'Your title here...' },
          {name:'Heading 4', key:"4", openWith:'#### ', placeHolder:'Your title here...' },
          {name:'Heading 5', key:"5", openWith:'##### ', placeHolder:'Your title here...' },
          {name:'Heading 6', key:"6", openWith:'###### ', placeHolder:'Your title here...' },
          {separator:'---------------' },        
          {name:'Bold', key:"B", openWith:'**', closeWith:'**'},
          {name:'Italic', key:"I", openWith:'_', closeWith:'_'},
          {separator:'---------------' },
          {name:'Bulleted List', openWith:'- ' },
          {name:'Numeric List', openWith: -> (markItUp) markItUp.line+'. '},
          {separator:'---------------' },
          {name:'Link', className: "markItUpButton12", key:"L", openWith:'[', closeWith:']([![Url:!:http://]!] "[![Title]!]")', placeHolder:'Your text to link here...' },
          {separator:'---------------'},    
          {name:'Preview', call:'preview', className:"preview"}
        ]
      }
      array.each ->
        $(@).markItUp markitup_settings
        $(@).addClass('markituped')

    array = content.find('[data-richtext=markitup]').not('.markituped')
    if array.length
      @array = array
      options = $(array[0]).data('options')
      if not window.markItUp
        $('head').append('<link href="' + options['csspath'] + '" rel="stylesheet" media="all" type="text\/css">')
        $.getScript options['jspath'], (script, textStatus, jqXHR) =>
          goMarkitups(@array, config_options)
      else
        goMarkitups(@array, config_options)