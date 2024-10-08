PGDMP                          |            eshop    15.8    15.8 -    1           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            2           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            3           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            4           1262    213371    eshop    DATABASE     x   CREATE DATABASE eshop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE eshop;
                postgres    false            �            1259    213404    cart    TABLE     �   CREATE TABLE public.cart (
    id integer NOT NULL,
    enduserid integer NOT NULL,
    productid integer NOT NULL,
    quantity integer NOT NULL
);
    DROP TABLE public.cart;
       public         heap    postgres    false            �            1259    213403    cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cart_id_seq;
       public          postgres    false    221            5           0    0    cart_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;
          public          postgres    false    220            �            1259    213393    enduser    TABLE     �   CREATE TABLE public.enduser (
    id integer NOT NULL,
    goodname character varying(10) NOT NULL,
    email character varying(50) NOT NULL,
    password text NOT NULL,
    mobile character varying(10) NOT NULL
);
    DROP TABLE public.enduser;
       public         heap    postgres    false            �            1259    213392    enduser_id_seq    SEQUENCE     �   CREATE SEQUENCE public.enduser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.enduser_id_seq;
       public          postgres    false    219            6           0    0    enduser_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.enduser_id_seq OWNED BY public.enduser.id;
          public          postgres    false    218            �            1259    213420    eshop    TABLE     �   CREATE TABLE public.eshop (
    id integer NOT NULL,
    eshopname character varying(20) NOT NULL,
    eshopdescription character varying(500) NOT NULL,
    eshopsearchtags character varying(500) NOT NULL,
    eshopcoverimage character varying(200)
);
    DROP TABLE public.eshop;
       public         heap    postgres    false            �            1259    213411 
   eshopowner    TABLE     �   CREATE TABLE public.eshopowner (
    id integer NOT NULL,
    goodname character varying(10) NOT NULL,
    email character varying(50) NOT NULL,
    password text NOT NULL,
    mobile character varying(10) NOT NULL,
    eshopid integer NOT NULL
);
    DROP TABLE public.eshopowner;
       public         heap    postgres    false            �            1259    213410    eshop_id_seq    SEQUENCE     �   CREATE SEQUENCE public.eshop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.eshop_id_seq;
       public          postgres    false    223            7           0    0    eshop_id_seq    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.eshop_id_seq OWNED BY public.eshopowner.id;
          public          postgres    false    222            �            1259    213419    eshop_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.eshop_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.eshop_id_seq1;
       public          postgres    false    225            8           0    0    eshop_id_seq1    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.eshop_id_seq1 OWNED BY public.eshop.id;
          public          postgres    false    224            �            1259    213373    orderdetails    TABLE     �  CREATE TABLE public.orderdetails (
    id integer NOT NULL,
    enduserid integer NOT NULL,
    productid integer NOT NULL,
    billingamount double precision NOT NULL,
    quantity integer,
    userratings integer,
    reviewcomment character varying(500),
    reviewimage character varying(200),
    cancelled boolean DEFAULT false NOT NULL,
    returned boolean DEFAULT false NOT NULL,
    dispatched boolean DEFAULT false NOT NULL,
    delivered boolean DEFAULT false NOT NULL
);
     DROP TABLE public.orderdetails;
       public         heap    postgres    false            �            1259    213384    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    productname character varying(200) NOT NULL,
    productdescription character varying(500) NOT NULL,
    searchtags character varying(500) NOT NULL,
    productimage character varying(200) NOT NULL,
    eshopid integer NOT NULL,
    price double precision NOT NULL,
    outofstock boolean DEFAULT false NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    percentdiscount integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    213383    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    217            9           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    216            �            1259    213372    userproductdetails_id_seq    SEQUENCE     �   CREATE SEQUENCE public.userproductdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.userproductdetails_id_seq;
       public          postgres    false    215            :           0    0    userproductdetails_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.userproductdetails_id_seq OWNED BY public.orderdetails.id;
          public          postgres    false    214            �           2604    213407    cart id    DEFAULT     b   ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);
 6   ALTER TABLE public.cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    213396 
   enduser id    DEFAULT     h   ALTER TABLE ONLY public.enduser ALTER COLUMN id SET DEFAULT nextval('public.enduser_id_seq'::regclass);
 9   ALTER TABLE public.enduser ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    213423    eshop id    DEFAULT     e   ALTER TABLE ONLY public.eshop ALTER COLUMN id SET DEFAULT nextval('public.eshop_id_seq1'::regclass);
 7   ALTER TABLE public.eshop ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    213414    eshopowner id    DEFAULT     i   ALTER TABLE ONLY public.eshopowner ALTER COLUMN id SET DEFAULT nextval('public.eshop_id_seq'::regclass);
 <   ALTER TABLE public.eshopowner ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            ~           2604    213376    orderdetails id    DEFAULT     x   ALTER TABLE ONLY public.orderdetails ALTER COLUMN id SET DEFAULT nextval('public.userproductdetails_id_seq'::regclass);
 >   ALTER TABLE public.orderdetails ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    213387 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            *          0    213404    cart 
   TABLE DATA           B   COPY public.cart (id, enduserid, productid, quantity) FROM stdin;
    public          postgres    false    221   �2       (          0    213393    enduser 
   TABLE DATA           H   COPY public.enduser (id, goodname, email, password, mobile) FROM stdin;
    public          postgres    false    219   �2       .          0    213420    eshop 
   TABLE DATA           b   COPY public.eshop (id, eshopname, eshopdescription, eshopsearchtags, eshopcoverimage) FROM stdin;
    public          postgres    false    225   �3       ,          0    213411 
   eshopowner 
   TABLE DATA           T   COPY public.eshopowner (id, goodname, email, password, mobile, eshopid) FROM stdin;
    public          postgres    false    223   �4       $          0    213373    orderdetails 
   TABLE DATA           �   COPY public.orderdetails (id, enduserid, productid, billingamount, quantity, userratings, reviewcomment, reviewimage, cancelled, returned, dispatched, delivered) FROM stdin;
    public          postgres    false    215   �5       &          0    213384    product 
   TABLE DATA           �   COPY public.product (id, productname, productdescription, searchtags, productimage, eshopid, price, outofstock, deleted, percentdiscount) FROM stdin;
    public          postgres    false    217   �5       ;           0    0    cart_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cart_id_seq', 1, false);
          public          postgres    false    220            <           0    0    enduser_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.enduser_id_seq', 5, true);
          public          postgres    false    218            =           0    0    eshop_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.eshop_id_seq', 4, true);
          public          postgres    false    222            >           0    0    eshop_id_seq1    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.eshop_id_seq1', 5, true);
          public          postgres    false    224            ?           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 1, false);
          public          postgres    false    216            @           0    0    userproductdetails_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.userproductdetails_id_seq', 1, false);
          public          postgres    false    214            �           2606    213409    cart cart_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public            postgres    false    221            �           2606    213400    enduser enduser_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.enduser
    ADD CONSTRAINT enduser_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.enduser DROP CONSTRAINT enduser_pkey;
       public            postgres    false    219            �           2606    213418    eshopowner eshop_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.eshopowner
    ADD CONSTRAINT eshop_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.eshopowner DROP CONSTRAINT eshop_pkey;
       public            postgres    false    223            �           2606    213391    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    217            �           2606    213382 $   orderdetails userproductdetails_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT userproductdetails_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT userproductdetails_pkey;
       public            postgres    false    215            *      x������ � �      (   �   x�m͹�0  й��Z.��Q�& �R�Dn��_o�\�����r��a퇖���D,��"%����[!��.Ůw��4�K������w���!1�9�$+�^�	�*��b�7���1�n�΄� �uw5Q�[��)����1-u�Dwm(��it~�'�~��<�      .   �   x��αj�0��Yz�� ��v�%J)n)J�v����\E2���oH�����Ç���<<{6��3I�).�2����M;8����,�xO3O`yq���w������ijO6�
r�zh!�)����f[##5��,)z}�Qc�k]凝ֈw��ۢ\]��h��~��͞�=�
�z���zY�}�/T���u}Q}+)�/S��a      ,     x�uбv�0 ��9y�$���RI+�, �F��o�š.w��G�'UR��u�Z�k��F�h�@M#e���q��oϮ�hǳ��c�OI��0�u�c�+J�9߲�ܮ���Tg�o5�B��(��p���l�sw3I�N\�ּ�BEX�9V�Ӡ5)�����ҮFZ�����!�>�=,�����E��D��ׅ��Ԧ��,ڀGAk����93A�f��k���>�=l3Ђz]���ET����Br��d�.V;�8���p�c�,C�+��{�i�AsN�      $      x������ � �      &      x������ � �     