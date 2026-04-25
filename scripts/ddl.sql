CREATE TABLE IF NOT EXISTS public.canonical_products
(
    id character varying(100) COLLATE pg_catalog."default" NOT NULL,
    job_id character varying(100) COLLATE pg_catalog."default" NOT NULL,
    brand_id character varying(100) COLLATE pg_catalog."default",
    product_id character varying(100) COLLATE pg_catalog."default",
    canonical_data jsonb NOT NULL,
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    updated_at timestamp with time zone NOT NULL DEFAULT now(),
    CONSTRAINT canonical_products_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.canonical_schema
(
    id character varying(100) COLLATE pg_catalog."default" NOT NULL,
    name character varying(200) COLLATE pg_catalog."default" NOT NULL,
    version character varying(50) COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default",
    schema_data jsonb NOT NULL,
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    updated_at timestamp with time zone NOT NULL DEFAULT now(),
    created_by character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT canonical_schema_pkey PRIMARY KEY (id),
    CONSTRAINT canonical_schema_name_version_key UNIQUE (name, version)
);