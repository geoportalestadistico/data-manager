-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION postgres;

COMMENT ON SCHEMA public IS 'standard public schema';


CREATE SEQUENCE public.dato_gen_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.desagregaciones_default_cd_id_seq;

CREATE SEQUENCE public.desagregaciones_default_cd_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.desagregaciones_no_seleccionadas_id_seq;

CREATE SEQUENCE public.desagregaciones_no_seleccionadas_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.desagregaciones_seleccionadas_id_seq;

CREATE SEQUENCE public.desagregaciones_seleccionadas_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.dimension_id_seq;

CREATE SEQUENCE public.dimension_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.django_admin_log_id_seq;


CREATE SEQUENCE public.estadistica_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.estructura_default_cd_id_seq;

CREATE SEQUENCE public.estructura_default_cd_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.estructura_default_id_seq;

CREATE SEQUENCE public.estructura_default_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.estudio_id_seq;

CREATE SEQUENCE public.estudio_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.fuente_id_seq;

CREATE SEQUENCE public.fuente_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.fuente_principal_id_seq;

CREATE SEQUENCE public.fuente_principal_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.fuente_relacionada_id_seq;

CREATE SEQUENCE public.fuente_relacionada_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.indicador_id_seq;

CREATE SEQUENCE public.indicador_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.langs_id_seq;

CREATE SEQUENCE public.langs_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.modelos_fuente_id_seq;

CREATE SEQUENCE public.modelos_fuente_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.modelos_indicador_id_seq;

CREATE SEQUENCE public.modelos_indicador_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.modelos_indicador_id_seq1;

CREATE SEQUENCE public.modelos_indicador_id_seq1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.nota_id_seq;

CREATE SEQUENCE public.nota_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.novedades_id_seq;

CREATE SEQUENCE public.novedades_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.organizacion_id_seq;

CREATE SEQUENCE public.organizacion_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.paginas_estudio_id_seq;

CREATE SEQUENCE public.paginas_estudio_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.paginas_id_seq;

CREATE SEQUENCE public.paginas_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.parameters_id_seq;

CREATE SEQUENCE public.parameters_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.parametros_anuario_estadistico_id_seq;

CREATE SEQUENCE public.parametros_anuario_estadistico_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.relacion_dimension_dato_id_seq;

CREATE SEQUENCE public.relacion_dimension_dato_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.relacion_indicador_estudio_id_seq;

CREATE SEQUENCE public.relacion_indicador_estudio_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;-- public.auth_group definition

-- Drop table

-- DROP TABLE public.auth_group;


-- public.estadistica definition

-- Drop table

-- DROP TABLE public.estadistica;

CREATE TABLE public.estadistica (
	id smallserial NOT NULL,
	orden int2 NULL,
	nombre varchar(100) NULL,
	descripcion varchar(500) NULL,
	descripcion_ingles varchar(500) NULL,
	descripcion_frances varchar(100) NULL,
	descripcion_portugues varchar(100) NULL,
	visible int4 NULL,
	email_contacto varchar(100) NULL,
	version_multidimensional_habilitada int4 NULL,
	muestra_opciones_adm_multidimensional int4 NULL,
	color_fondo_consulta_flash varchar(50) NULL,
	version_integrada_habilitada int2 NULL,
	top_flash_aplicacion varchar(50) NULL,
	CONSTRAINT estadistica_pkey PRIMARY KEY (id)
);


-- public.indicador definition

-- Drop table

-- DROP TABLE public.indicador;

