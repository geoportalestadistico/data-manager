create table fuente_relacionada
(
    id           integer default nextval('fuente_relacionada_id_seq1'::regclass) not null
        primary key,
    id_indicador integer
        constraint fk_fuente_relacionada_indicador
            references indicador,
    id_fuente    integer
        constraint fk_fuente_relacionada_fuente
            references fuente
);

alter table fuente_relacionada
    owner to postgres;

INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (645, 134, 7);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (649, 133, 7);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (639, 462, 208);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (104, 336, 149);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (624, 548, 112);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (76, 312, 125);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (636, 324, 122);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (637, 324, 123);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (98, 332, 119);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (99, 332, 145);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (100, 332, 120);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (101, 332, 144);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (110, 345, 153);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (118, 351, 117);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (119, 351, 154);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (120, 352, 138);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (121, 352, 112);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (126, 325, 150);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (127, 370, 171);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (146, 368, 171);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (131, 372, 171);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (638, 324, 112);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (640, 462, 112);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (644, 350, 157);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (606, 525, 169);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (165, 410, 185);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (607, 526, 169);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (612, 178, 52);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (641, 407, 177);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (642, 407, 176);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (643, 407, 178);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (152, 127, 12);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (96, 331, 142);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (97, 331, 143);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (102, 333, 146);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (103, 335, 148);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (105, 337, 150);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (106, 338, 150);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (108, 342, 150);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (109, 343, 150);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (122, 353, 150);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (123, 354, 138);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (124, 354, 146);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (125, 356, 162);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (156, 405, 174);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (157, 405, 175);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (164, 408, 184);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (133, 377, 171);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (139, 381, 171);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (141, 383, 171);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (648, 705, 50);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (140, 382, 171);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (166, 412, 185);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (167, 412, 123);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (168, 413, 185);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (596, 513, 171);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (597, 514, 171);
INSERT INTO public.fuente_relacionada (id, id_indicador, id_fuente) VALUES (625, 548, 352);
