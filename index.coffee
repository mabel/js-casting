cnt = 0
themes = []
themesRaw  = document.getElementById('themes-raw')
themeItems = themesRaw.getElementsByTagName('li')
for t in themeItems
    arr = /(.*)(\/)([a-z0-9_\-]+)(.json$)/.exec(t.innerText)
    themes.push {pos: cnt++, name: arr[1], value: arr[3]}
themesRaw.innerHtml = ''

Vue.component 'screencast',
    template: '''
        <dialog class="mdl-dialog">
            <div class="mdl-dialog__content">
                <iframe class='screencast' name='demo-iframe' :src="'asciinema/' + src + '.html'" frameborder="no"></iframe>
            </div>
            <div class="mdl-dialog__actions mdl-dialog__actions--full-width">
                <button type="button" class="mdl-button close">Закрыть</button>
            </div>
        </dialog>
    '''
    props: ['src']

new Vue
    el: '#themes'
    data:
        themes: themes
    methods:
        getScreencast: (e)->
            dlg = document.createElement 'screencast'
            dlg.setAttribute 'src', e.target.value
            document.body.appendChild dlg
            new Vue
                el: dlg
                mounted: ->
                    dlg = @$el
                    parent = @$el.parentNode
                    if not dlg.showModal then dialogPolyfill.registerDialog dlg
                    dlg.showModal()
                    dlg.querySelector('.close').addEventListener 'click', ->
                        dlg.close()
                        parent.removeChild dlg
    mounted: ->
        document.getElementById('themes').style.visibility = 'visible'