CREATE TABLE public.indicador (
	id serial4 NOT NULL,
	descripcion varchar(1500) NULL,
	descripcion_ingles varchar(1500) NULL,
	descripcion_frances varchar(1500) NULL,
	descripcion_portugues varchar(1500) NULL,
	definicion text NULL,
	definicion_ingles text NULL,
	definicion_frances text NULL,
	definicion_portugues text NULL,
	periodo_inicial varchar(10) NULL,
	periodo_final varchar(10) NULL,
	unidad_de_medida varchar(200) NULL,
	unidad_de_medida_ingles varchar(200) NULL,
	unidad_de_medida_frances varchar(200) NULL,
	unidad_de_medida_portugues varchar(200) NULL,
	orden int2 NULL,
	nota text NULL,
	nota_ingles text NULL,
	nota_frances text NULL,
	nota_portugues text NULL,
	comentarios text NULL,
	metodologia_calculo text NULL,
	tipo_dato text NULL,
	indicador_listo int2 NULL,
	flag_anuario int4 NULL,
	flag_milenio int4 NULL,
	flag_panorama int4 NULL,
	flag_cmdsn int4 NULL,
	flag_datos varchar(1) NULL,
	flag_ficha varchar(1) NULL,
	tipo_dato_ingles text NULL,
	tipo_dato_frances text NULL,
	tipo_dato_portugues text NULL,
	metodologia_calculo_ingles text NULL,
	metodologia_calculo_frances text NULL,
	metodologia_calculo_portugues text NULL,
	comentarios_ingles text NULL,
	comentarios_frances text NULL,
	comentarios_portugues text NULL,
	numero_decimales_consulta int4 NULL,
	servidor_datos int2 NULL,
	elimina_filas_consulta int2 NULL,
	fecha_ultima_actualizacion_revision timestamp NULL,
	actualizado_por varchar(50) NULL,
	revisado_por varchar(50) NULL,
	fecha_ultimo_ingreso_masivo varchar(25) NULL,
	indicador_estandarizado int2 NULL,
	CONSTRAINT indicador_pkey PRIMARY KEY (id)
);


-- public.langs definition

-- Drop table

-- DROP TABLE public.langs;

CREATE TABLE public.langs (
	id serial4 NOT NULL,
	name_es varchar(10) NULL,
	name_en varchar(10) NULL,
	name_fr varchar(10) NULL,
	name_pt varchar(10) NULL,
	code varchar(2) NULL,
	"order" int4 NULL,
	CONSTRAINT "Langs_pkey" PRIMARY KEY (id)
);


-- public.parameters definition

-- Drop table

-- DROP TABLE public.parameters;

CREATE TABLE public.parameters (
	id serial4 NOT NULL,
	description text NULL,
	value text NULL,
	"datatype" varchar(255) NULL,
	"timestamp" timestamp NULL,
	CONSTRAINT parameters_pkey PRIMARY KEY (id)
);


-- public.responsable definition

-- Drop table

-- DROP TABLE public.responsable;

CREATE TABLE public.responsable (
	id serial4 NOT NULL,
	id_supervisor int4 NULL,
	nombre varchar(50) NULL,
	email varchar(50) NULL,
	CONSTRAINT "Responsable_pkey" PRIMARY KEY (id)
);


-- public.auth_permission definition

-- Drop table


-- Drop table

-- DROP TABLE public.estudio;

CREATE TABLE public.estudio (
	id_estadistica int2 NULL,
	id smallserial NOT NULL,
	descripcion varchar(1000) NULL,
	link varchar(250) NULL,
	descripcion_ingles varchar(1000) NULL,
	link_ingles varchar(250) NULL,
	indentacion int2 NULL,
	orden int4 NULL,
	descripcion_larga text NULL,
	descripcion_larga_ingles text NULL,
	visible int2 NULL,
	color_fondo_consulta_flash varchar(50) NULL,
	pertenece_a_bdi int2 NULL,
	link_frances varchar(250) NULL,
	link_portugues varchar(250) NULL,
	descripcion_frances varchar(100) NULL,
	descripcion_portugues varchar(100) NULL,
	descripcion_larga_frances text NULL,
	descripcion_larga_portugues text NULL,
	CONSTRAINT estudio_pkey PRIMARY KEY (id),
	CONSTRAINT fk_estudio_estadistica FOREIGN KEY (id_estadistica) REFERENCES public.estadistica(id)
);


-- public.modelos_tema definition

