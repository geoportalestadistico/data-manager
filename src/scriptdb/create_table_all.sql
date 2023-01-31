create table "Atlas"
(
    id             integer,
    id_estadistica smallint,
    descripcion    char(50),
    comentarios    text,
    "consultaXML"  text
);

alter table "Atlas"
    owner to postgres;

create table "CapturaGraficos"
(
    id                 integer,
    id_estadistica     smallint,
    descripcion        char(200),
    "GraficosPorLinea" integer,
    header             text,
    footer             text
);

alter table "CapturaGraficos"
    owner to postgres;

create table "CapturaGraficosDetalle"
(
    id                              integer,
    id_captura                      integer,
    "NumeroDimensiones"             integer,
    "DespliegaSerieCompleta"        integer,
    "DespliegaTabla"                integer,
    header                          char(4000),
    footer                          char(4000),
    "TipoGrafico"                   char(50),
    "idIndicador"                   integer,
    "RotulosGrafico"                text,
    "NumeroSeries"                  integer,
    checkgrafico                    text,
    caption                         char(1024),
    "subCaption"                    char(1024),
    descripcion_indicador_capturado char(1024),
    "bgColor"                       char(7),
    "anchoGrafico"                  integer,
    "altoGrafico"                   integer,
    orden                           integer
);

alter table "CapturaGraficosDetalle"
    owner to postgres;

create table "CapturaGraficosDetalleRespaldo"
(
    id                              integer,
    id_captura                      integer,
    "NumeroDimensiones"             integer,
    "DespliegaSerieCompleta"        integer,
    "DespliegaTabla"                integer,
    header                          char(4000),
    footer                          char(4000),
    "TipoGrafico"                   char(50),
    "idIndicador"                   integer,
    "RotulosGrafico"                text,
    "NumeroSeries"                  integer,
    checkgrafico                    text,
    caption                         char(1024),
    "subCaption"                    char(1024),
    descripcion_indicador_capturado char(1024),
    "bgColor"                       char(7),
    "anchoGrafico"                  integer,
    "altoGrafico"                   integer,
    orden                           integer
);

alter table "CapturaGraficosDetalleRespaldo"
    owner to postgres;

create table "CapturaGraficosRespaldo"
(
    id                 integer,
    id_estadistica     smallint,
    descripcion        char(50),
    "GraficosPorLinea" integer,
    header             text,
    footer             text
);

alter table "CapturaGraficosRespaldo"
    owner to postgres;

create table "ControlIngresoMasivo"
(
    id                 integer,
    id_indicador       integer,
    usuario            char(50),
    fecha              timestamp,
    "DatosInsertados"  integer,
    "DatosBorrados"    integer,
    "DatosModificados" integer
);

alter table "ControlIngresoMasivo"
    owner to postgres;

create table "CuadroMilenium"
(
    id           char(5),
    id_indicador integer,
    id_indice    integer
);

alter table "CuadroMilenium"
    owner to postgres;

create table "DatoGen"
(
    id                integer,
    id_fuente         integer,
    dato              numeric(38, 22),
    "datoCualitativo" char(50)
);

alter table "DatoGen"
    owner to postgres;

create table "DesagregacionesDefault"
(
    id           integer,
    id_parametro integer,
    id_dimension integer
);

alter table "DesagregacionesDefault"
    owner to postgres;

create table "DesagregacionesDefaultCD"
(
    id           integer,
    id_parametro integer,
    id_dimension integer
);

alter table "DesagregacionesDefaultCD"
    owner to postgres;

create table "DesagregacionesNOseleccionadas"
(
    id               integer,
    id_relacion      integer,
    id_desagregacion integer
);

alter table "DesagregacionesNOseleccionadas"
    owner to postgres;

create table "DesagregacionesSeleccionadas"
(
    id           integer,
    id_indicador integer,
    id_dimension integer
);

alter table "DesagregacionesSeleccionadas"
    owner to postgres;

create table "Dimension"
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

create table "Estadistica"
(
    id                                   smallint,
    orden                                smallint,
    nombre                               char(100),
    descripcion                          char(500),
    descripcioningles                    char(500),
    "descripcionFrances"                 char(100),
    "descripcionPortugues"               char(100),
    visible                              integer,
    "EmailContacto"                      char(100),
    "VersionMultidimensionalHabilitada"  integer,
    "MuestraOpcionesAdmMultidimensional" integer,
    "ColorFondoConsultaFlash"            char(50),
    "VersionIntegradaHabilitada"         smallint,
    "TopFlashAplicacion"                 char(50)
);

