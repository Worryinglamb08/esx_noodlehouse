INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_noodlehouse', 'NoodleHouse', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_noodlehouse', 'NoodleHouse', 1),
  ('society_noodlehouse_fridge', 'NoodleHouse(fridge)', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    ('society_noodlehouse', 'NoodleHouse', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  ('noodlehouse', 'Noodle House', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('noodlehouse', 0, 'recruit', 'Recrue', 800, '{}', '{}'),
  ('noodlehouse', 1, 'novice', 'Cuisinier', 800, '{}', '{}'),
  ('noodlehouse', 2, 'chef', 'Chef cuisinier', 800, '{}', '{}'),
  ('noodlehouse', 3, 'viceboss', 'Co-Gérant', 800, '{}', '{}'),
  ('noodlehouse', 4, 'boss', 'Patron', 800, '{}', '{}')
;