-- Drop table

-- DROP TABLE public.modelos_tema;

CREATE TABLE public.modelos_tema (
	id int8 NOT NULL DEFAULT nextval('modelos_indicador_id_seq'::regclass),
	tn_ancestors_pks text NOT NULL,
	tn_ancestors_count int4 NOT NULL,
	tn_children_pks text NOT NULL,
	tn_children_count int4 NOT NULL,
	tn_depth int4 NOT NULL,
	tn_descendants_pks text NOT NULL,
	tn_descendants_count int4 NOT NULL,
	tn_index int4 NOT NULL,
	tn_level int4 NOT NULL,
	tn_priority int4 NOT NULL,
	tn_order int4 NOT NULL,
	tn_siblings_pks text NOT NULL,
	tn_siblings_count int4 NOT NULL,
	slug varchar(255) NOT NULL,
	nombre varchar(100) NOT NULL,
	definicion text NULL,
	nota text NULL,
	dimensiones_desagregaciones varchar(100) NULL,
	created_at timestamptz NOT NULL,
	updated_at timestamptz NOT NULL,
	tn_parent_id int8 NULL,
	CONSTRAINT modelos_indicador_pkey PRIMARY KEY (id),
	CONSTRAINT modelos_indicador_slug_key UNIQUE (slug),
	CONSTRAINT modelos_indicador_tn_ancestors_count_check CHECK ((tn_ancestors_count >= 0)),
	CONSTRAINT modelos_indicador_tn_children_count_check CHECK ((tn_children_count >= 0)),
	CONSTRAINT modelos_indicador_tn_depth_check CHECK ((tn_depth >= 0)),
	CONSTRAINT modelos_indicador_tn_descendants_count_check CHECK ((tn_descendants_count >= 0)),
	CONSTRAINT modelos_indicador_tn_index_check CHECK ((tn_index >= 0)),
	CONSTRAINT modelos_indicador_tn_level_check CHECK ((tn_level >= 0)),
	CONSTRAINT modelos_indicador_tn_order_check CHECK ((tn_order >= 0)),
	CONSTRAINT modelos_indicador_tn_priority_check CHECK ((tn_priority >= 0)),
	CONSTRAINT modelos_indicador_tn_siblings_count_check CHECK ((tn_siblings_count >= 0)),
	CONSTRAINT modelos_tema_tn_parent_id_edb38a00_fk_modelos_tema_id FOREIGN KEY (tn_parent_id) REFERENCES public.modelos_tema(id) DEFERRABLE INITIALLY DEFERRED
);
CREATE INDEX modelos_indicador_slug_4b30c257_like ON public.modelos_tema USING btree (slug varchar_pattern_ops);
CREATE INDEX modelos_indicador_tn_parent_id_6714ba85 ON public.modelos_tema USING btree (tn_parent_id);


-- public.nota definition

-- Drop table

-- DROP TABLE public.nota;

CREATE TABLE public.nota (
	id serial4 NOT NULL,
	id_estadistica int2 NULL,
	nota varchar(1500) NULL,
	nota_ingles varchar(1500) NULL,
	nota_frances varchar(1500) NULL,
	nota_portugues varchar(1500) NULL,
	CONSTRAINT nota_pkey PRIMARY KEY (id),
	CONSTRAINT fk_nota_estadistica FOREIGN KEY (id_estadistica) REFERENCES public.estadistica(id)
);


-- public.novedades definition

-- Drop table

-- DROP TABLE public.novedades;

CREATE TABLE public.novedades (
	id serial4 NOT NULL,
	id_estadistica int2 NULL,
	fecha timestamp NULL,
	novedad text NULL,
	novedad_ingles text NULL,
	CONSTRAINT novedades_pkey PRIMARY KEY (id),
	CONSTRAINT fk_novedades_estadistica FOREIGN KEY (id_estadistica) REFERENCES public.estadistica(id)
);


-- public.organizacion definition

-- Drop table

-- DROP TABLE public.organizacion;

