CREATE TABLE IF NOT EXISTS public.products
(
    product_id character varying(150) COLLATE pg_catalog."default" NOT NULL,
    sku_id character varying(100) COLLATE pg_catalog."default" NOT NULL,
    product_brand_id character varying(50) COLLATE pg_catalog."default" NOT NULL,
    product_name character varying(200) COLLATE pg_catalog."default" NOT NULL,
    category character varying(20) COLLATE pg_catalog."default" NOT NULL,
    price numeric(10,2) NOT NULL,
    upc character varying(14) COLLATE pg_catalog."default",
    canonical_data jsonb NOT NULL,
    overall_confidence numeric(3,2),
    needs_review boolean DEFAULT false,
    review_status character varying(20) COLLATE pg_catalog."default",
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    updated_at timestamp with time zone NOT NULL DEFAULT now(),
    version integer NOT NULL DEFAULT 1,
    status character varying(20) COLLATE pg_catalog."default" NOT NULL DEFAULT 'active'::character varying,
    source_file character varying(500) COLLATE pg_catalog."default",
    CONSTRAINT products_pkey PRIMARY KEY (product_id),
    CONSTRAINT products_product_brand_id_fkey FOREIGN KEY (product_brand_id)
        REFERENCES public.product_brands (brand_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT check_category CHECK (category::text = ANY (ARRAY['grocery'::character varying, 'apparel'::character varying, 'pharma'::character varying, 'footwear'::character varying]::text[])),
    CONSTRAINT check_review_status CHECK (review_status::text = ANY (ARRAY['pending'::character varying, 'in_review'::character varying, 'approved'::character varying, 'rejected'::character varying]::text[])),
    CONSTRAINT check_product_status CHECK (status::text = ANY (ARRAY['active'::character varying, 'inactive'::character varying, 'deleted'::character varying]::text[])),
    CONSTRAINT valid_upc CHECK (upc IS NULL OR upc::text ~ '^[0-9]{12,14}$'::text),
    CONSTRAINT check_price_range CHECK (price >= 0.01 AND price <= 999999.99)
)
