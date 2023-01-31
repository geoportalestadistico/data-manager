create table relacion_dimension_dato
(
    id           integer default nextval('relacion_dimension_dato_id_seq1'::regclass) not null
        constraint "RelacionDimensionDato_pkey"
            primary key,
    id_dimension integer
        constraint fk_relacion_dimension_dato_dimension
            references dimension,
    id_dato      integer
        constraint fk_relacion_dimension_dato_gen
            references dato_gen,
    id_indicador integer
        constraint fk_relacion_dimension_dato_indicador
            references indicador
);

alter table relacion_dimension_dato
    owner to postgres;