CREATE TABLE public.organizacion (
	id serial4 NOT NULL,
	id_estadistica int2 NULL,
	sigla_organismo varchar(50) NULL,
	nombre varchar(400) NULL,
	url varchar(200) NULL,
	sigla_organismo_ingles varchar(50) NULL,
	nombre_ingles varchar(400) NULL,
	sigla_organismo_frances varchar(50) NULL,
	sigla_organismo_portugues varchar(50) NULL,
	nombre_frances varchar(400) NULL,
	nombre_portugues varchar(400) NULL,
	CONSTRAINT organizacion_pkey PRIMARY KEY (id),
	CONSTRAINT fk_organizacion_estadistica FOREIGN KEY (id_estadistica) REFERENCES public.estadistica(id)
);


-- public.paginas definition

-- Drop table

-- DROP TABLE public.paginas;

CREATE TABLE public.paginas (
	id serial4 NOT NULL,
	id_estadistica int2 NULL,
	nombre varchar(50) NULL,
	nombre_ingles varchar(50) NULL,
	enlace varchar(200) NULL,
	orden int2 NULL,
	CONSTRAINT paginas_pkey PRIMARY KEY (id),
	CONSTRAINT fk_paginas_estadistica FOREIGN KEY (id_estadistica) REFERENCES public.estadistica(id)
);


-- public.paginas_estudio definition

-- Drop table

-- DROP TABLE public.paginas_estudio;

CREATE TABLE public.paginas_estudio (
	id serial4 NOT NULL,
	id_estudio int2 NULL,
	nombre varchar(50) NULL,
	nombre_ingles varchar(50) NULL,
	enlace varchar(200) NULL,
	orden int2 NULL,
	CONSTRAINT paginas_estudio_pkey PRIMARY KEY (id),
	CONSTRAINT fk_paginas_estudio_estudio FOREIGN KEY (id_estudio) REFERENCES public.estudio(id)
);


-- public.parametros_anuario_estadistico definition

-- Drop table

-- DROP TABLE public.parametros_anuario_estadistico;

CREATE TABLE public.parametros_anuario_estadistico (
	id serial4 NOT NULL,
	id_indicador int4 NULL,
	numero_tema varchar(10) NULL,
	numero_sub_tema varchar(10) NULL,
	numero_cuadro varchar(15) NULL,
	orden int4 NULL,
	descripcion_tema varchar(100) NULL,
	descripcion_tema_ingles varchar(100) NULL,
	descripcion_tema_frances varchar(100) NULL,
	descripcion_sub_tema varchar(100) NULL,
	descripcion_sub_tema_ingles varchar(100) NULL,
	descripcion_sub_tema_frances varchar(100) NULL,
	descripcion_espanol varchar(300) NULL,
	descripcion_ingles varchar(300) NULL,
	descripcion_frances varchar(200) NULL,
	unidad_medida varchar(200) NULL,
	unidad_medida_ingles varchar(200) NULL,
	unidad_medida_frances varchar(100) NULL,
	numero_decimales_desplegados int4 NULL,
	posicion_bilingue int4 NULL,
	lista_notas_deshabilitadas varchar(4000) NULL,
	comentarios varchar(100) NULL,
	id_estadistica_anuario int4 NULL,
	CONSTRAINT parametros_anuario_estadistico_pkey PRIMARY KEY (id),
	CONSTRAINT fk_parametros_anuario_estadistico_indicador FOREIGN KEY (id_indicador) REFERENCES public.indicador(id)
);


-- public.relacion_indicador_estudio definition

-- Drop table

-- DROP TABLE public.relacion_indicador_estudio;

CREATE TABLE public.relacion_indicador_estudio (
	id serial4 NOT NULL,
	id_indicador int4 NULL,
	id_estudio int2 NULL,
	orden int2 NULL,
	indicador_externo int2 NULL,
	CONSTRAINT relacion_indicador_estudio_pkey PRIMARY KEY (id),
	CONSTRAINT fk_relacion_indicador_estudio_estudio FOREIGN KEY (id_estudio) REFERENCES public.estudio(id),
	CONSTRAINT fk_relacion_indicador_estudio_indicador FOREIGN KEY (id_indicador) REFERENCES public.indicador(id)
);


