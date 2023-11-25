fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'cosmo_hud'

description 'New Restyle  Cosmo_Hud'

author 'Karos#7804'


ui_page 'html/ui.html'

files {
	'html/*.*',
    'stream/*',
    'html/sounds/*.ogg',
}

client_scripts {
    'client/*.lua',
}


shared_scripts {
    
    '@es_extended/imports.lua',
	'@ox_lib/init.lua',
    'config.lua',
}