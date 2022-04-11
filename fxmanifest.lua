fx_version 'cerulean'
game 'gta5'

author 'M-'
description 'ESRP_burgershot'
version '1.0.0'

shared_scripts {
  'config.lua',
}

client_scripts {
  '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/EntityZone.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/ComboZone.lua',
  'client/main.lua',
  'client/garage.lua'
}

server_scripts {
  'server/main.lua',
  '@oxmysql/lib/MySQL.lua',
}