-- public.relacion_indicador_responsable definition

-- Drop table

-- DROP TABLE public.relacion_indicador_responsable;

CREATE TABLE public.relacion_indicador_responsable (
	id int4 NOT NULL,
	id_indicador int4 NULL,
	id_responsable int4 NULL,
	fechas_actualizacion timestamptz NOT NULL,
	CONSTRAINT relacion_indicador_responsable_pkey PRIMARY KEY (id),
	CONSTRAINT fk_relacion_indicador_responsable_indicador FOREIGN KEY (id_indicador) REFERENCES public.indicador(id),
	CONSTRAINT fk_relacion_indicador_responsable_responsable FOREIGN KEY (id_responsable) REFERENCES public.responsable(id)
);


-- public.relacion_nota_parametro definition

-- Drop table

-- DROP TABLE public.relacion_nota_parametro;

CREATE TABLE public.relacion_nota_parametro (
	id serial4 NOT NULL,
	id_nota int4 NULL,
	id_parametro int4 NULL,
	descripcion_espanol varchar(1500) NULL,
	descripcion_ingles varchar(1500) NULL,
	CONSTRAINT "RelacionNotaParametro_pkey" PRIMARY KEY (id),
	CONSTRAINT fk_relacion_nota_parametro_nota FOREIGN KEY (id_nota) REFERENCES public.nota(id),
	CONSTRAINT fk_relacion_nota_parametro_parametros_anuario_estadistico FOREIGN KEY (id_parametro) REFERENCES public.parametros_anuario_estadistico(id)
);


-- public.tipo_dimension definition

-- Drop table

-- DROP TABLE public.tipo_dimension;

CREATE TABLE public.tipo_dimension (
	id serial4 NOT NULL,
	descripcion varchar(250) NULL,
	descripcion_ingles varchar(250) NULL,
	id_estadistica int2 NULL,
	CONSTRAINT "TipoDimension_pkey" PRIMARY KEY (id),
	CONSTRAINT fk_tipo_dimension_estadistica FOREIGN KEY (id_estadistica) REFERENCES public.estadistica(id)
);


-- public.auth_group_permissions definition

-- Drop table

-- DROP TABLE public.auth_group_permissions;

CREATE TABLE public.auth_group_permissions (
	id bigserial NOT NULL,
	group_id int4 NOT NULL,
	permission_id int4 NOT NULL,
	CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id),
	CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id),
	CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED,
	CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED
);
CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


-- public.desagregaciones_no_seleccionadas definition

-- Drop table

-- DROP TABLE public.desagregaciones_no_seleccionadas;

CREATE TABLE public.desagregaciones_no_seleccionadas (
	id serial4 NOT NULL,
	id_relacion int4 NULL,
	id_desagregacion int4 NULL,
	CONSTRAINT desagregaciones_no_seleccionadas_pkey PRIMARY KEY (id),
	CONSTRAINT fk_desagregaciones_no_seleccionadas_relacion_indicador_estudio FOREIGN KEY (id_relacion) REFERENCES public.relacion_indicador_estudio(id)
);


-- public.dimension definition

-- Drop table

-- DROP TABLE public.dimension;

