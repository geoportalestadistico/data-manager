create table relacion_nota_dato
(
    id      integer not null
        constraint "RelacionNotaDato_pkey"
            primary key,
    id_nota integer
        constraint fk_relacion_nota_dato_nota
            references nota,
    id_dato integer
        constraint fk_relacion_nota_dato_dato_gen
            references dato_gen
);

alter table relacion_nota_dato
    owner to postgres;

