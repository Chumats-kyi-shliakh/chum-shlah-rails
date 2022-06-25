SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: cart_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    cart_id uuid NOT NULL,
    product_id uuid NOT NULL,
    quantity integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    customer_id uuid,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying,
    image_url character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: customer_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_orders (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    customer_id uuid NOT NULL,
    cart_id uuid NOT NULL,
    route jsonb,
    status integer DEFAULT 0 NOT NULL,
    geom public.geometry(Point,4326),
    country character varying,
    city character varying,
    postal_code character varying,
    street character varying,
    house_number character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: deliveries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.deliveries (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    route jsonb,
    driver_id uuid NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: delivery_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.delivery_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    outdated boolean DEFAULT false NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    delivery_id uuid NOT NULL,
    cart_item_id uuid NOT NULL,
    product_availability_id uuid NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: drivers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.drivers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    login character varying,
    encrypted_password character varying,
    online boolean,
    last_online timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: funds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.funds (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying,
    tg_bot_key character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: product_availabilities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_availabilities (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    storage_id bigint NOT NULL,
    product_id uuid NOT NULL,
    quantity integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    category_id uuid NOT NULL,
    name character varying,
    weight integer,
    height integer,
    width integer,
    length integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: storages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.storages (
    id bigint NOT NULL,
    fund_id uuid NOT NULL,
    name character varying,
    geom public.geometry(Point,4326),
    city character varying,
    street character varying,
    postal_code character varying,
    country character varying,
    house_number character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: storages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.storages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: storages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.storages_id_seq OWNED BY public.storages.id;


--
-- Name: storages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.storages ALTER COLUMN id SET DEFAULT nextval('public.storages_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: customer_orders customer_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_orders
    ADD CONSTRAINT customer_orders_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: deliveries deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (id);


--
-- Name: delivery_items delivery_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_items
    ADD CONSTRAINT delivery_items_pkey PRIMARY KEY (id);


--
-- Name: drivers drivers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_pkey PRIMARY KEY (id);


--
-- Name: funds funds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.funds
    ADD CONSTRAINT funds_pkey PRIMARY KEY (id);


--
-- Name: product_availabilities product_availabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_availabilities
    ADD CONSTRAINT product_availabilities_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: storages storages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.storages
    ADD CONSTRAINT storages_pkey PRIMARY KEY (id);


--
-- Name: customer_orders_geog_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customer_orders_geog_idx ON public.customer_orders USING gist (public.geography(geom));


--
-- Name: customer_orders_geom_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customer_orders_geom_idx ON public.customer_orders USING gist (geom);


--
-- Name: customer_orders_geom_ua_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customer_orders_geom_ua_idx ON public.customer_orders USING gist (public.st_transform(geom, 5558));


--
-- Name: index_cart_items_on_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cart_items_on_cart_id ON public.cart_items USING btree (cart_id);


--
-- Name: index_cart_items_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cart_items_on_product_id ON public.cart_items USING btree (product_id);


--
-- Name: index_carts_on_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_carts_on_customer_id ON public.carts USING btree (customer_id);


--
-- Name: index_customer_orders_on_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_customer_orders_on_cart_id ON public.customer_orders USING btree (cart_id);


--
-- Name: index_customer_orders_on_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_customer_orders_on_customer_id ON public.customer_orders USING btree (customer_id);


--
-- Name: index_deliveries_on_driver_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_deliveries_on_driver_id ON public.deliveries USING btree (driver_id);


--
-- Name: index_delivery_items_on_cart_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_delivery_items_on_cart_item_id ON public.delivery_items USING btree (cart_item_id);


--
-- Name: index_delivery_items_on_delivery_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_delivery_items_on_delivery_id ON public.delivery_items USING btree (delivery_id);


--
-- Name: index_delivery_items_on_product_availability_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_delivery_items_on_product_availability_id ON public.delivery_items USING btree (product_availability_id);


--
-- Name: index_product_availabilities_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_availabilities_on_product_id ON public.product_availabilities USING btree (product_id);


--
-- Name: index_product_availabilities_on_storage_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_product_availabilities_on_storage_id ON public.product_availabilities USING btree (storage_id);


--
-- Name: index_products_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_category_id ON public.products USING btree (category_id);


--
-- Name: index_storages_on_fund_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_storages_on_fund_id ON public.storages USING btree (fund_id);


--
-- Name: product_availabilities fk_rails_098016d482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_availabilities
    ADD CONSTRAINT fk_rails_098016d482 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: customer_orders fk_rails_13f33fda6c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_orders
    ADD CONSTRAINT fk_rails_13f33fda6c FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: delivery_items fk_rails_1c10c7f007; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_items
    ADD CONSTRAINT fk_rails_1c10c7f007 FOREIGN KEY (product_availability_id) REFERENCES public.product_availabilities(id);


--
-- Name: storages fk_rails_57db628dc5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.storages
    ADD CONSTRAINT fk_rails_57db628dc5 FOREIGN KEY (fund_id) REFERENCES public.funds(id);


--
-- Name: product_availabilities fk_rails_5d72fce676; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_availabilities
    ADD CONSTRAINT fk_rails_5d72fce676 FOREIGN KEY (storage_id) REFERENCES public.storages(id);


--
-- Name: cart_items fk_rails_681a180e84; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fk_rails_681a180e84 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: cart_items fk_rails_6cdb1f0139; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT fk_rails_6cdb1f0139 FOREIGN KEY (cart_id) REFERENCES public.carts(id);


--
-- Name: delivery_items fk_rails_9005a01569; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_items
    ADD CONSTRAINT fk_rails_9005a01569 FOREIGN KEY (cart_item_id) REFERENCES public.cart_items(id);


--
-- Name: customer_orders fk_rails_9d1bd81116; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_orders
    ADD CONSTRAINT fk_rails_9d1bd81116 FOREIGN KEY (cart_id) REFERENCES public.carts(id);


--
-- Name: delivery_items fk_rails_abaa99d81a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_items
    ADD CONSTRAINT fk_rails_abaa99d81a FOREIGN KEY (delivery_id) REFERENCES public.deliveries(id);


--
-- Name: deliveries fk_rails_dbbcd08797; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT fk_rails_dbbcd08797 FOREIGN KEY (driver_id) REFERENCES public.drivers(id);


--
-- Name: carts fk_rails_e02ab95379; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fk_rails_e02ab95379 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: products fk_rails_fb915499a4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_fb915499a4 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20220624122941'),
('20220624122942'),
('20220624125534'),
('20220624130743'),
('20220624130854'),
('20220624131154'),
('20220624132248'),
('20220624133729'),
('20220624142951'),
('20220624142952'),
('20220624143213'),
('20220624143944'),
('20220624144233'),
('20220624211155');


