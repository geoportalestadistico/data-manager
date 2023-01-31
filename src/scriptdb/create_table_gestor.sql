create table if not exists "DatoGen"
(
    id                integer,
    id_fuente         integer,
    dato              numeric(38, 22),
    "datoCualitativo" char(50)
);

alter table "DatoGen"
    owner to postgres;

create table if not exists "Dimension"
(
    id                    integer,
    id_raiz               integer,
    id_padre              integer,
    descripcion           char(300),
    descripcion_ingles    char(300),
    descripcion_frances   char(300),
    descripcion_portugues char(300),
    orden                 smallint,
    orden_anuario         smallint,
    id_nota               integer,
    visible               smallint,
    "id_TipoDimension"    integer,
    operacion             char(250),
    "SeleccionDefault"    smallint,
    iso3                  char(3),
    "ISO_numerico"        integer
);

alter table "Dimension"
    owner to postgres;

create table if not exists "Fuente"
(
    id                           integer,
    id_estadistica               smallint,
    id_organizacion              integer,
    nombre_publicacion           char(1200),
    url                          char(250),
    nombre_publicacion_ingles    char(1200),
    nombre_publicacion_frances   char(1200),
    nombre_publicacion_portugues char(1200)
);

alter table "Fuente"
    owner to postgres;

create table if not exists "Fuente_Organizacion"
(
    "Id_Fuente"        integer,
    "Id_Organizacion"  integer,
    "Organizacion"     varchar(400),
    "Sigla"            varchar(50),
    "URL_Organizacion" varchar(200),
    "Publicaion"       char(1200),
    "URL_Publicacion"  char(250)
);

alter table "Fuente_Organizacion"
    owner to postgres;

create table if not exists "Langs"
(
    id      integer,
    name_es char(10),
    name_en char(10),
    name_fr char(10),
    name_pt char(10),
    code    varchar(2),
    "order" integer
);

alter table "Langs"
    owner to postgres;

create table if not exists "RelacionDimensionDato"
(
    id           integer,
    id_dimension integer,
    id_dato      integer,
    id_indicador integer
);

alter table "RelacionDimensionDato"
    owner to postgres;

create table if not exists "RelacionIndicadorDimension"
(
    id                      integer,
    id_indicador            integer,
    id_dimension            integer,
    "OrdenCalculoOperacion" integer,
    "PosicionDefault"       smallint,
    orden                   integer
);

alter table "RelacionIndicadorDimension"
    owner to postgres;

create table if not exists "RelacionNotaDato"
(
    id      integer,
    id_nota integer,
    id_dato integer
);

alter table "RelacionNotaDato"
    owner to postgres;

create table if not exists "RelacionNotaParametro"
(
    id                  integer,
    id_nota             integer,
    id_parametro        integer,
    descripcion_espanol char(1500),
    descripcion_ingles  char(1500)
);

alter table "RelacionNotaParametro"
    owner to postgres;

create table if not exists "Responsable"
(
    id            integer,
    id_supervisor integer,
    nombre        char(50),
    email         char(50)
);

alter table "Responsable"
    owner to postgres;

create table if not exists "TipoDimension"
(
    id                 integer,
    descripcion        char(250),
    descripcion_ingles char(250),
    id_estadistica     smallint
);

alter table "TipoDimension"
    owner to postgres;

create table if not exists fuente_principal
(
    id           integer,
    id_indicador integer,
    id_fuente    integer
);

alter table fuente_principal
    owner to postgres;

create table if not exists fuente_relacionada
(
    id           integer,
    id_indicador integer,
    id_fuente    integer
);

alter table fuente_relacionada
    owner to postgres;

create table if not exists indicador
(
    id                                 integer,
    descripcion                        char(1500),
    descripcion_ingles                 char(1500),
    descripcion_frances                char(1500),
    descripcion_portugues              char(1500),
    definicion                         text,
    definicion_ingles                  text,
    definicion_frances                 text,
    definicion_portugues               text,
    periodo_inicial                    char(10),
    periodo_final                      char(10),
    "Unidad_de_medida"                 char(200),
    "Unidad_de_medida_ingles"          char(200),
    "Unidad_de_medida_frances"         char(200),
    "Unidad_de_medida_portugues"       char(200),
    orden                              smallint,
    nota                               text,
    nota_ingles                        text,
    nota_frances                       text,
    nota_portugues                     text,
    comentarios                        text,
    metodologia_calculo                text,
    tipo_dato                          text,
    indicador_listo                    smallint,
    "FlagAnuario"                      integer,
    "FlagMilenio"                      integer,
    "FlagPanorama"                     integer,
    "FlagCmdsn"                        integer,
    "FlagDatos"                        char,
    "FlagFicha"                        char,
    tipo_dato_ingles                   text,
    tipo_dato_frances                  text,
    tipo_dato_portugues                text,
    metodologia_calculo_ingles         text,
    metodologia_calculo_frances        text,
    metodologia_calculo_portugues      text,
    comentarios_ingles                 text,
    comentarios_frances                text,
    comentarios_portugues              text,
    "NumeroDecimalesConsulta"          integer,
    "ServidorDatos"                    smallint,
    "EliminaFilasConsulta"             smallint,
    "FechaUltimaActualizacionRevision" timestamp,
    "ActualizadoPor"                   char(50),
    "RevisadoPor"                      char(50),
    "FechaUltimoIngresoMasivo"         char(25),
    indicador_estandarizado            smallint
);

alter table indicador
    owner to postgres;

create table if not exists nota
(
    id             integer,
    id_estadistica smallint,
    nota           char(1500),
    nota_ingles    char(1500),
    nota_frances   char(1500),
    nota_portugues char(1500)
);

alter table nota
    owner to postgres;

create table if not exists organizacion
(
    id                        integer,
    id_estadistica            smallint,
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

alter table organizacion
    owner to postgres;

create table if not exists parameters
(
    id          integer,
    description text,
    value       text,
    datatype    char(255),
    timestamp   timestamp
);

alter table parameters
    owner to postgres;




ALTER TABLE "DatoGen" ADD PRIMARY KEY (id);
ALTER TABLE "Dimension" ADD PRIMARY KEY (id);
ALTER TABLE "Fuente" ADD PRIMARY KEY (id);
ALTER TABLE "Fuente_Organizacion" ADD PRIMARY KEY ("Id_Fuente");
ALTER TABLE "Langs" ADD PRIMARY KEY (id);
ALTER TABLE "RelacionDimensionDato" ADD PRIMARY KEY (id);
ALTER TABLE "RelacionIndicadorDimension" ADD PRIMARY KEY (id);
ALTER TABLE "RelacionNotaDato" ADD PRIMARY KEY (id);
ALTER TABLE "RelacionNotaParametro" ADD PRIMARY KEY (id);
ALTER TABLE "Responsable" ADD PRIMARY KEY (id);
ALTER TABLE "TipoDimension" ADD PRIMARY KEY (id);
ALTER TABLE "fuente_principal" ADD PRIMARY KEY (id);
ALTER TABLE "fuente_relacionada" ADD PRIMARY KEY (id);
ALTER TABLE "indicador" ADD PRIMARY KEY (id);
ALTER TABLE "nota" ADD PRIMARY KEY (id);
ALTER TABLE "organizacion" ADD PRIMARY KEY (id);
ALTER TABLE "parameters" ADD PRIMARY KEY (id);