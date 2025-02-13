PGDMP      &                }            Draaisa    17.2    17.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    17237    Draaisa    DATABASE     |   CREATE DATABASE "Draaisa" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "Draaisa";
                     postgres    false            �            1259    17402 	   categoria    TABLE     �   CREATE TABLE public.categoria (
    idcategoria integer NOT NULL,
    nombrecategoria character varying(100) NOT NULL,
    desccategoria text
);
    DROP TABLE public.categoria;
       public         heap r       postgres    false            �            1259    17401    categoria_idcategoria_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_idcategoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.categoria_idcategoria_seq;
       public               postgres    false    239            �           0    0    categoria_idcategoria_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.categoria_idcategoria_seq OWNED BY public.categoria.idcategoria;
          public               postgres    false    238            �            1259    17310    cliente    TABLE     �  CREATE TABLE public.cliente (
    idcliente integer NOT NULL,
    nombrecliente character varying(100) NOT NULL,
    nombrefcliente character varying(100),
    cpcliente integer,
    noextcliente integer,
    nointcliente integer,
    rfccliente character varying(13),
    municipio character varying(100),
    estado character varying(50),
    calle character varying(100),
    colonia character varying(100),
    ciudad character varying(100),
    pais character varying(50),
    telefonocliente character varying(15),
    correocliente character varying(100),
    curpcliente character varying(18),
    pfisicacliente boolean DEFAULT true
);
    DROP TABLE public.cliente;
       public         heap r       postgres    false            �            1259    17309    cliente_idcliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.cliente_idcliente_seq;
       public               postgres    false    228            �           0    0    cliente_idcliente_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.cliente_idcliente_seq OWNED BY public.cliente.idcliente;
          public               postgres    false    227            �            1259    17440    clientecategoria    TABLE     k   CREATE TABLE public.clientecategoria (
    idcliente integer NOT NULL,
    idcategoria integer NOT NULL
);
 $   DROP TABLE public.clientecategoria;
       public         heap r       postgres    false            �            1259    17336    empresa    TABLE     V  CREATE TABLE public.empresa (
    idempresa integer NOT NULL,
    nombreemp character varying(100) NOT NULL,
    cpempresa integer,
    noextempresa integer,
    nointempresa integer,
    rfcempresa character varying(13),
    municipio character varying(100),
    estado character varying(50),
    calle character varying(100),
    colonia character varying(100),
    ciudad character varying(100),
    pais character varying(50),
    telefonoempresa character varying(15),
    correoempresa character varying(100),
    curpempresa character varying(18),
    pfisicaempresa boolean DEFAULT true
);
    DROP TABLE public.empresa;
       public         heap r       postgres    false            �            1259    17335    empresa_idempresa_seq    SEQUENCE     �   CREATE SEQUENCE public.empresa_idempresa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.empresa_idempresa_seq;
       public               postgres    false    231            �           0    0    empresa_idempresa_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.empresa_idempresa_seq OWNED BY public.empresa.idempresa;
          public               postgres    false    230            �            1259    17455    empresacategoria    TABLE     k   CREATE TABLE public.empresacategoria (
    idempresa integer NOT NULL,
    idcategoria integer NOT NULL
);
 $   DROP TABLE public.empresacategoria;
       public         heap r       postgres    false            �            1259    17284 
   fabricante    TABLE     {  CREATE TABLE public.fabricante (
    idfabricante integer NOT NULL,
    nombrefabricante character varying(100) NOT NULL,
    cpfabricante integer,
    noextfabricante integer,
    nointfabricante integer,
    rfcfabricante character varying(13),
    municipio character varying(100),
    estado character varying(50),
    calle character varying(100),
    colonia character varying(100),
    ciudad character varying(100),
    pais character varying(50),
    telefonofabricante character varying(15),
    correofabricante character varying(100),
    curpfabricante character varying(18),
    pfisicafabricante boolean DEFAULT true
);
    DROP TABLE public.fabricante;
       public         heap r       postgres    false            �            1259    17283    fabricante_idfabricante_seq    SEQUENCE     �   CREATE SEQUENCE public.fabricante_idfabricante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.fabricante_idfabricante_seq;
       public               postgres    false    225            �           0    0    fabricante_idfabricante_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.fabricante_idfabricante_seq OWNED BY public.fabricante.idfabricante;
          public               postgres    false    224            �            1259    17470    fabricantecategoria    TABLE     q   CREATE TABLE public.fabricantecategoria (
    idfabricante integer NOT NULL,
    idcategoria integer NOT NULL
);
 '   DROP TABLE public.fabricantecategoria;
       public         heap r       postgres    false            �            1259    17492    prestadorruta    TABLE     e   CREATE TABLE public.prestadorruta (
    idprestador integer NOT NULL,
    idruta integer NOT NULL
);
 !   DROP TABLE public.prestadorruta;
       public         heap r       postgres    false            �            1259    17362    prestadorservicio    TABLE     p  CREATE TABLE public.prestadorservicio (
    idprestador integer NOT NULL,
    nombreprestador character varying(100) NOT NULL,
    cpprestador integer,
    noextprestador integer,
    nointprestador integer,
    rfcprestador character varying(13),
    municipio character varying(100),
    estado character varying(50),
    calle character varying(100),
    colonia character varying(100),
    ciudad character varying(100),
    pais character varying(50),
    telefonoprest character varying(15),
    correoprest character varying(100),
    curpprestador character varying(18),
    pfisicaprestador boolean DEFAULT true
);
 %   DROP TABLE public.prestadorservicio;
       public         heap r       postgres    false            �            1259    17361 !   prestadorservicio_idprestador_seq    SEQUENCE     �   CREATE SEQUENCE public.prestadorservicio_idprestador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.prestadorservicio_idprestador_seq;
       public               postgres    false    234            �           0    0 !   prestadorservicio_idprestador_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.prestadorservicio_idprestador_seq OWNED BY public.prestadorservicio.idprestador;
          public               postgres    false    233            �            1259    17248    producto    TABLE     �   CREATE TABLE public.producto (
    idproducto integer NOT NULL,
    nombreproducto character varying(100) NOT NULL,
    fichaproducto text,
    alternoproducto character varying(100),
    existenciaproducto integer DEFAULT 0
);
    DROP TABLE public.producto;
       public         heap r       postgres    false            �            1259    17247    producto_idproducto_seq    SEQUENCE     �   CREATE SEQUENCE public.producto_idproducto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.producto_idproducto_seq;
       public               postgres    false    220            �           0    0    producto_idproducto_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.producto_idproducto_seq OWNED BY public.producto.idproducto;
          public               postgres    false    219            �            1259    17410    productocategoria    TABLE     m   CREATE TABLE public.productocategoria (
    idproducto integer NOT NULL,
    idcategoria integer NOT NULL
);
 %   DROP TABLE public.productocategoria;
       public         heap r       postgres    false            �            1259    17319    productocliente    TABLE     ^  CREATE TABLE public.productocliente (
    idproducto integer NOT NULL,
    idcliente integer NOT NULL,
    costoventa double precision NOT NULL,
    monedaventa character varying(3) NOT NULL,
    CONSTRAINT productocliente_monedaventa_check CHECK (((monedaventa)::text = ANY ((ARRAY['MXN'::character varying, 'USD'::character varying])::text[])))
);
 #   DROP TABLE public.productocliente;
       public         heap r       postgres    false            �            1259    17345    productoempresa    TABLE     f  CREATE TABLE public.productoempresa (
    idproducto integer NOT NULL,
    idempresa integer NOT NULL,
    costomercado double precision NOT NULL,
    monedamercado character varying(3) NOT NULL,
    CONSTRAINT productoempresa_monedamercado_check CHECK (((monedamercado)::text = ANY ((ARRAY['MXN'::character varying, 'USD'::character varying])::text[])))
);
 #   DROP TABLE public.productoempresa;
       public         heap r       postgres    false            �            1259    17293    productofabricante    TABLE     w  CREATE TABLE public.productofabricante (
    idproducto integer NOT NULL,
    idfabricante integer NOT NULL,
    costocomprafab double precision NOT NULL,
    monedacomprafab character varying(3) NOT NULL,
    CONSTRAINT productofabricante_monedacomprafab_check CHECK (((monedacomprafab)::text = ANY ((ARRAY['MXN'::character varying, 'USD'::character varying])::text[])))
);
 &   DROP TABLE public.productofabricante;
       public         heap r       postgres    false            �            1259    17267    productoproveedor    TABLE     x  CREATE TABLE public.productoproveedor (
    idproducto integer NOT NULL,
    idproveedor integer NOT NULL,
    costocompraprov double precision NOT NULL,
    monedacompraprov character varying(3) NOT NULL,
    CONSTRAINT productoproveedor_monedacompraprov_check CHECK (((monedacompraprov)::text = ANY ((ARRAY['MXN'::character varying, 'USD'::character varying])::text[])))
);
 %   DROP TABLE public.productoproveedor;
       public         heap r       postgres    false            �            1259    17386    productoservicio    TABLE     k   CREATE TABLE public.productoservicio (
    idproducto integer NOT NULL,
    idservicio integer NOT NULL
);
 $   DROP TABLE public.productoservicio;
       public         heap r       postgres    false            �            1259    17258 	   proveedor    TABLE     W  CREATE TABLE public.proveedor (
    idproveedor integer NOT NULL,
    nombreprov character varying(100) NOT NULL,
    cpproveedor integer,
    noextprov integer,
    nointprov integer,
    rfcproveedor character varying(13),
    municipio character varying(100),
    estado character varying(50),
    calle character varying(100),
    colonia character varying(100),
    ciudad character varying(100),
    pais character varying(50),
    telefonoprov character varying(15),
    correoprov character varying(100),
    curpproveedor character varying(18),
    pfisicaproveedor boolean DEFAULT true
);
    DROP TABLE public.proveedor;
       public         heap r       postgres    false            �            1259    17257    proveedor_idproveedor_seq    SEQUENCE     �   CREATE SEQUENCE public.proveedor_idproveedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.proveedor_idproveedor_seq;
       public               postgres    false    222            �           0    0    proveedor_idproveedor_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.proveedor_idproveedor_seq OWNED BY public.proveedor.idproveedor;
          public               postgres    false    221            �            1259    17425    proveedorcategoria    TABLE     o   CREATE TABLE public.proveedorcategoria (
    idproveedor integer NOT NULL,
    idcategoria integer NOT NULL
);
 &   DROP TABLE public.proveedorcategoria;
       public         heap r       postgres    false            �            1259    17486    ruta    TABLE     �   CREATE TABLE public.ruta (
    idruta integer NOT NULL,
    salidaruta character varying(100) NOT NULL,
    destinoruta character varying(100) NOT NULL
);
    DROP TABLE public.ruta;
       public         heap r       postgres    false            �            1259    17485    ruta_idruta_seq    SEQUENCE     �   CREATE SEQUENCE public.ruta_idruta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.ruta_idruta_seq;
       public               postgres    false    246            �           0    0    ruta_idruta_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.ruta_idruta_seq OWNED BY public.ruta.idruta;
          public               postgres    false    245            �            1259    17372    servicio    TABLE     |  CREATE TABLE public.servicio (
    idservicio integer NOT NULL,
    idprestador integer,
    descripcionservicio text NOT NULL,
    costoservicio double precision NOT NULL,
    monedaservicio character varying(3) NOT NULL,
    CONSTRAINT servicio_monedaservicio_check CHECK (((monedaservicio)::text = ANY ((ARRAY['MXN'::character varying, 'USD'::character varying])::text[])))
);
    DROP TABLE public.servicio;
       public         heap r       postgres    false            �            1259    17371    servicio_idservicio_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_idservicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.servicio_idservicio_seq;
       public               postgres    false    236            �           0    0    servicio_idservicio_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.servicio_idservicio_seq OWNED BY public.servicio.idservicio;
          public               postgres    false    235            �            1259    17239    usuario    TABLE     �   CREATE TABLE public.usuario (
    idusuario integer NOT NULL,
    nombreusuario character varying(50) NOT NULL,
    contrasenausuario character varying(255) NOT NULL,
    permiso boolean DEFAULT false
);
    DROP TABLE public.usuario;
       public         heap r       postgres    false            �            1259    17238    usuario_idusuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.usuario_idusuario_seq;
       public               postgres    false    218            �           0    0    usuario_idusuario_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.usuario_idusuario_seq OWNED BY public.usuario.idusuario;
          public               postgres    false    217            �           2604    17405    categoria idcategoria    DEFAULT     ~   ALTER TABLE ONLY public.categoria ALTER COLUMN idcategoria SET DEFAULT nextval('public.categoria_idcategoria_seq'::regclass);
 D   ALTER TABLE public.categoria ALTER COLUMN idcategoria DROP DEFAULT;
       public               postgres    false    239    238    239            �           2604    17313    cliente idcliente    DEFAULT     v   ALTER TABLE ONLY public.cliente ALTER COLUMN idcliente SET DEFAULT nextval('public.cliente_idcliente_seq'::regclass);
 @   ALTER TABLE public.cliente ALTER COLUMN idcliente DROP DEFAULT;
       public               postgres    false    228    227    228            �           2604    17339    empresa idempresa    DEFAULT     v   ALTER TABLE ONLY public.empresa ALTER COLUMN idempresa SET DEFAULT nextval('public.empresa_idempresa_seq'::regclass);
 @   ALTER TABLE public.empresa ALTER COLUMN idempresa DROP DEFAULT;
       public               postgres    false    230    231    231            �           2604    17287    fabricante idfabricante    DEFAULT     �   ALTER TABLE ONLY public.fabricante ALTER COLUMN idfabricante SET DEFAULT nextval('public.fabricante_idfabricante_seq'::regclass);
 F   ALTER TABLE public.fabricante ALTER COLUMN idfabricante DROP DEFAULT;
       public               postgres    false    224    225    225            �           2604    17365    prestadorservicio idprestador    DEFAULT     �   ALTER TABLE ONLY public.prestadorservicio ALTER COLUMN idprestador SET DEFAULT nextval('public.prestadorservicio_idprestador_seq'::regclass);
 L   ALTER TABLE public.prestadorservicio ALTER COLUMN idprestador DROP DEFAULT;
       public               postgres    false    233    234    234            �           2604    17251    producto idproducto    DEFAULT     z   ALTER TABLE ONLY public.producto ALTER COLUMN idproducto SET DEFAULT nextval('public.producto_idproducto_seq'::regclass);
 B   ALTER TABLE public.producto ALTER COLUMN idproducto DROP DEFAULT;
       public               postgres    false    220    219    220            �           2604    17261    proveedor idproveedor    DEFAULT     ~   ALTER TABLE ONLY public.proveedor ALTER COLUMN idproveedor SET DEFAULT nextval('public.proveedor_idproveedor_seq'::regclass);
 D   ALTER TABLE public.proveedor ALTER COLUMN idproveedor DROP DEFAULT;
       public               postgres    false    222    221    222            �           2604    17489    ruta idruta    DEFAULT     j   ALTER TABLE ONLY public.ruta ALTER COLUMN idruta SET DEFAULT nextval('public.ruta_idruta_seq'::regclass);
 :   ALTER TABLE public.ruta ALTER COLUMN idruta DROP DEFAULT;
       public               postgres    false    245    246    246            �           2604    17375    servicio idservicio    DEFAULT     z   ALTER TABLE ONLY public.servicio ALTER COLUMN idservicio SET DEFAULT nextval('public.servicio_idservicio_seq'::regclass);
 B   ALTER TABLE public.servicio ALTER COLUMN idservicio DROP DEFAULT;
       public               postgres    false    235    236    236            �           2604    25773    usuario idusuario    DEFAULT     v   ALTER TABLE ONLY public.usuario ALTER COLUMN idusuario SET DEFAULT nextval('public.usuario_idusuario_seq'::regclass);
 @   ALTER TABLE public.usuario ALTER COLUMN idusuario DROP DEFAULT;
       public               postgres    false    218    217    218            �          0    17402 	   categoria 
   TABLE DATA           P   COPY public.categoria (idcategoria, nombrecategoria, desccategoria) FROM stdin;
    public               postgres    false    239   ��       �          0    17310    cliente 
   TABLE DATA           �   COPY public.cliente (idcliente, nombrecliente, nombrefcliente, cpcliente, noextcliente, nointcliente, rfccliente, municipio, estado, calle, colonia, ciudad, pais, telefonocliente, correocliente, curpcliente, pfisicacliente) FROM stdin;
    public               postgres    false    228   ��       �          0    17440    clientecategoria 
   TABLE DATA           B   COPY public.clientecategoria (idcliente, idcategoria) FROM stdin;
    public               postgres    false    242   ɸ       �          0    17336    empresa 
   TABLE DATA           �   COPY public.empresa (idempresa, nombreemp, cpempresa, noextempresa, nointempresa, rfcempresa, municipio, estado, calle, colonia, ciudad, pais, telefonoempresa, correoempresa, curpempresa, pfisicaempresa) FROM stdin;
    public               postgres    false    231   �       �          0    17455    empresacategoria 
   TABLE DATA           B   COPY public.empresacategoria (idempresa, idcategoria) FROM stdin;
    public               postgres    false    243   �       �          0    17284 
   fabricante 
   TABLE DATA           �   COPY public.fabricante (idfabricante, nombrefabricante, cpfabricante, noextfabricante, nointfabricante, rfcfabricante, municipio, estado, calle, colonia, ciudad, pais, telefonofabricante, correofabricante, curpfabricante, pfisicafabricante) FROM stdin;
    public               postgres    false    225    �       �          0    17470    fabricantecategoria 
   TABLE DATA           H   COPY public.fabricantecategoria (idfabricante, idcategoria) FROM stdin;
    public               postgres    false    244   =�       �          0    17492    prestadorruta 
   TABLE DATA           <   COPY public.prestadorruta (idprestador, idruta) FROM stdin;
    public               postgres    false    247   Z�       �          0    17362    prestadorservicio 
   TABLE DATA           �   COPY public.prestadorservicio (idprestador, nombreprestador, cpprestador, noextprestador, nointprestador, rfcprestador, municipio, estado, calle, colonia, ciudad, pais, telefonoprest, correoprest, curpprestador, pfisicaprestador) FROM stdin;
    public               postgres    false    234   w�       �          0    17248    producto 
   TABLE DATA           r   COPY public.producto (idproducto, nombreproducto, fichaproducto, alternoproducto, existenciaproducto) FROM stdin;
    public               postgres    false    220   ��       �          0    17410    productocategoria 
   TABLE DATA           D   COPY public.productocategoria (idproducto, idcategoria) FROM stdin;
    public               postgres    false    240   ��       �          0    17319    productocliente 
   TABLE DATA           Y   COPY public.productocliente (idproducto, idcliente, costoventa, monedaventa) FROM stdin;
    public               postgres    false    229   ι       �          0    17345    productoempresa 
   TABLE DATA           ]   COPY public.productoempresa (idproducto, idempresa, costomercado, monedamercado) FROM stdin;
    public               postgres    false    232   �       �          0    17293    productofabricante 
   TABLE DATA           g   COPY public.productofabricante (idproducto, idfabricante, costocomprafab, monedacomprafab) FROM stdin;
    public               postgres    false    226   �       �          0    17267    productoproveedor 
   TABLE DATA           g   COPY public.productoproveedor (idproducto, idproveedor, costocompraprov, monedacompraprov) FROM stdin;
    public               postgres    false    223   %�       �          0    17386    productoservicio 
   TABLE DATA           B   COPY public.productoservicio (idproducto, idservicio) FROM stdin;
    public               postgres    false    237   B�       �          0    17258 	   proveedor 
   TABLE DATA           �   COPY public.proveedor (idproveedor, nombreprov, cpproveedor, noextprov, nointprov, rfcproveedor, municipio, estado, calle, colonia, ciudad, pais, telefonoprov, correoprov, curpproveedor, pfisicaproveedor) FROM stdin;
    public               postgres    false    222   _�       �          0    17425    proveedorcategoria 
   TABLE DATA           F   COPY public.proveedorcategoria (idproveedor, idcategoria) FROM stdin;
    public               postgres    false    241   |�       �          0    17486    ruta 
   TABLE DATA           ?   COPY public.ruta (idruta, salidaruta, destinoruta) FROM stdin;
    public               postgres    false    246   ��       �          0    17372    servicio 
   TABLE DATA           o   COPY public.servicio (idservicio, idprestador, descripcionservicio, costoservicio, monedaservicio) FROM stdin;
    public               postgres    false    236   ��       �          0    17239    usuario 
   TABLE DATA           W   COPY public.usuario (idusuario, nombreusuario, contrasenausuario, permiso) FROM stdin;
    public               postgres    false    218   Ӻ       �           0    0    categoria_idcategoria_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.categoria_idcategoria_seq', 1, false);
          public               postgres    false    238            �           0    0    cliente_idcliente_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cliente_idcliente_seq', 1, false);
          public               postgres    false    227            �           0    0    empresa_idempresa_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.empresa_idempresa_seq', 1, false);
          public               postgres    false    230            �           0    0    fabricante_idfabricante_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.fabricante_idfabricante_seq', 1, false);
          public               postgres    false    224            �           0    0 !   prestadorservicio_idprestador_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.prestadorservicio_idprestador_seq', 1, false);
          public               postgres    false    233            �           0    0    producto_idproducto_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.producto_idproducto_seq', 1, false);
          public               postgres    false    219            �           0    0    proveedor_idproveedor_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.proveedor_idproveedor_seq', 1, false);
          public               postgres    false    221            �           0    0    ruta_idruta_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.ruta_idruta_seq', 1, false);
          public               postgres    false    245            �           0    0    servicio_idservicio_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.servicio_idservicio_seq', 1, false);
          public               postgres    false    235            �           0    0    usuario_idusuario_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usuario_idusuario_seq', 1, true);
          public               postgres    false    217            �           2606    17409    categoria categoria_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (idcategoria);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public                 postgres    false    239            �           2606    17318    cliente cliente_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public                 postgres    false    228            �           2606    17444 &   clientecategoria clientecategoria_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.clientecategoria
    ADD CONSTRAINT clientecategoria_pkey PRIMARY KEY (idcliente, idcategoria);
 P   ALTER TABLE ONLY public.clientecategoria DROP CONSTRAINT clientecategoria_pkey;
       public                 postgres    false    242    242            �           2606    17344    empresa empresa_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (idempresa);
 >   ALTER TABLE ONLY public.empresa DROP CONSTRAINT empresa_pkey;
       public                 postgres    false    231            �           2606    17459 &   empresacategoria empresacategoria_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.empresacategoria
    ADD CONSTRAINT empresacategoria_pkey PRIMARY KEY (idempresa, idcategoria);
 P   ALTER TABLE ONLY public.empresacategoria DROP CONSTRAINT empresacategoria_pkey;
       public                 postgres    false    243    243            �           2606    17292    fabricante fabricante_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.fabricante
    ADD CONSTRAINT fabricante_pkey PRIMARY KEY (idfabricante);
 D   ALTER TABLE ONLY public.fabricante DROP CONSTRAINT fabricante_pkey;
       public                 postgres    false    225            �           2606    17474 ,   fabricantecategoria fabricantecategoria_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.fabricantecategoria
    ADD CONSTRAINT fabricantecategoria_pkey PRIMARY KEY (idfabricante, idcategoria);
 V   ALTER TABLE ONLY public.fabricantecategoria DROP CONSTRAINT fabricantecategoria_pkey;
       public                 postgres    false    244    244            �           2606    17496     prestadorruta prestadorruta_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.prestadorruta
    ADD CONSTRAINT prestadorruta_pkey PRIMARY KEY (idprestador, idruta);
 J   ALTER TABLE ONLY public.prestadorruta DROP CONSTRAINT prestadorruta_pkey;
       public                 postgres    false    247    247            �           2606    17370 (   prestadorservicio prestadorservicio_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.prestadorservicio
    ADD CONSTRAINT prestadorservicio_pkey PRIMARY KEY (idprestador);
 R   ALTER TABLE ONLY public.prestadorservicio DROP CONSTRAINT prestadorservicio_pkey;
       public                 postgres    false    234            �           2606    17256    producto producto_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (idproducto);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public                 postgres    false    220            �           2606    17414 (   productocategoria productocategoria_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.productocategoria
    ADD CONSTRAINT productocategoria_pkey PRIMARY KEY (idproducto, idcategoria);
 R   ALTER TABLE ONLY public.productocategoria DROP CONSTRAINT productocategoria_pkey;
       public                 postgres    false    240    240            �           2606    17324 $   productocliente productocliente_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.productocliente
    ADD CONSTRAINT productocliente_pkey PRIMARY KEY (idproducto, idcliente);
 N   ALTER TABLE ONLY public.productocliente DROP CONSTRAINT productocliente_pkey;
       public                 postgres    false    229    229            �           2606    17350 $   productoempresa productoempresa_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.productoempresa
    ADD CONSTRAINT productoempresa_pkey PRIMARY KEY (idproducto, idempresa);
 N   ALTER TABLE ONLY public.productoempresa DROP CONSTRAINT productoempresa_pkey;
       public                 postgres    false    232    232            �           2606    17298 *   productofabricante productofabricante_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.productofabricante
    ADD CONSTRAINT productofabricante_pkey PRIMARY KEY (idproducto, idfabricante);
 T   ALTER TABLE ONLY public.productofabricante DROP CONSTRAINT productofabricante_pkey;
       public                 postgres    false    226    226            �           2606    17272 (   productoproveedor productoproveedor_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.productoproveedor
    ADD CONSTRAINT productoproveedor_pkey PRIMARY KEY (idproducto, idproveedor);
 R   ALTER TABLE ONLY public.productoproveedor DROP CONSTRAINT productoproveedor_pkey;
       public                 postgres    false    223    223            �           2606    17390 &   productoservicio productoservicio_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.productoservicio
    ADD CONSTRAINT productoservicio_pkey PRIMARY KEY (idproducto, idservicio);
 P   ALTER TABLE ONLY public.productoservicio DROP CONSTRAINT productoservicio_pkey;
       public                 postgres    false    237    237            �           2606    17266    proveedor proveedor_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (idproveedor);
 B   ALTER TABLE ONLY public.proveedor DROP CONSTRAINT proveedor_pkey;
       public                 postgres    false    222            �           2606    17429 *   proveedorcategoria proveedorcategoria_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.proveedorcategoria
    ADD CONSTRAINT proveedorcategoria_pkey PRIMARY KEY (idproveedor, idcategoria);
 T   ALTER TABLE ONLY public.proveedorcategoria DROP CONSTRAINT proveedorcategoria_pkey;
       public                 postgres    false    241    241            �           2606    17491    ruta ruta_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.ruta
    ADD CONSTRAINT ruta_pkey PRIMARY KEY (idruta);
 8   ALTER TABLE ONLY public.ruta DROP CONSTRAINT ruta_pkey;
       public                 postgres    false    246            �           2606    17380    servicio servicio_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pkey PRIMARY KEY (idservicio);
 @   ALTER TABLE ONLY public.servicio DROP CONSTRAINT servicio_pkey;
       public                 postgres    false    236            �           2606    17509     categoria unique_nombrecategoria 
   CONSTRAINT     f   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT unique_nombrecategoria UNIQUE (nombrecategoria);
 J   ALTER TABLE ONLY public.categoria DROP CONSTRAINT unique_nombrecategoria;
       public                 postgres    false    239            �           2606    17246 !   usuario usuario_nombreusuario_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nombreusuario_key UNIQUE (nombreusuario);
 K   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_nombreusuario_key;
       public                 postgres    false    218            �           2606    17244    usuario usuario_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (idusuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public                 postgres    false    218                       2606    17450 2   clientecategoria clientecategoria_idcategoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clientecategoria
    ADD CONSTRAINT clientecategoria_idcategoria_fkey FOREIGN KEY (idcategoria) REFERENCES public.categoria(idcategoria);
 \   ALTER TABLE ONLY public.clientecategoria DROP CONSTRAINT clientecategoria_idcategoria_fkey;
       public               postgres    false    4835    239    242                       2606    17445 0   clientecategoria clientecategoria_idcliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clientecategoria
    ADD CONSTRAINT clientecategoria_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);
 Z   ALTER TABLE ONLY public.clientecategoria DROP CONSTRAINT clientecategoria_idcliente_fkey;
       public               postgres    false    4821    228    242                       2606    17465 2   empresacategoria empresacategoria_idcategoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empresacategoria
    ADD CONSTRAINT empresacategoria_idcategoria_fkey FOREIGN KEY (idcategoria) REFERENCES public.categoria(idcategoria);
 \   ALTER TABLE ONLY public.empresacategoria DROP CONSTRAINT empresacategoria_idcategoria_fkey;
       public               postgres    false    4835    239    243                       2606    17460 0   empresacategoria empresacategoria_idempresa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empresacategoria
    ADD CONSTRAINT empresacategoria_idempresa_fkey FOREIGN KEY (idempresa) REFERENCES public.empresa(idempresa);
 Z   ALTER TABLE ONLY public.empresacategoria DROP CONSTRAINT empresacategoria_idempresa_fkey;
       public               postgres    false    231    4825    243                       2606    17480 8   fabricantecategoria fabricantecategoria_idcategoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fabricantecategoria
    ADD CONSTRAINT fabricantecategoria_idcategoria_fkey FOREIGN KEY (idcategoria) REFERENCES public.categoria(idcategoria);
 b   ALTER TABLE ONLY public.fabricantecategoria DROP CONSTRAINT fabricantecategoria_idcategoria_fkey;
       public               postgres    false    4835    244    239                       2606    17475 9   fabricantecategoria fabricantecategoria_idfabricante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fabricantecategoria
    ADD CONSTRAINT fabricantecategoria_idfabricante_fkey FOREIGN KEY (idfabricante) REFERENCES public.fabricante(idfabricante);
 c   ALTER TABLE ONLY public.fabricantecategoria DROP CONSTRAINT fabricantecategoria_idfabricante_fkey;
       public               postgres    false    225    244    4817            	           2606    17497 ,   prestadorruta prestadorruta_idprestador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestadorruta
    ADD CONSTRAINT prestadorruta_idprestador_fkey FOREIGN KEY (idprestador) REFERENCES public.prestadorservicio(idprestador);
 V   ALTER TABLE ONLY public.prestadorruta DROP CONSTRAINT prestadorruta_idprestador_fkey;
       public               postgres    false    234    247    4829            
           2606    17502 '   prestadorruta prestadorruta_idruta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestadorruta
    ADD CONSTRAINT prestadorruta_idruta_fkey FOREIGN KEY (idruta) REFERENCES public.ruta(idruta);
 Q   ALTER TABLE ONLY public.prestadorruta DROP CONSTRAINT prestadorruta_idruta_fkey;
       public               postgres    false    4849    246    247            �           2606    17420 4   productocategoria productocategoria_idcategoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productocategoria
    ADD CONSTRAINT productocategoria_idcategoria_fkey FOREIGN KEY (idcategoria) REFERENCES public.categoria(idcategoria);
 ^   ALTER TABLE ONLY public.productocategoria DROP CONSTRAINT productocategoria_idcategoria_fkey;
       public               postgres    false    240    4835    239                        2606    17415 3   productocategoria productocategoria_idproducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productocategoria
    ADD CONSTRAINT productocategoria_idproducto_fkey FOREIGN KEY (idproducto) REFERENCES public.producto(idproducto);
 ]   ALTER TABLE ONLY public.productocategoria DROP CONSTRAINT productocategoria_idproducto_fkey;
       public               postgres    false    4811    240    220            �           2606    17330 .   productocliente productocliente_idcliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productocliente
    ADD CONSTRAINT productocliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);
 X   ALTER TABLE ONLY public.productocliente DROP CONSTRAINT productocliente_idcliente_fkey;
       public               postgres    false    4821    228    229            �           2606    17325 /   productocliente productocliente_idproducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productocliente
    ADD CONSTRAINT productocliente_idproducto_fkey FOREIGN KEY (idproducto) REFERENCES public.producto(idproducto);
 Y   ALTER TABLE ONLY public.productocliente DROP CONSTRAINT productocliente_idproducto_fkey;
       public               postgres    false    4811    220    229            �           2606    17356 .   productoempresa productoempresa_idempresa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productoempresa
    ADD CONSTRAINT productoempresa_idempresa_fkey FOREIGN KEY (idempresa) REFERENCES public.empresa(idempresa);
 X   ALTER TABLE ONLY public.productoempresa DROP CONSTRAINT productoempresa_idempresa_fkey;
       public               postgres    false    4825    231    232            �           2606    17351 /   productoempresa productoempresa_idproducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productoempresa
    ADD CONSTRAINT productoempresa_idproducto_fkey FOREIGN KEY (idproducto) REFERENCES public.producto(idproducto);
 Y   ALTER TABLE ONLY public.productoempresa DROP CONSTRAINT productoempresa_idproducto_fkey;
       public               postgres    false    4811    220    232            �           2606    17304 7   productofabricante productofabricante_idfabricante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productofabricante
    ADD CONSTRAINT productofabricante_idfabricante_fkey FOREIGN KEY (idfabricante) REFERENCES public.fabricante(idfabricante);
 a   ALTER TABLE ONLY public.productofabricante DROP CONSTRAINT productofabricante_idfabricante_fkey;
       public               postgres    false    4817    226    225            �           2606    17299 5   productofabricante productofabricante_idproducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productofabricante
    ADD CONSTRAINT productofabricante_idproducto_fkey FOREIGN KEY (idproducto) REFERENCES public.producto(idproducto);
 _   ALTER TABLE ONLY public.productofabricante DROP CONSTRAINT productofabricante_idproducto_fkey;
       public               postgres    false    4811    226    220            �           2606    17273 3   productoproveedor productoproveedor_idproducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productoproveedor
    ADD CONSTRAINT productoproveedor_idproducto_fkey FOREIGN KEY (idproducto) REFERENCES public.producto(idproducto);
 ]   ALTER TABLE ONLY public.productoproveedor DROP CONSTRAINT productoproveedor_idproducto_fkey;
       public               postgres    false    223    4811    220            �           2606    17278 4   productoproveedor productoproveedor_idproveedor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productoproveedor
    ADD CONSTRAINT productoproveedor_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES public.proveedor(idproveedor);
 ^   ALTER TABLE ONLY public.productoproveedor DROP CONSTRAINT productoproveedor_idproveedor_fkey;
       public               postgres    false    4813    223    222            �           2606    17391 1   productoservicio productoservicio_idproducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productoservicio
    ADD CONSTRAINT productoservicio_idproducto_fkey FOREIGN KEY (idproducto) REFERENCES public.producto(idproducto);
 [   ALTER TABLE ONLY public.productoservicio DROP CONSTRAINT productoservicio_idproducto_fkey;
       public               postgres    false    4811    220    237            �           2606    17396 1   productoservicio productoservicio_idservicio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productoservicio
    ADD CONSTRAINT productoservicio_idservicio_fkey FOREIGN KEY (idservicio) REFERENCES public.servicio(idservicio);
 [   ALTER TABLE ONLY public.productoservicio DROP CONSTRAINT productoservicio_idservicio_fkey;
       public               postgres    false    4831    237    236                       2606    17435 6   proveedorcategoria proveedorcategoria_idcategoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.proveedorcategoria
    ADD CONSTRAINT proveedorcategoria_idcategoria_fkey FOREIGN KEY (idcategoria) REFERENCES public.categoria(idcategoria);
 `   ALTER TABLE ONLY public.proveedorcategoria DROP CONSTRAINT proveedorcategoria_idcategoria_fkey;
       public               postgres    false    4835    241    239                       2606    17430 6   proveedorcategoria proveedorcategoria_idproveedor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.proveedorcategoria
    ADD CONSTRAINT proveedorcategoria_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES public.proveedor(idproveedor);
 `   ALTER TABLE ONLY public.proveedorcategoria DROP CONSTRAINT proveedorcategoria_idproveedor_fkey;
       public               postgres    false    222    4813    241            �           2606    17381 "   servicio servicio_idprestador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_idprestador_fkey FOREIGN KEY (idprestador) REFERENCES public.prestadorservicio(idprestador);
 L   ALTER TABLE ONLY public.servicio DROP CONSTRAINT servicio_idprestador_fkey;
       public               postgres    false    4829    234    236            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x�3�LL��̃�%\1z\\\ Dz�     