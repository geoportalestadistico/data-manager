
CREATE SEQUENCE estadistica_id_seq1;
CREATE SEQUENCE indicador_id_seq1;
CREATE SEQUENCE estudio_id_seq1;
CREATE SEQUENCE nota_id_seq1;
CREATE SEQUENCE organizacion_id_seq1;
CREATE SEQUENCE dimension_id_seq1;
CREATE SEQUENCE fuente_id_seq1;
CREATE SEQUENCE fuente_principal_id_seq1;
CREATE SEQUENCE fuente_relacionada_id_seq1;
CREATE SEQUENCE dato_gen_id_seq1;
CREATE SEQUENCE relacion_dimension_dato_id_seq1;
CREATE SEQUENCE relacion_indicador_estudio_id_seq1;
CREATE SEQUENCE relacion_nota_dato_id_seq1;
CREATE SEQUENCE relacion_indicador_dimension_id_seq1;


create table if not exists estadistica
(
    id                    smallint default nextval('estadistica_id_seq1'::regclass) not null
        primary key,
    orden                 smallint,
    nombre                varchar(100),
    descripcion           varchar(500),
    descripcion_ingles    varchar(500),
    descripcion_frances   varchar(100),
    descripcion_portugues varchar(100),
    visible               integer,
    email_contacto        varchar(100)
);

comment on table estadistica is 'Cada uno de los arboles';

create table if not exists indicador
(
    id                                  integer default nextval('indicador_id_seq1'::regclass) not null
        primary key,
    descripcion                         varchar(1500),
    descripcion_ingles                  varchar(1500),
    descripcion_frances                 varchar(1500),
    descripcion_portugues               varchar(1500),
    definicion                          varchar,
    definicion_ingles                   varchar,
    definicion_frances                  varchar,
    definicion_portugues                varchar,
    periodo_inicial                     varchar(10),
    periodo_final                       varchar(10),
    unidad_de_medida                    varchar(200),
    unidad_de_medida_ingles             varchar(200),
    unidad_de_medida_frances            varchar(200),
    unidad_de_medida_portugues          varchar(200),
    orden                               smallint,
    nota                                varchar,
    nota_ingles                         varchar,
    nota_frances                        varchar,
    nota_portugues                      varchar,
    comentarios                         varchar,
    metodologia_calculo                 varchar,
    tipo_dato                           varchar,
    indicador_listo                     smallint,
    tipo_dato_ingles                    varchar,
    tipo_dato_frances                   varchar,
    tipo_dato_portugues                 varchar,
    metodologia_calculo_ingles          varchar,
    metodologia_calculo_frances         varchar,
    metodologia_calculo_portugues       varchar,
    comentarios_ingles                  varchar,
    comentarios_frances                 varchar,
    comentarios_portugues               varchar,
    numero_decimales_consulta           integer,
    servidor_datos                      smallint,
    elimina_filas_consulta              smallint,
    fecha_ultima_actualizacion_revision timestamp,
    actualizado_por                     varchar(50),
    revisado_por                        varchar(50),
    fecha_ultimo_ingreso_masivo         varchar(25),
    indicador_estandarizado             smallint
);

create table if not exists responsable
(
    id            serial
        constraint "Responsable_pkey"
            primary key,
    id_supervisor integer,
    nombre        varchar(50),
    email         varchar(50)
);

create table if not exists estudio
(
    id_estadistica              smallint
        constraint fk_estudio_estadistica
            references estadistica,
    id                          smallint default nextval('estudio_id_seq1'::regclass) not null
        primary key,
    descripcion                 varchar(1000),
    descripcion_ingles          varchar(1000),
    indentacion                 smallint,
    orden                       integer,
    descripcion_larga           varchar,
    descripcion_larga_ingles    varchar,
    visible                     smallint,
    descripcion_frances         varchar(100),
    descripcion_portugues       varchar(100),
    descripcion_larga_frances   varchar,
    descripcion_larga_portugues varchar
);

comment on table estudio is 'es cada una de los hojas del arbol';

create table if not exists nota
(
    id             integer default nextval('nota_id_seq1'::regclass) not null
        primary key,
    id_estadistica smallint
        constraint fk_nota_estadistica
            references estadistica,
    nota           varchar(1500),
    nota_ingles    varchar(1500),
    nota_frances   varchar(1500),
    nota_portugues varchar(1500)
);

create table if not exists organizacion
(
    id                        integer default nextval('organizacion_id_seq1'::regclass) not null
        primary key,
    id_estadistica            smallint
        constraint fk_organizacion_estadistica
            references estadistica,
    sigla_organismo           varchar(50),
    nombre                    varchar(400),
    url                       varchar(200),
    sigla_organismo_ingles    varchar(50),
    nombre_ingles             varchar(400),
    sigla_organismo_frances   varchar(50),
    sigla_organismo_portugues varchar(50),
    nombre_frances            varchar(400),
    nombre_portugues          varchar(400)
);

create table if not exists relacion_indicador_responsable
(
    id                   integer not null
        primary key,
    id_indicador         integer
        constraint fk_relacion_indicador_responsable_indicador
            references indicador,
    id_responsable       integer
        constraint fk_relacion_indicador_responsable_responsable
            references responsable,
    fechas_actualizacion timestamp with time zone
);

create table if not exists tipo_dimension
(
    id                 serial
        constraint "TipoDimension_pkey"
            primary key,
    descripcion        varchar(250),
    descripcion_ingles varchar(250),
    id_estadistica     smallint
        constraint fk_tipo_dimension_estadistica
            references estadistica
);