alter table "Estadistica"
    owner to postgres;

create table "EstructuraDefault"
(
    id           integer,
    id_parametro integer,
    id_dimension integer,
    posicion     smallint,
    orden        integer
);

alter table "EstructuraDefault"
    owner to postgres;

create table "EstructuraDefaultCD"
(
    id           integer,
    id_parametro integer,
    id_dimension integer,
    posicion     smallint,
    orden        integer
);

alter table "EstructuraDefaultCD"
    owner to postgres;

create table "Estudio"
(
    id_estadistica              smallint,
    id_estudio                  smallint,
    descripcion                 char(1000),
    link                        char(250),
    descripcion_ingles          char(1000),
    link_ingles                 char(250),
    indentacion                 smallint,
    orden                       integer,
    "DescripcionLarga"          text,
    "DescripcionLargaIngles"    text,
    visible                     smallint,
    "ColorFondoConsultaFlash"   char(50),
    "pertenece_a_BDI"           smallint,
    link_frances                char(250),
    link_portugues              char(250),
    descripcion_frances         char(100),
    descripcion_portugues       char(100),
    "DescripcionLargaFrances"   text,
    "DescripcionLargaPortugues" text
);

alter table "Estudio"
    owner to postgres;

create table "Formats"
(
    id   integer,
    name varchar(10),
    code varchar(2)
);

alter table "Formats"
    owner to postgres;

create table "Fuente"
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

create table "Fuente_Organizacion"
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

create table "Google"
(
    periodo            real,
    pagina             char(1000),
    visitas            real,
    visitas_unicas     real,
    promedio_tiempo    real,
    entradas           real,
    porcentaje_rebote  real,
    porcentaje_salidas real,
    valor              real
);

alter table "Google"
    owner to postgres;

create table "IdsDatosRequeridos"
(
    id        integer,
    dato      numeric(28, 12),
    id_fuente integer
);

alter table "IdsDatosRequeridos"
    owner to postgres;

create table "Langs"
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

create table "ParametrosAnuarioEstadistico"
(
    id                           integer,
    id_indicador                 integer,
    "NumeroTema"                 char(10),
    "NumeroSubTema"              char(10),
    "NumeroCuadro"               char(15),
    orden                        integer,
    "DescripcionTema"            char(100),
    "DescripcionTemaIngles"      char(100),
    "DescripcionTemaFrances"     char(100),
    "DescripcionSubTema"         char(100),
    "DescripcionSubTemaIngles"   char(100),
    "DescripcionSubTemaFrances"  char(100),
    "DescripcionEspanol"         char(300),
    "DescripcionIngles"          char(300),
    "DescripcionFrances"         char(200),
    "UnidadMedida"               char(200),
    "UnidadMedidaIngles"         char(200),
    "UnidadMedidaFrances"        char(100),
    "NumeroDecimalesDesplegados" integer,
    "PosicionBilingue"           integer,
    "ListaNotasDeshabilitadas"   char(4000),
    "Comentarios"                char(100),
    "id_EstadisticaAnuario"      integer
);

alter table "ParametrosAnuarioEstadistico"
    owner to postgres;

create table "ParametrosGrafico"
(
    id              char(50),
    "NumeroGrafico" integer,
    orden           integer,
    componente      char(50),
    valores         text,
    fecha           timestamp
);

alter table "ParametrosGrafico"
    owner to postgres;

create table "PoblacionTotal"
(
    id_dato       integer,
    dato          numeric(28, 12),
    desagregacion char(300)
);

alter table "PoblacionTotal"
    owner to postgres;

create table "PoblacionTotal_test"
(
    id_dato       integer,
    dato          numeric(28, 12),
    desagregacion char(300)
);

alter table "PoblacionTotal_test"
    owner to postgres;

create table "Poblacion_Pais_Año"
(
    id_dato integer,
    "Pais"  char(300),
    "Año"   char(300),
    dato    numeric(38, 22)
);

alter table "Poblacion_Pais_Año"
    owner to postgres;

create table "PortalNews"
(
    id       integer,
    visible  integer,
    "order"  integer,
    date     date,
    type_es  char(255),
    type_en  char(255),
    title_es char(1024),
    title_en char(1024),
    link_es  char(1024),
    link_en  char(1024)
);

alter table "PortalNews"
    owner to postgres;

create table "RelacionDimensionDato"
(
    id           integer,
    id_dimension integer,
    id_dato      integer,
    id_indicador integer
);

alter table "RelacionDimensionDato"
    owner to postgres;

create table "RelacionIndicadorDimension"
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

