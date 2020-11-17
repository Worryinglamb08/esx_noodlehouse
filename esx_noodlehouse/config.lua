Config                            = {}
Config.DrawDistance               = 100.0

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.EnableMoneyWash            = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.MissCraft                  = 0 -- %


Config.AuthorizedVehicles = {
    { name = 'mule3',  label = 'Camion de travail' },
    { name = 'burrito3',  label = 'Camionnette de travail' },
    { name = 'double',  label = 'Moto de travail' },
}

Config.Blips = {
    
    Blip = {
      Pos     = { x = -671.62, y = -878.52, z = 84.47 },
      Sprite  = 514,
      Display = 4,
      Scale   = 0.9,
      Colour  = 28,
    },

}

Config.Zones = {

    Cloakrooms = {
        Pos   = { x = -667.42, y = -877.78, z = 24.69 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 255, g = 0, b = 0 },
        Type  = 21,
    },

    Vaults = {
        Pos   = { x = -671.19, y = -877.16, z = 24.49 },
        Size  = { x = 1.3, y = 1.3, z = 1.0 },
        Color = { r = 30, g = 144, b = 255 },
        Type  = 21,
    },

    Fridge = {
        Pos   = { x = -668.10, y = -883.37, z = 24.70 },
        Size  = { x = 1.0, y = 1.0, z = 0.5 },
        Color = { r = 0, g = 0, b = 255 },
        Type  = 22,
    },
	
	Cook = {
        Pos   = { x = -666.94, y = -881.16, z = 24.69 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 0, g = 200, b = 220 },
        Type  = 27,
    },
	
	Vehicles = {
        Pos          = { x = -686.37, y = -885.02, z = 24.49 },
        SpawnPoint   = { x = -670.16, y = -892.64, z = 24.31 },
        Size         = { x = 3.0, y = 3.0, z = 0.2 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 27,
        Heading      = 270.00,
    },

    VehicleDeleters = {
        Pos   = { x = -687.74, y = -879.22, z = 24.49 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 0, b = 0 },
        Type  = 27,
    },
    
    BossActions = {
        Pos   = { x = -671.62, y = -879.52, z = 24.47 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 0, g = 100, b = 0 },
        Type  = 21,
    },
}



Config.Uniforms = {
  barman_outfit = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 107,   ['torso_2'] = 1,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 4,
        ['pants_1'] = 25,   ['pants_2'] = 0,
        ['shoes_1'] = 25,   ['shoes_2'] = 0,
        ['chain_1'] = 0,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] =2,   ['tshirt_2'] = 0,
        ['torso_1'] = 98,    ['torso_2'] = 1,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 3,
        ['pants_1'] = 34,   ['pants_2'] = 0,
        ['shoes_1'] = 25,    ['shoes_2'] = 0,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }
  }
}