create table if not exists dimension
(
    id                    integer default nextval('dimension_id_seq1'::regclass) not null
        constraint "Dimension_pkey"
            primary key,
    id_raiz               integer,
    id_padre              integer
        constraint fk_dimension_dimension
            references dimension,
    descripcion           varchar(300),
    descripcion_ingles    varchar(300),
    descripcion_frances   varchar(300),
    descripcion_portugues varchar(300),
    orden                 smallint,
    orden_anuario         smallint,
    id_nota               integer
        constraint fk_dimension_nota
            references nota,
    visible               smallint,
    id_tipo_dimension     integer
        constraint fk_dimension_tipo_dimension
            references tipo_dimension,
    iso_3                 varchar(3),
    iso_numerico          integer
);

comment on table dimension is 'Dimensiones de los indicadores';

create table if not exists fuente
(
    id                           integer default nextval('fuente_id_seq1'::regclass) not null
        constraint "Fuente_pkey"
            primary key,
    id_estadistica               smallint
        constraint fk_fuente_estadistica
            references estadistica,
    id_organizacion              integer
        constraint fk_fuente_organizacion
            references organizacion,
    nombre_publicacion           varchar(1200),
    url                          varchar(250),
    nombre_publicacion_ingles    varchar(1200),
    nombre_publicacion_frances   varchar(1200),
    nombre_publicacion_portugues varchar(1200)
);

create table if not exists fuente_organizacion
(
    id_fuente        integer not null
        constraint "Fuente_Organizacion_pkey"
            primary key
        constraint fk_fuente_organizacion_fuente
            references fuente,
    id_organizacion  integer
        constraint fk_fuente_organizacion_organizacion
            references organizacion,
    organizacion     varchar(400),
    sigla            varchar(50),
    url_organizacion varchar(200),
    publicacion      varchar(1200),
    url_publicacion  varchar(250)
);

create table if not exists fuente_principal
(
    id           integer default nextval('fuente_principal_id_seq1'::regclass) not null
        primary key,
    id_indicador integer
        constraint fk_fuente_principal_indicador
            references indicador,
    id_fuente    integer
        constraint fk_fuente_principal_fuente
            references fuente
);

create table if not exists fuente_relacionada
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

create table if not exists relacion_indicador_dimension
(
    id                      integer not null
        constraint "RelacionIndicadorDimension_pkey"
            primary key,
    id_indicador            integer
        constraint fk_relacion_indicador_dimension_indicador
            references indicador,
    id_dimension            integer
        constraint fk_relacion_indicador_dimension_dimension
            references dimension,
    orden_calculo_operacion integer,
    posicion_default        smallint,
    orden                   integer
);

create table if not exists dato_gen
(
    id               integer default nextval('dato_gen_id_seq1'::regclass) not null
        constraint "DatoGen_pkey"
            primary key,
    id_fuente        integer,
    dato             numeric(38, 22),
    dato_cualitativo varchar(20)
);

create table if not exists relacion_dimension_dato
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

create table if not exists relacion_nota_dato
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

alter table dato_gen
    add constraint fk_dato_gen_relacion_nota_dato
        foreign key (id_fuente) references relacion_nota_dato;

create table if not exists relacion_indicador_estudio
(
    id                integer default nextval('relacion_indicador_estudio_id_seq1'::regclass) not null
        primary key,
    id_indicador      integer
        constraint fk_relacion_indicador_estudio_indicador
            references indicador,
    id_estudio        smallint
        constraint fk_relacion_indicador_estudio_estudio
            references estudio,
    orden             smallint,
    indicador_externo smallint
);


--Se definen las secuencias para los autonuméricos de las PK (en caso de que no existan)

--ALTER TABLE estadistica ALTER COLUMN id SET DEFAULT nextval('estadistica_id_seq1');
--ALTER TABLE indicador ALTER COLUMN id SET DEFAULT nextval('indicador_id_seq1');
--ALTER TABLE estudio ALTER COLUMN id SET DEFAULT nextval('estudio_id_seq1');
--ALTER TABLE nota ALTER COLUMN id SET DEFAULT nextval('nota_id_seq1');
--ALTER TABLE organizacion ALTER COLUMN id SET DEFAULT nextval('organizacion_id_seq1');
--ALTER TABLE dimension ALTER COLUMN id SET DEFAULT nextval('dimension_id_seq1');
--ALTER TABLE fuente ALTER COLUMN id SET DEFAULT nextval('fuente_id_seq1');
--ALTER TABLE fuente_principal ALTER COLUMN id SET DEFAULT nextval('fuente_principal_id_seq1');
--ALTER TABLE fuente_relacionada ALTER COLUMN id SET DEFAULT nextval('fuente_relacionada_id_seq1');
--ALTER TABLE dato_gen ALTER COLUMN id SET DEFAULT nextval('dato_gen_id_seq1');
--ALTER TABLE relacion_dimension_dato ALTER COLUMN id SET DEFAULT nextval('relacion_dimension_dato_id_seq1');
--ALTER TABLE relacion_indicador_estudio ALTER COLUMN id SET DEFAULT nextval('relacion_indicador_estudio_id_seq1');
ALTER TABLE relacion_nota_dato ALTER COLUMN id SET DEFAULT nextval('relacion_nota_dato_id_seq1');
ALTER TABLE relacion_indicador_dimension ALTER COLUMN id SET DEFAULT nextval('relacion_indicador_dimension_id_seq1');