CREATE TABLE public.dimension (
	id serial4 NOT NULL,
	id_raiz int4 NULL,
	id_padre int4 NULL,
	descripcion varchar(300) NULL,
	descripcion_ingles varchar(300) NULL,
	descripcion_frances varchar(300) NULL,
	descripcion_portugues varchar(300) NULL,
	orden int2 NULL,
	orden_anuario int2 NULL,
	id_nota int4 NULL,
	visible int2 NULL,
	id_tipo_dimension int4 NULL,
	operacion varchar(250) NULL,
	seleccion_default int2 NULL,
	iso_3 varchar(3) NULL,
	iso_numerico int4 NULL,
	CONSTRAINT "Dimension_pkey" PRIMARY KEY (id),
	CONSTRAINT fk_dimension_dimension FOREIGN KEY (id_padre) REFERENCES public.dimension(id),
	CONSTRAINT fk_dimension_nota FOREIGN KEY (id_nota) REFERENCES public.nota(id),
	CONSTRAINT fk_dimension_tipo_dimension FOREIGN KEY (id_tipo_dimension) REFERENCES public.tipo_dimension(id)
);


-- public.estructura_default definition

-- Drop table

-- DROP TABLE public.estructura_default;

CREATE TABLE public.estructura_default (
	id serial4 NOT NULL,
	id_parametro int4 NULL,
	id_dimension int4 NULL,
	posicion int2 NULL,
	orden int4 NULL,
	CONSTRAINT estructura_default_pkey PRIMARY KEY (id),
	CONSTRAINT fk_estructura_default_dimension FOREIGN KEY (id_dimension) REFERENCES public.dimension(id),
	CONSTRAINT fk_estructura_default_parametros_anuario_estadistico FOREIGN KEY (id_parametro) REFERENCES public.parametros_anuario_estadistico(id)
);


-- public.estructura_default_cd definition

-- Drop table

-- DROP TABLE public.estructura_default_cd;

CREATE TABLE public.estructura_default_cd (
	id serial4 NOT NULL,
	id_parametro int4 NULL,
	id_dimension int4 NULL,
	posicion int2 NULL,
	orden int4 NULL,
	CONSTRAINT estructura_default_cd_pkey PRIMARY KEY (id),
	CONSTRAINT fk_estructura_default_cd_dimension FOREIGN KEY (id_dimension) REFERENCES public.dimension(id),
	CONSTRAINT fk_estructura_default_cd_parametros_anuario_estadistico FOREIGN KEY (id_parametro) REFERENCES public.parametros_anuario_estadistico(id)
);


-- public.fuente definition

-- Drop table

-- DROP TABLE public.fuente;

CREATE TABLE public.fuente (
	id serial4 NOT NULL,
	id_estadistica int2 NULL,
	id_organizacion int4 NULL,
	nombre_publicacion varchar(1200) NULL,
	url varchar(250) NULL,
	nombre_publicacion_ingles varchar(1200) NULL,
	nombre_publicacion_frances varchar(1200) NULL,
	nombre_publicacion_portugues varchar(1200) NULL,
	CONSTRAINT "Fuente_pkey" PRIMARY KEY (id),
	CONSTRAINT fk_fuente_estadistica FOREIGN KEY (id_estadistica) REFERENCES public.estadistica(id),
	CONSTRAINT fk_fuente_organizacion FOREIGN KEY (id_organizacion) REFERENCES public.organizacion(id)
);


-- public.fuente_organizacion definition

-- Drop table

-- DROP TABLE public.fuente_organizacion;

CREATE TABLE public.fuente_organizacion (
	id_fuente int4 NOT NULL,
	id_organizacion int4 NULL,
	organizacion varchar(400) NULL,
	sigla varchar(50) NULL,
	url_organizacion varchar(200) NULL,
	publicacion varchar(1200) NULL,
	url_publicacion varchar(250) NULL,
	CONSTRAINT "Fuente_Organizacion_pkey" PRIMARY KEY (id_fuente),
	CONSTRAINT fk_fuente_organizacion_fuente FOREIGN KEY (id_fuente) REFERENCES public.fuente(id),
	CONSTRAINT fk_fuente_organizacion_organizacion FOREIGN KEY (id_organizacion) REFERENCES public.organizacion(id)
);


-- public.fuente_principal definition

-- Drop table

-- DROP TABLE public.fuente_principal;

