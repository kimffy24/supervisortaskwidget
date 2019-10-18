#-----------------------------------------------------------------------#
#																		#
# OS Version Pro for Übersicht 											#
# 																		#
# Created July 2018 by Mike Pennella									#
#																		#
#																		#
# Position the widget on the screen										#
align_flat              = 'left'                                        #
align_flat_pos          = '10px'										#
align_hierarchical      = 'bottom'                                      #
align_hierarchical_pos	= '5px'										#
#																		#
#-----------------------------------------------------------------------#

command: "/usr/local/bin/supervisorctl status"

refreshFrequency: 2000

style: """
  #{align_flat}: #{align_flat_pos}
  #{align_hierarchical}: #{align_hierarchical_pos}
  font-family: Avenir Next

  #containerTT
    width: 100%
    display: inline-block

  .task-item
    display: inline-block
    overfload: hidden
    margin-left: 29px

  .task-item > font
    color: #fff
    text-shadow: 0 1px 1px rgba(#fff, .5)

  .breathe-div-p
    width: 0px
    height: 0px
    
  .breathe-div
    width: 15px
    height: 15px
    border: 1px solid #2b92d4
    border-radius: 50%
    text-align: center
    cursor: pointer
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.3)
    -webkit-animation-timing-function: ease-in-out
    -webkit-animation-name: breathe
    -webkit-animation-duration: 2000ms
    -webkit-animation-iteration-count: infinite
    -webkit-animation-direction: alternate
    position: relative
    left: -22px
    top: 3px

  @-webkit-keyframes breathe
    0% {
        opacity: .0
        box-shadow: 0 0px 0px rgba(0, 147, 223, 0), 0 0px 0px rgba(0, 147, 223, 0) inset
    }

    50% {
        opacity: .4
        border: 1px solid rgba(59, 235, 235, 0.7)
        box-shadow: 0 1px 30px #0093df, 0 1px 20px #0093df inset
    }

    100% {
        opacity: .0
        box-shadow: 0 0px 0px rgba(0, 147, 223, 0), 0 0px 0px rgba(0, 147, 223, 0) inset
    }
"""

render: -> """
  <div id="containerTT"></div>
"""

update: (output, domEl) ->

    sep = output.trim().split("\n")
    html = ''
    for i in sep
        sep2 = i.replace(/\s+/g," ").trim().split(" ")
        if 'RUNNING' != sep2[1]
            continue
        html += '<div class="task-item">'
        html += '<div class="breathe-div-p"><div class="breathe-div"></div></div>'
        html += '<font>' + sep2[0] + '</font>'
        html += '</div>'
    $('#containerTT').html(html)