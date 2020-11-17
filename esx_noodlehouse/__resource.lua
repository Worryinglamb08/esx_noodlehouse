fx_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Noodle House'

author 'KiboNara'

version '1.1.0'

client_scripts {
  '@es_extended/locale.lua',
  'locales/fr.lua',
  'config.lua',
  'client/main.lua',
  'client/sell_client.lua',
  'client/tp_client.lua'
}

server_scripts {
  '@es_extended/locale.lua',
  'locales/fr.lua',
  'config.lua',
  'server/sell_server.lua',
  'server/main.lua'
}