CREATE TABLE public.fuente_principal (
	id serial4 NOT NULL,
	id_indicador int4 NULL,
	id_fuente int4 NULL,
	CONSTRAINT fuente_principal_pkey PRIMARY KEY (id),
	CONSTRAINT fk_fuente_principal_fuente FOREIGN KEY (id_fuente) REFERENCES public.fuente(id),
	CONSTRAINT fk_fuente_principal_indicador FOREIGN KEY (id_indicador) REFERENCES public.indicador(id)
);


-- public.fuente_relacionada definition

-- Drop table

-- DROP TABLE public.fuente_relacionada;

CREATE TABLE public.fuente_relacionada (
	id serial4 NOT NULL,
	id_indicador int4 NULL,
	id_fuente int4 NULL,
	CONSTRAINT fuente_relacionada_pkey PRIMARY KEY (id),
	CONSTRAINT fk_fuente_relacionada_fuente FOREIGN KEY (id_fuente) REFERENCES public.fuente(id),
	CONSTRAINT fk_fuente_relacionada_indicador FOREIGN KEY (id_indicador) REFERENCES public.indicador(id)
);


-- public.modelos_fuente definition

-- Drop table

-- DROP TABLE public.modelos_fuente;

CREATE TABLE public.modelos_fuente (
	id bigserial NOT NULL,
	orgnizacion varchar(100) NOT NULL,
	nombre_pub_espaniol varchar(250) NULL,
	nombre_pub_ingles varchar(250) NULL,
	nombre_pub_frances varchar(250) NULL,
	nombre_pub_portugues varchar(250) NULL,
	url varchar(200) NULL,
	created_at timestamptz NOT NULL,
	updated_at timestamptz NOT NULL,
	tema_id int8 NOT NULL,
	CONSTRAINT modelos_fuente_pkey PRIMARY KEY (id),
	CONSTRAINT modelos_fuente_tema_id_23889a5f_fk_modelos_tema_id FOREIGN KEY (tema_id) REFERENCES public.modelos_tema(id) DEFERRABLE INITIALLY DEFERRED
);
CREATE INDEX modelos_fuente_tema_id_23889a5f ON public.modelos_fuente USING btree (tema_id);


-- public.modelos_indicador definition

-- Drop table

-- DROP TABLE public.modelos_indicador;

CREATE TABLE public.modelos_indicador (
	id bigserial NOT NULL,
	nombre varchar(100) NOT NULL,
	unidad_medida varchar(100) NULL,
	metodologia_calculo varchar(100) NULL,
	created_at timestamptz NOT NULL,
	updated_at timestamptz NOT NULL,
	tema_id int8 NOT NULL,
	CONSTRAINT modelos_indicador_nombre_key UNIQUE (nombre),
	CONSTRAINT modelos_indicador_pkey1 PRIMARY KEY (id),
	CONSTRAINT modelos_indicador_tema_id_db472ce0_fk_modelos_tema_id FOREIGN KEY (tema_id) REFERENCES public.modelos_tema(id) DEFERRABLE INITIALLY DEFERRED
);
CREATE INDEX modelos_indicador_nombre_a9469bcb_like ON public.modelos_indicador USING btree (nombre varchar_pattern_ops);
CREATE INDEX modelos_indicador_tema_id_db472ce0 ON public.modelos_indicador USING btree (tema_id);


-- public.relacion_indicador_dimension definition

-- Drop table

-- DROP TABLE public.relacion_indicador_dimension;

CREATE TABLE public.relacion_indicador_dimension (
	id int4 NOT NULL,
	id_indicador int4 NULL,
	id_dimension int4 NULL,
	orden_calculo_operacion int4 NULL,
	posicion_default int2 NULL,
	orden int4 NULL,
	CONSTRAINT "RelacionIndicadorDimension_pkey" PRIMARY KEY (id),
	CONSTRAINT fk_relacion_indicador_dimension_dimension FOREIGN KEY (id_dimension) REFERENCES public.dimension(id),
	CONSTRAINT fk_relacion_indicador_dimension_indicador FOREIGN KEY (id_indicador) REFERENCES public.indicador(id)
);


