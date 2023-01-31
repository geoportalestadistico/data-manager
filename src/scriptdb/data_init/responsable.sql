create table responsable
(
    id            serial
        constraint "Responsable_pkey"
            primary key,
    id_supervisor integer,
    nombre        varchar(50),
    email         varchar(50)
);

alter table responsable
    owner to postgres;

INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (1, 3, 'Ricardo Vásquez Alberti                           ', 'ricardo.vasquez@cepal.org                         ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (2, 1, 'Claudio Moris                                     ', 'claudio.moris@cepal.org                           ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (3, 2, 'Alejandra Ovalle                                  ', 'alejandra.ovalle@cepal.org                        ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (4, 2, 'Claudia De Camino                                 ', 'claudia.decamino@cepal.org                        ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (5, 2, 'Patricia Marchant                                 ', 'patricia.marchant@cepal.org                       ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (6, 5, 'Matías Holloway                                   ', 'matias.holloway@cepal.org                         ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (7, 2, 'Carolina Cavada                                   ', 'carolina.cavada@cepal.org                         ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (8, 2, 'Ernestina Perez                                   ', 'ernestina.perez@cepal.org                         ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (12, null, 'Nuvia Alejandra Acevedo                           ', 'alejandra.acevedo@cepal.org                       ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (13, 12, 'Andrea Pellandra                                  ', 'andrea.pellandra@cepal.org                        ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (14, null, 'Simone Cecchini                                   ', 'simone.cecchini@cepal.org                         ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (15, 8, 'Claudio ARAVENA                                   ', 'claudio.aravena@cepal.org                         ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (17, null, 'Humberto Soto                                     ', 'humberto.soto@cepal.org                           ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (18, 9, 'Cesar CRISTANCHO                                  ', 'Cesar.CRISTANCHO@cepal.org                        ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (19, 10, 'Roque GATICA                                      ', 'Roque.GATICA@cepal.org                            ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (20, 11, 'Leandro Cabello                                   ', 'Leandro.CABELLO@cepal.org                         ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (21, 13, 'Ivonne GONZALEZ                                   ', 'Ivonne.GONZALEZ@cepal.org                         ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (22, 13, 'Michael HANNI                                     ', 'Michael.HANNI@cepal.org                           ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (23, 14, 'Marie Lavigne                                     ', 'marie.lavigne@cepal.org                           ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (25, 15, 'Marie Lavigne                                     ', 'marie.lavigne@cepal.org                           ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (26, null, 'Ana María Reyes                                   ', 'Ana.REYES@cepal.org                               ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (27, 16, 'José Arroyo                                       ', 'jose.arroyo@cepal.org                             ');
INSERT INTO public.responsable (id, id_supervisor, nombre, email) VALUES (28, 17, 'Laura Poveda                                      ', 'laura.poveda@cepal.org                            ');
