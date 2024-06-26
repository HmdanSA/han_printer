fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'
lua54 'yes'

ui_page 'html/index.html'

shared_scripts {
    'config.lua',
}

client_script 'client/main.lua'

server_script 'server/main.lua'

files {
    '*.lua',
    'html/*.html',
    'html/*.js',
    'html/*.css',
}