-- public.desagregaciones_default_cd definition

-- Drop table

-- DROP TABLE public.desagregaciones_default_cd;

CREATE TABLE public.desagregaciones_default_cd (
	id serial4 NOT NULL,
	id_parametro int4 NULL,
	id_dimension int4 NULL,
	CONSTRAINT desagregaciones_default_cd_pkey PRIMARY KEY (id),
	CONSTRAINT fk_desagregaciones_default_cd_dimension FOREIGN KEY (id_dimension) REFERENCES public.dimension(id),
	CONSTRAINT fk_desagregaciones_default_cd_parametros_anuario_estadistico FOREIGN KEY (id_parametro) REFERENCES public.parametros_anuario_estadistico(id)
);


-- public.desagregaciones_seleccionadas definition

-- Drop table

-- DROP TABLE public.desagregaciones_seleccionadas;

CREATE TABLE public.desagregaciones_seleccionadas (
	id serial4 NOT NULL,
	id_indicador int4 NULL,
	id_dimension int4 NULL,
	CONSTRAINT desagregaciones_seleccionadas_pkey PRIMARY KEY (id),
	CONSTRAINT fk_desagregaciones_seleccionadas_dimension FOREIGN KEY (id_dimension) REFERENCES public.dimension(id),
	CONSTRAINT fk_desagregaciones_seleccionadas_indicador FOREIGN KEY (id_indicador) REFERENCES public.indicador(id)
);


-- public.dato_gen definition

-- Drop table

-- DROP TABLE public.dato_gen;

CREATE TABLE public.dato_gen (
	id serial4 NOT NULL,
	id_fuente int4 NULL,
	dato numeric(38, 22) NULL,
	dato_cualitativo varchar(20) NULL,
	CONSTRAINT "DatoGen_pkey" PRIMARY KEY (id)
);


-- public.relacion_dimension_dato definition

-- Drop table

-- DROP TABLE public.relacion_dimension_dato;

CREATE TABLE public.relacion_dimension_dato (
	id serial4 NOT NULL,
	id_dimension int4 NULL,
	id_dato int4 NULL,
	id_indicador int4 NULL,
	CONSTRAINT "RelacionDimensionDato_pkey" PRIMARY KEY (id)
);


-- public.relacion_nota_dato definition

-- Drop table

-- DROP TABLE public.relacion_nota_dato;

CREATE TABLE public.relacion_nota_dato (
	id int4 NOT NULL,
	id_nota int4 NULL,
	id_dato int4 NULL,
	CONSTRAINT "RelacionNotaDato_pkey" PRIMARY KEY (id)
);


-- public.dato_gen foreign keys

ALTER TABLE public.dato_gen ADD CONSTRAINT fk_dato_gen_relacion_nota_dato FOREIGN KEY (id_fuente) REFERENCES public.relacion_nota_dato(id);


-- public.relacion_dimension_dato foreign keys

ALTER TABLE public.relacion_dimension_dato ADD CONSTRAINT fk_relacion_dimension_dato_dimension FOREIGN KEY (id_dimension) REFERENCES public.dimension(id);
ALTER TABLE public.relacion_dimension_dato ADD CONSTRAINT fk_relacion_dimension_dato_gen FOREIGN KEY (id_dato) REFERENCES public.dato_gen(id);
ALTER TABLE public.relacion_dimension_dato ADD CONSTRAINT fk_relacion_dimension_dato_indicador FOREIGN KEY (id_indicador) REFERENCES public.indicador(id);


-- public.relacion_nota_dato foreign keys

ALTER TABLE public.relacion_nota_dato ADD CONSTRAINT fk_relacion_nota_dato_dato_gen FOREIGN KEY (id_dato) REFERENCES public.dato_gen(id);
ALTER TABLE public.relacion_nota_dato ADD CONSTRAINT fk_relacion_nota_dato_nota FOREIGN KEY (id_nota) REFERENCES public.nota(id);
