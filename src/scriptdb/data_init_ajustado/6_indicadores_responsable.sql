DELETE FROM indicadores_responsable;
ALTER SEQUENCE indicadores_responsable_id_seq RESTART WITH 1;

INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (3, 'Ricardo Vásquez Alberti                           ', 'ricardo.vasquez@cepal.org                         ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (1, 'Claudio Moris                                     ', 'claudio.moris@cepal.org                           ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (2, 'Alejandra Ovalle                                  ', 'alejandra.ovalle@cepal.org                        ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (2, 'Claudia De Camino                                 ', 'claudia.decamino@cepal.org                        ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (2, 'Patricia Marchant                                 ', 'patricia.marchant@cepal.org                       ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (5, 'Matías Holloway                                   ', 'matias.holloway@cepal.org                         ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (2, 'Carolina Cavada                                   ', 'carolina.cavada@cepal.org                         ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (2, 'Ernestina Perez                                   ', 'ernestina.perez@cepal.org                         ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (null, 'Nuvia Alejandra Acevedo                           ', 'alejandra.acevedo@cepal.org                       ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (12, 'Andrea Pellandra                                  ', 'andrea.pellandra@cepal.org                        ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (null, 'Simone Cecchini                                   ', 'simone.cecchini@cepal.org                         ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (8, 'Claudio ARAVENA                                   ', 'claudio.aravena@cepal.org                         ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (null, 'Humberto Soto                                     ', 'humberto.soto@cepal.org                           ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (9, 'Cesar CRISTANCHO                                  ', 'Cesar.CRISTANCHO@cepal.org                        ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (10, 'Roque GATICA                                      ', 'Roque.GATICA@cepal.org                            ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (11, 'Leandro Cabello                                   ', 'Leandro.CABELLO@cepal.org                         ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (13, 'Ivonne GONZALEZ                                   ', 'Ivonne.GONZALEZ@cepal.org                         ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (13, 'Michael HANNI                                     ', 'Michael.HANNI@cepal.org                           ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (14, 'Marie Lavigne                                     ', 'marie.lavigne@cepal.org                           ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (15, 'Marie Lavigne                                     ', 'marie.lavigne@cepal.org                           ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (null, 'Ana María Reyes                                   ', 'Ana.REYES@cepal.org                               ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (16, 'José Arroyo                                       ', 'jose.arroyo@cepal.org                             ');
INSERT INTO indicadores_responsable (supervisor_id, nombre, email) VALUES (17, 'Laura Poveda                                      ', 'laura.poveda@cepal.org                            ');


UPDATE public.indicadores_responsable
SET nombre=TRIM(nombre), 
email=trim(email);