create table "RelacionIndicadorEstudio"
(
    id                 integer,
    id_indicador       integer,
    id_estudio         smallint,
    orden              smallint,
    "IndicadorExterno" smallint
);

alter table "RelacionIndicadorEstudio"
    owner to postgres;

create table "RelacionIndicadorResponsable"
(
    id                   integer,
    id_indicador         integer,
    id_responsable       integer,
    fechas_actualizacion char(256)
);

alter table "RelacionIndicadorResponsable"
    owner to postgres;

create table "RelacionNotaDato"
(
    id      integer,
    id_nota integer,
    id_dato integer
);

alter table "RelacionNotaDato"
    owner to postgres;

create table "RelacionNotaParametro"
(
    id                  integer,
    id_nota             integer,
    id_parametro        integer,
    descripcion_espanol char(1500),
    descripcion_ingles  char(1500)
);

alter table "RelacionNotaParametro"
    owner to postgres;

create table "Responsable"
(
    id            integer,
    id_supervisor integer,
    nombre        char(50),
    email         char(50)
);

alter table "Responsable"
    owner to postgres;

create table "Semantics"
(
    "indicatorID" integer,
    "areaID"      integer,
    "tagsSpanish" char(255),
    "tagsEnglish" char(255)
);

alter table "Semantics"
    owner to postgres;

create table "Semantics20200101"
(
    "indicatorID" integer,
    "areaID"      integer,
    "tagsSpanish" char(255),
    "tagsEnglish" char(255)
);

alter table "Semantics20200101"
    owner to postgres;

create table "TipoDimension"
(
    id                 integer,
    descripcion        char(250),
    descripcion_ingles char(250),
    id_estadistica     smallint
);

alter table "TipoDimension"
    owner to postgres;

create table car
(
    id    integer,
    brand char(50),
    model char(50)
);

alter table car
    owner to postgres;

create table credits
(
    id             integer,
    description_en char(255),
    description_es char(255)
);

alter table credits
    owner to postgres;

create table dim
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

alter table dim
    owner to postgres;

create table dtproperties
(
    id       integer,
    objectid integer,
    property varchar(64),
    value    varchar(255),
    lvalue   bytea,
    version  integer,
    uvalue   char(255)
);

alter table dtproperties
    owner to postgres;

create table fuente_principal
(
    id           integer,
    id_indicador integer,
    id_fuente    integer
);

alter table fuente_principal
    owner to postgres;

create table fuente_relacionada
(
    id           integer,
    id_indicador integer,
    id_fuente    integer
);

alter table fuente_relacionada
    owner to postgres;

create table indicador
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

create table nota
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

create table novedades
(
    id             integer,
    id_estadistica smallint,
    fecha          timestamp,
    novedad        text,
    novedad_ingles text
);

alter table novedades
    owner to postgres;

create table organizacion
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

create table paginas
(
    id             integer,
    id_estadistica smallint,
    nombre         char(50),
    "nombreIngles" char(50),
    enlace         char(200),
    orden          smallint
);

alter table paginas
    owner to postgres;

create table "paginasEstudio"
(
    id             integer,
    id_estudio     smallint,
    nombre         char(50),
    "nombreIngles" char(50),
    enlace         char(200),
    orden          smallint
);

alter table "paginasEstudio"
    owner to postgres;

create table parameters
(
    id          integer,
    description text,
    value       text,
    datatype    char(255),
    timestamp   timestamp
);

alter table parameters
    owner to postgres;

create table propietario_indicador_area_tema
(
    id_indicador integer,
    indicador    char(1500),
    id_area      smallint,
    area         char(100),
    id_tema      smallint,
    tema         char(100)
);

alter table propietario_indicador_area_tema
    owner to postgres;

create table sdg_goals
(
    id                smallint,
    id_estudio        smallint,
    goal_id           smallint,
    "defaultSeriesID" smallint,
    "defaultTargetID" char(5),
    color             char(7),
    normal            char(25),
    selected          char(25)
);

alter table sdg_goals
    owner to postgres;

create table sdg_indicators
(
    id                              smallint,
    id_estudio                      smallint,
    type_of_indicator               char(10),
    "prioritized_indicator_for_LAC" char(10),
    link_to_data                    char(128),
    link_to_metadata                char(128),
    "codigos_indicador_UNSD"        char(50),
    tier_classification             char(50),
    custodian_agency                char(128),
    agencia_custodia                char(128),
    partner_agency                  char(128),
    agencia_co_custodia             char(128),
    active                          smallint
);

alter table sdg_indicators
    owner to postgres;

